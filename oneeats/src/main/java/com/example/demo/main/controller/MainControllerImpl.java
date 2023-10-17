package com.example.demo.main.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.toss.dto.TossDTO;
import com.example.demo.main.service.MainService;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.RecipeVO;

@Controller("mainController")
public class MainControllerImpl implements MainController {
	@Autowired
	private MainService mainService;

	@Autowired
	private GoodsVO goodsVo;

	@RequestMapping(value = "/main/mainPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		List<HotDealVO> newHotDealList = mainService.selectNewHotDealList();
		mav.addObject("newHotDealList", newHotDealList);

		List<GoodsVO> newGoodsList = mainService.selectNewGoodsList();
		mav.addObject("newGoodsList", newGoodsList);

		List<RecipeVO> newRecipeList = mainService.selectNewRecipeList();
		mav.addObject("newRecipeList", newRecipeList);

		List<GoodsVO> bestGoodsList = mainService.selectBestGoodsList();
		mav.addObject("bestGoodsList", bestGoodsList);

		List<GoodsVO> topReviewGoodsList = mainService.selectTopReviewGoodsList();
		mav.addObject("topReviewGoodsList", topReviewGoodsList);

		return mav;
	}

	@RequestMapping(value = "/main/cart.do")
	public ModelAndView cart(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String previousPage = request.getHeader("Referer");
		mav.addObject("previousPage", previousPage);

		return mav;
	}

	@ResponseBody
	@PostMapping("/addCartOption.do")
	public String addCartOptionOne(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String result = "success";
		HttpSession session = request.getSession();
		try {
			String _optionNo = request.getParameter("optionNo");
			List<CartVO> cartList = new ArrayList<CartVO>();
			
			if (session.getAttribute("cartList") != null) {
				cartList = (List<CartVO>) session.getAttribute("cartList");
			}

			// 같은 옵션으로 주문한 정보가 있는지 참조하기 위한 맵
			Map<Integer, Integer> optionNoToidxMap = new HashMap();
			for (int i = 0; i < cartList.size(); i++) {
				CartVO temp = cartList.get(i);
				optionNoToidxMap.put(temp.getOptionNo(), i);
			}

			int optionNo = Integer.parseInt(_optionNo);

			// 이미 존재하면 그 index에서 빼와서 GoodsQty를 더해줌
			if (optionNoToidxMap.containsKey(optionNo)) {
				int idx = optionNoToidxMap.get(optionNo);

				CartVO tempcart = cartList.get(idx);
				System.out.println("존재해서 더함 : " + tempcart);
				tempcart.setGoodsQty(1 + tempcart.getGoodsQty());
				tempcart.setDiscountPrice();
				System.out.println("계산 후 : " + tempcart);
				cartList.set(idx, tempcart);
			} else {
				CartVO tempcart = new CartVO();
				tempcart = mainService.selectOptionByNo(optionNo);
				tempcart.setGoodsQty(1);
				tempcart.setDiscountPrice();
				cartList.add(tempcart);
				optionNoToidxMap.put(optionNo, cartList.size() - 1);
			}

			System.out.println("cartList" + cartList);

			session.setAttribute("cartList", cartList);
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	// ajax로 cartList를 session에 저장하기 위한 코드
	@ResponseBody
	@PostMapping(value = "/addCartToListValue.do")
	public String storeValueInSession(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String result = "success";
		HttpSession session = request.getSession();
		try {
			String[] optionNos = request.getParameterValues("optionNo");
			String[] goodsQtys = request.getParameterValues("goodsQty");
			List<CartVO> cartList = new ArrayList<CartVO>();

			if (session.getAttribute("cartList") != null) {
				cartList = (List<CartVO>) session.getAttribute("cartList");
				session.removeAttribute("cartList");
			}

			// 같은 옵션으로 주문한 정보가 있는지 참조하기 위한 맵
			Map<Integer, Integer> optionNoToidxMap = new HashMap();
			for (int i = 0; i < cartList.size(); i++) {
				CartVO temp = cartList.get(i);
				optionNoToidxMap.put(temp.getOptionNo(), i);
			}

			// cartList에 하나씩 추가
			for (int i = 0; i < optionNos.length; i++) {
				int optionNo = Integer.parseInt(optionNos[i]);
				int goodsQty = Integer.parseInt(goodsQtys[i]);

				// 이미 존재하면 그 index에서 빼와서 GoodsQty를 더해줌
				if (optionNoToidxMap.containsKey(optionNo)) {
					int idx = optionNoToidxMap.get(optionNo);

					CartVO tempcart = cartList.get(idx);
					System.out.println("존재해서 더함 : " + tempcart);
					tempcart.setGoodsQty(goodsQty + tempcart.getGoodsQty());
					tempcart.setDiscountPrice();
					System.out.println("계산 후 : " + tempcart);
					cartList.set(idx, tempcart);
				} else {
					CartVO tempcart = new CartVO();
					tempcart = mainService.selectOptionByNo(optionNo);
					tempcart.setGoodsQty(goodsQty);
					tempcart.setDiscountPrice();
					cartList.add(tempcart);
					optionNoToidxMap.put(optionNo, cartList.size() - 1);
				}
			}
			System.out.println("cartList" + cartList);

			session.setAttribute("cartList", cartList);
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}

		return result;
	}

	// ajax로 카트에 상품을 하나 담기 위한 코드
	@ResponseBody
	@PostMapping(value = "/addCartItem.do")
	public String addCartItem(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String result = "success";
		HttpSession session = request.getSession();
		try {
			List<CartVO> cartList = new ArrayList<CartVO>();

			if (session.getAttribute("cartList") != null) {
				cartList = (List<CartVO>) session.getAttribute("cartList");
			}

			String _goodsNo = request.getParameter("num");
			int goodsNo = Integer.parseInt(_goodsNo);
			CartVO tempcart = mainService.selectOneOptionByGoodsNo(goodsNo);
			tempcart.setGoodsQty(1);
			tempcart.setDiscountPrice();

			int idx = -1;
			for (int i = 0; i < cartList.size(); i++) {
				CartVO t = cartList.get(i);
				int tempoptionNo = t.getOptionNo();
				if (tempoptionNo == tempcart.getOptionNo()) {
					idx = i;
					break;
				}
			}
			if (idx > -1) {
				CartVO tempcart2 = cartList.get(idx);
				tempcart2.setGoodsQty(tempcart.getGoodsQty() + tempcart2.getGoodsQty());
				tempcart2.setDiscountPrice();
				cartList.set(idx, tempcart2);
			} else {
				cartList.add(tempcart);
			}

			System.out.println("cartList" + cartList);

			session.setAttribute("cartList", cartList);
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}

		return result;
	}

	// ajax로 cart에 담긴 상품을 지우기 위한 코드
	@ResponseBody
	@PostMapping(value = "/removeCartItem.do")
	public String removeCartItem(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String result = "success";
		HttpSession session = request.getSession();
		List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");
		String _optionNo = request.getParameter("num");
		System.out.println("option_no = " + _optionNo);
		try {
			int optionNo = Integer.parseInt(_optionNo);
			int idx = -1;
			for (int i = 0; i < cartList.size(); i++) {
				CartVO carttemp = cartList.get(i);
				if (carttemp.getOptionNo() == optionNo) {
					idx = i;
					break;
				}
			}
			cartList.remove(idx);

		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}

		return result;
	}

	@RequestMapping(value = "/orderNow.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView orderNow(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("memberInfo");

		// 상품 상세 페이지에서 넘겨준 옵션 선택 정보를 session에 저장
		// 그런데 이제 로그인이 안 되어 있어 로그인 페이지로 다녀온 경우는 이 과정을 생략
		List<OrderVO> orderNowList = (List<OrderVO>) session.getAttribute("selectGoodsList");

		String loginFor = (String) session.getAttribute("loginFor");
		if (orderNowList != null && orderNowList.size() > 0 && loginFor != null && loginFor.equals("orderNow")) {
			System.out.println("주문 상품을 선택한 정보가 있음");
			// 첫번째 원소로부터 할인 가격등을 가져와 모델에
			int shippingFee = orderNowList.get(0).getShippingfee();
			int paymentPrice = orderNowList.get(0).getPayment_price();
			int discountPrice = orderNowList.get(0).getDiscount_price();

			mav.addObject("shippingFee", shippingFee);
			mav.addObject("payment_price", paymentPrice);
			mav.addObject("discount_price", discountPrice);
			session.removeAttribute("loginFor");

		} else {
			orderNowList = new ArrayList<OrderVO>();
			try {

				// request에서 정보를 받아옴
				String shippingFee = request.getParameter("shippingFee");
				String paymentPrice = request.getParameter("payment_price");
				String discountPrice = request.getParameter("discount_price");
				String[] optionNos = request.getParameterValues("optionNo");
				String[] goodsQtys = request.getParameterValues("goodsQty");
				// list에 하나씩 추가
				for (int i = 0; i < optionNos.length; i++) {

					System.out.println(goodsQtys[i]);
					System.out.println(optionNos[i]);
					OrderVO temp = mainService.selectOptionsGoodsToOrderByOptionNo(Integer.parseInt(optionNos[i]));
					temp.setGoods_qty(Integer.parseInt(goodsQtys[i]));
					temp.setShippingfee(Integer.parseInt(shippingFee));
					temp.setPayment_price(Integer.parseInt(paymentPrice));
					temp.setDiscount_price(Integer.parseInt(discountPrice));
					orderNowList.add(temp);
				}
				System.out.println("orderNowList" + orderNowList);

				mav.addObject("selectGoodsList", orderNowList);
				session.setAttribute("selectGoodsList", orderNowList);

				mav.addObject("shippingFee", shippingFee);
				mav.addObject("payment_price", paymentPrice);
				mav.addObject("discount_price", discountPrice);

			} catch (Exception e) {
				e.printStackTrace();
				String previousPage = request.getHeader("Referer");
				mav = Alert.alertAndRedirect("주문 정보를 받아오지 못 했습니다.", previousPage);
				return mav;
			}
		}

		if (loginMember == null || loginMember.getId().length() < 1) {
			mav = Alert.alertAndRedirect("로그인이 필요한 페이지입니다.", request.getContextPath() + "/member/loginForm.do");
			session.setAttribute("loginFor", "orderNow");
			return mav;
		}

		// 멤버에서 쿠폰 리스트를 받아옴
		try {
			List<CouponVO> couponList = mainService.selectCouponByMemberNo(loginMember.getMemberNo());
			mav.addObject("couponList", couponList);
			mav.setViewName("/mypage/orderConfirm");

		} catch (Exception e) {
			// 에러가 나면 이전 페이지로 이동
			e.printStackTrace();
			String previousPage = request.getHeader("Referer");
			mav = Alert.alertAndRedirect("주문자 정보를 받아오지 못 했습니다.", previousPage);
			return mav;
		}
		System.out.println(mav);
		return mav;
	}

}
