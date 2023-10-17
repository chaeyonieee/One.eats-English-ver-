package com.example.demo.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.toss.dto.TossDTO;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.common.functions.GeneralFunctions;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.PointHistoryVO;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value = "/mypage/deleteMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		response.setContentType("html/text;charset=utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		mypageService.deleteMember(member);
		session.setAttribute("isLogOn", false);
		mav = Alert.alertAndRedirect("탈퇴가 완료 되었습니다.", request.getContextPath() + "/main/mainPage.do");

		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/orderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderList");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("memberNo="+memberNo);
		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String order_search_type = request.getParameter("order_search_type");
		int pageNum;
		int section;
		if (_pageNum == null || _pageNum.length() <= 0) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(_pageNum);
		}
		if (_section == null || _section.length() <= 0) {
			section = 1;
		} else {
			section = Integer.parseInt(_section);
		}
		if (order_search_type == null || order_search_type.length() <= 0) {
			order_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("order_search_type", order_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 6);
		pagingMap.put("memberNo", memberNo);
		
		List<OrderVO> orderList = mypageService.selectOrderByMemberNo(pagingMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("order_search_type", order_search_type);
		map.put("memberNo", memberNo);
		
		int totalOrderNum = mypageService.selectCountOrderNum(map);
		System.out.println("orderList=" + orderList);
		System.out.println("totalOrderNum="+totalOrderNum);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(pagingMap);
		mav.addObject("order_search_type", order_search_type);
		mav.addObject("orderList", orderList);
		mav.addObject("totalOrderNum", totalOrderNum);
		System.out.println(mav);
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/orderDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderDetail(@RequestParam(required = false, value = "orderNo") int orderNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		List<OrderVO> orderDetail = mypageService.selectOrderByOrderNo(orderNo);
		orderVO = orderDetail.get(0);
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		mav.addObject("orderDetail", orderDetail);
		mav.addObject("order", orderVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/orderConfirm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderConfirm");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		if (member == null || member.getId().length() < 1) {
			mav = Alert.alertAndRedirect("로그인이 필요한 페이지입니다.", request.getContextPath() + "/member/loginForm.do");
			return mav;
		}

		try {
			int memberNo = member.getMemberNo();
			String viewName = (String) request.getAttribute("viewName");

			String[] goodsNos = request.getParameterValues("goodsNo");
			String[] goodsQtys = request.getParameterValues("goodsQty");
			String[] goodsInbun = request.getParameterValues("goodsInbun");
			String[] optionNos = request.getParameterValues("optionNo");
			String shippingFee = request.getParameter("shippingFee");
			String payment_price = request.getParameter("payment_price");
			String discount_price = request.getParameter("discount_price");

			List<CouponVO> couponList = mypageService.selectCouponByMemberNo(memberNo);

			List<OrderVO> selectGoodsList = new ArrayList();
			for (int i = 0; i < goodsNos.length; i++) {
				OrderVO temp = new OrderVO();
				temp.setGoodsNo(Integer.parseInt(goodsNos[i]));
				temp.setGoods_qty(Integer.parseInt(goodsQtys[i]));
				temp.setGoods_inbun(goodsInbun[i]);
				temp.setOptionNo(Integer.parseInt(optionNos[i]));
				temp.setShippingfee(Integer.parseInt(shippingFee));
				temp.setPayment_price(Integer.parseInt(payment_price));
				temp.setDiscount_price(Integer.parseInt(discount_price));
				selectGoodsList.add(temp);
			}

			mav.setViewName(viewName);
			mav.addObject("payment_price", payment_price);
			mav.addObject("shippingFee", shippingFee);
			mav.addObject("discount_price", discount_price);
			mav.addObject("selectGoodsList", selectGoodsList);
			mav.addObject("couponList", couponList);
			session.setAttribute("selectGoodsList", selectGoodsList);
		} catch (Exception e) {
			e.printStackTrace();
			String previousPage = request.getHeader("Referer");
			mav = Alert.alertAndRedirect("Unable to retrieve order information.", previousPage);
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/newOrder.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 newOrder");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		ModelAndView mav = new ModelAndView();

		try {
			Map payInfoMap = new HashMap();
			int memberNo = member.getMemberNo();
			int orderNo = (int) session.getAttribute("tempOrderNo");
			TossDTO tossInfo = (TossDTO) session.getAttribute("tossInfo");
			String payment_type = tossInfo.getPaymentType();
			long totalAmount = tossInfo.getTotalAmount();
			String json_data = tossInfo.getJson_data();
			payInfoMap.put("json_data", json_data);
			payInfoMap.put("memberNo", memberNo);
			payInfoMap.put("orderNo", orderNo);
			OrderVO tempOrder = mypageService.selectTempOrder(payInfoMap);

			int used_point = tempOrder.getUsed_point();
			int used_couponId = tempOrder.getUsed_couponId();
			
			payInfoMap.put("used_point", -used_point);
			payInfoMap.put("used_couponId", used_couponId);
			payInfoMap.put("payment_type", payment_type);
			payInfoMap.put("total_price", totalAmount);
			
			mypageService.updateTempOrderList(payInfoMap);

			mav = new ModelAndView("redirect:/mypage/orderList.do");
			session.removeAttribute("cartList");
			session.removeAttribute("selectGoodsList");
			session.removeAttribute("tempOrderNo");
		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("오류가 발생하였습니다.", "redirect:/mypage/orderConfirm.do");
		}

		return mav;
	}

	@RequestMapping(value = "/mypage/orderCancel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");

		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		List<OrderVO> orderCancel = mypageService.selectOrderByOrderNo(orderNo);
		orderVO = orderCancel.get(0);

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("orderCancel", orderCancel);
		mav.addObject("order", orderVO);
		session.setAttribute("orderCancel", orderCancel);

		String order_tossData = mypageService.selectTossApiByOrderNo(orderNo);
		JSONParser parser = new JSONParser();
		String paymentKey = "";
		try {
			JSONObject tossJsonData = (JSONObject) parser.parse(order_tossData);
			TossDTO tossInfo = new TossDTO(tossJsonData);
			paymentKey = tossInfo.getPaymentKey();
			mav.addObject("paymentKey", paymentKey);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "/mypage/orderCancelResult.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderCancelResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderCancelResult");
		request.setCharacterEncoding("utf-8");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));

		int[] order_seqNos = mypageService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			mypageService.updateDeliveryStatusToCancel(order_seqNo);
		}

		ModelAndView mav = new ModelAndView("redirect:/mypage/orderList.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/myPageMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPageMain(@RequestParam(required = false, value = "message") String message,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 myPageMain.do");
		HttpSession session = request.getSession();
		session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getId();
		// String member_id=memberVO.getId();
		MemberVO myList = mypageService.listMyPage(member_id);
		System.out.println("myList = " + myList);
		mav.addObject("myList", myList);
		mav.setViewName("/mypage/mypageProfileModForm");
		return mav;
	}

	// 민아 프로필편집 2
	@Override
	@RequestMapping(value = "/mypage/mypageintro.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageintro(MultipartHttpServletRequest request) throws Exception {
		System.out.println("여기는 mypageintro.do");
		String nickname = request.getParameter("nickname");
		String intro = request.getParameter("intro");
		System.out.println(intro);
		HttpSession session = request.getSession();
		session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		String id = memberInfo.getId();
		List fileList = GeneralFileUploader.upload(request, "/member/" + memberNo);
		String profileImg = (String) fileList.get(0);
		System.out.println("fileList : " + fileList);
		System.out.println("profileImg : " + profileImg);

		HashMap<String, String> memberMap = new HashMap<String, String>();
		memberMap.put("profileImg", profileImg);
		memberMap.put("nickname", nickname);
		memberMap.put("intro", intro);
		memberMap.put("id", id);
		System.out.println("memberMap = " + memberMap);
		mypageService.mypageintro(memberMap);

		ModelAndView mav = new ModelAndView();
		mav.addObject("memberMap", memberMap);
		mav = Alert.alertAndRedirect("저장되었습니다.", request.getContextPath() + "/mypage/myPageMain.do");
		return mav;

	}

	// 민아 찜 (진행중 ...)
	@Override
	@RequestMapping(value = "/mypage/mypageBookmarkList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller bookmarkList.do");
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		if (memberInfo == null || memberInfo.getId().trim().length() < 1) {
			mav = Alert.alertAndRedirect("로그인이 필요한 페이지입니다.", request.getContextPath() + "/member/loginForm.do");
			return mav;
		}
		int memberNo = memberInfo.getMemberNo();
		System.out.println("memberInfo = " + memberInfo);
		request.setCharacterEncoding("utf-8");
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}

		try {
			int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 10;
			pagingMap.put("start", start);
			pagingMap.put("memberNo", memberNo);
			List<BookmarkVO> bookList = mypageService.selectBookListWithPagingMap(pagingMap);
			mav.addAllObjects(pagingMap);
			mav.addObject("bookList", bookList);
			System.out.println("bookList = " + bookList);
			int totalBookListNum = mypageService.selectBookListTotalNum(memberNo);
			mav.addObject("totalBookListNum", totalBookListNum);

			System.out.println(mav);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName(viewName);
		System.out.println(mav);
		return mav;
	}

	// 민아 찜 삭제하기(진행중 ...)
	@Override
	@RequestMapping(value = "/mypage/deleteBook.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller deleteBook.do");
		request.setCharacterEncoding("utf-8");
		String goodsNo_ = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo_);
		mypageService.removeBookMark(goodsNo);
		ModelAndView mav = new ModelAndView("redirect:/mypage/mypageBookmarkList.do");
		return mav;
	}

	// 민아 쿠폰, 적립금 조회
	@Override
	@RequestMapping(value = "/mypage/couponSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView couponSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller couponSearch.do");
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		System.out.println("memberInfo = " + memberInfo);
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		Map pagingMap1 = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		String pageNum1 = (String) pagingMap1.get("pageNum1");
		String section1 = (String) pagingMap1.get("section1");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}
		if (pageNum1 == null || pageNum1.trim().length() < 1) {
			pageNum1 = "1";
			pagingMap1.put("pageNum1", pageNum1);
		}
		if (section1 == null || section1.trim().length() < 1) {
			section1 = "1";
			pagingMap1.put("section1", section1);
		}

		try {
			int start = ((Integer.parseInt(section) - 1)*10 + Integer.parseInt(pageNum) - 1) * 3;
			int start1 = ((Integer.parseInt(section1) - 1)*10 + Integer.parseInt(pageNum1) - 1) * 3;
			pagingMap.put("start", start);
			pagingMap.put("memberNo", memberNo);
			
			pagingMap1.put("start1", start1);
			pagingMap1.put("memberNo", memberNo);
			// List<CouponVO> couponDetail = mypageService.couponSearch(memberInfo); 쿠폰List
			List<CouponVO> couponDetail = mypageService.selectCouponListWithPagingMap(pagingMap);
			System.out.println("couponDetail = " + couponDetail);
			int totalCouponListNum = mypageService.selectCouponListTotalNum(memberNo);

			// List<PointHistoryVO> pointDetail = mypageService.pointSearch(memberInfo); 적립금
			List<PointHistoryVO> pointDetail = mypageService.selectPointListWithPagingMap(pagingMap1);
			int totalPointListNum = mypageService.selectPointListTotalNum(memberNo);
			System.out.println("pointDetail = " + pointDetail);
			List<PointHistoryVO> pointList = mypageService.memberPoint(memberInfo); // 회원이 가지고 있는 총 적립금
			System.out.println("pointList = " + pointList);
			
			System.out.println("pagingMap = " +pagingMap );
			System.out.println("pagingMap1 = " +pagingMap1 );
			mav.addAllObjects(pagingMap);
			mav.addAllObjects(pagingMap1);
			mav.addObject("pointList",pointList);
			mav.addObject("couponDetail", couponDetail);
			mav.addObject("pointDetail", pointDetail);
			mav.addObject("totalCouponListNum", totalCouponListNum);
			mav.addObject("totalPointListNum", totalPointListNum);
			System.out.println(mav);

		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * List<PointHistoryVO> pointDetail = mypageService.pointSearch(memberInfo); //
		 * 적립금 List System.out.println("pointDetail = " + pointDetail);
		 * mav.addObject("couponDetail", couponDetail); mav.addObject("pointDetail",
		 * pointDetail);
		 */

		mav.setViewName("/mypage/mypageCouponPoint");
		return mav;
	}

	@RequestMapping(value = "/mypage/couponNum.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView couponNum(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller couponNum.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();

		String couponCode = request.getParameter("couponCode");
		if (couponCode.isEmpty()) {
			mav = Alert.alertAndRedirect("쿠폰번호를 입력해주세요.", request.getContextPath() + "/mypage/couponSearch.do");
			return mav;
		}
		System.out.println("couponCode = " + couponCode);
		CouponVO couponVO = mypageService.couponNum(couponCode);
		System.out.println("couponVO = " + couponVO);
		if (couponVO == null) {
			mav = Alert.alertAndRedirect("쿠폰이 존재하지 않습니다.", request.getContextPath() + "/mypage/couponSearch.do");
			return mav;
		}
		couponVO.setCouponCode(couponCode);
		couponVO.setMemberNo(memberNo);
		CouponVO couponNull = mypageService.couponNull(couponVO);
		if (couponNull != null) {
			mav = Alert.alertAndRedirect("이미 등록 되어있는 쿠폰입니다.", request.getContextPath() + "/mypage/couponSearch.do");
			return mav;
		}

		mypageService.couponInsert(couponVO);
		mav = Alert.alertAndRedirect("등록되었습니다.", request.getContextPath() + "/mypage/couponSearch.do");
		return mav;
	}

	// 민아 배송지관리 - 출력
	@Override
	@RequestMapping(value = "/mypage/myAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller myAddress.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int MemberNo = memberInfo.getMemberNo();
		System.out.println("MemberNo = " + MemberNo);
		List<DeliveryAddressVO> myAddress = mypageService.myAddress(MemberNo);
		System.out.println("myaddress = " + myAddress);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myAddress", myAddress);
		mav.setViewName("/mypage/mypageAddress");
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/deleteAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller deleteAddress.do");
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String deliveryNo_ = request.getParameter("deliveryNo");
		int deliveryNo = Integer.parseInt(deliveryNo_);
		mypageService.deleteAddress(deliveryNo);
		mav.setViewName("redirect:/mypage/myAddress.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/bookCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bookCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller bookCart.do");
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String goodsNo_ = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo_);

		mav.setViewName("redirect:/mypage/myAddress.do");
		return mav;
	}

	@RequestMapping(value = "/mypage/addAddress.do")
	public ModelAndView addAddress(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		Map condMap = GeneralFileUploader.getParameterMap(request);
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");

		try {
			int memberNo = member.getMemberNo();
			condMap.put("memberNo", memberNo);

			mypageService.insertAddressWithMap(condMap);
			mav = Alert.alertAndRedirect("주소지를 추가했습니다.", request.getContextPath() + "/mypage/myAddress.do");

		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("배송지를 추가하지 못 했습니다.", request.getContextPath() + "/mypage/myAddress.do");
		}

		return mav;
	}

	@RequestMapping(value = "/mypage/modAddress.do")
	public ModelAndView modAddress(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		Map condMap = GeneralFileUploader.getParameterMap(request);
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		try {
			int memberNo = member.getMemberNo();
			condMap.put("memberNo", memberNo);
			String isBasicAddress = (String) condMap.get("isBasicAddress");

			// 기본 배송지로 설정을 눌렀을 때. 수정 폼에 넣은 주소지가 가장 작은 deliveryNo을 가지게 한다.
			// 가장 작은 deliveryNo을 가진 배송지를 찾아내서 -> 그 배송지와 deliveryNo을 교환하는 방식.
			// member 테이블에 해당하는 배송지 정보도 넣는다.
			if (isBasicAddress != null && isBasicAddress.equals("yes")) {
				String _deliveryNo = (String) condMap.get("deliveryNo");
				int deliveryNo = Integer.parseInt(_deliveryNo);
				List<DeliveryAddressVO> addressList = mypageService.myAddress(memberNo);
				int idx = -1;
				int minDeliveryNo = deliveryNo;
				for (int i = 0; i < addressList.size(); i++) {
					DeliveryAddressVO temp = addressList.get(i);
					if (minDeliveryNo > temp.getDeliveryNo()) {
						minDeliveryNo = temp.getDeliveryNo();
						idx = i;
					}
				}
				if (idx < 0) {
					mypageService.updateDeliveryAddressWithMap(condMap);
					mypageService.updateMemberAddressWithMap(condMap);
				} else {
					condMap.put("deliveryNo", minDeliveryNo);
					DeliveryAddressVO targetDeliveryAddress = addressList.get(idx);
					targetDeliveryAddress.setDeliveryNo(deliveryNo);
					mypageService.swapDeliveryAddress(condMap, targetDeliveryAddress);
				}

			} else {
				mypageService.updateDeliveryAddressWithMap(condMap);
			}
			mav = Alert.alertAndRedirect("수정했습니다.", request.getContextPath() + "/mypage/myAddress.do");

		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("수정하지 못 했습니다.", request.getContextPath() + "/mypage/myAddress.do");
		}
		return mav;

	}

	@RequestMapping("/mypage/deleteAddress.do")
	public ModelAndView deleteDeliveryAddress(@RequestParam("deliveryNo") int deliveryNo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		try {
			MemberVO member = (MemberVO) session.getAttribute("memberInfo");
			int memberNo = member.getMemberNo();
			Map condMap = new HashMap();
			condMap.put("deliveryNo", deliveryNo);
			condMap.put("memberNo", memberNo);
			mypageService.deleteDeliveryAddressWithMap(condMap);
			mav = Alert.alertAndRedirect("삭제했습니다.", request.getContextPath() + "/mypage/myAddress.do");
		} catch (Exception e) {
			mav = Alert.alertAndRedirect("삭제하지 못했습니다.", request.getContextPath() + "/mypage/myAddress.do");
		}

		return mav;
	}

	@RequestMapping(value = "/mypage/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("*Form.do");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 민아 회원정보수정1
	@Override
	@RequestMapping(value = "/mypage/mypageMemberMod.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageMemberMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller myAddress.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		String id = memberInfo.getId();
		ModelAndView mav = new ModelAndView();
		boolean isSNSMember = mypageService.isSNSMember(memberInfo);
		if (isSNSMember) {
			mav.setViewName("/mypage/mypageMemberInfoModForm");
			return mav;
		}
		mav.addObject("id", id);
		mav.setViewName("/mypage/mypageMemberModForm");
		return mav;
	}

	// 민아 회원정보수정1
	@Override
	@RequestMapping(value = "/mypage/mypageMemberModInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageMemberModInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		String inputPwd = request.getParameter("inputPwd");
		ModelAndView mav = new ModelAndView();
		System.out.println(inputPwd + ", " + memberInfo.getPwd());
		if (memberInfo.getPwd().equals(inputPwd)) {
			mav.setViewName("/mypage/mypageMemberInfoModForm");
		} else {
			mav = Alert.alertAndRedirect("비밀번호가 틀립니다. 다시 시도해 주세요",
					request.getContextPath() + "/mypage/mypageMemberMod.do");
		}

		return mav;
	}

	// 민아 회원정보 수정2
	@RequestMapping(value = "/mypage/memberInfoMod.do", method = RequestMethod.POST)
	public ModelAndView memberInfoMod(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("memberVO") MemberVO memberVO) throws Exception {
		System.out.println("memberInfoMod Controller");
		ModelAndView mav = new ModelAndView();
		String sms_agreement = request.getParameter("sms_agreement");
		String email_agreement = request.getParameter("email_agreement");
		String birth = request.getParameter("birth");

		if (email_agreement == null || email_agreement.trim().length() < 1) {
			memberVO.setEmail_agreement("no");
		}
		if (sms_agreement == null || sms_agreement.trim().length() < 1) {
			memberVO.setSms_agreement("no");
		}
		if (birth == null || birth.trim().length() < 1) {
			memberVO.setBirth(null);
		}
		System.out.println("memberVO = " + memberVO);
		mypageService.updateMember(memberVO);
		mav = Alert.alertAndRedirect("수정이 완료되었습니다.", request.getContextPath() + "/mypage/mypageMemberMod.do");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		memberInfo = memberVO;
		session.setAttribute("memberInfo", memberInfo);
		return mav;
	}

	// 민아 리뷰
	@RequestMapping(value = "/mypage/mypageReviewList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map pagingMap = GeneralFunctions.getPagingMap(request,5);
		System.out.println(pagingMap);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		// 1. 작성가능 리뷰 가져오기 (Delivery Completed인 상품들)
		List<OrderVO> availableReviewList = mypageService.selectAvailableReviewList(memberNo);
		int totalAvailableReviewsNum = mypageService.selectTotalAvailableReviewsNum(memberNo);

		// 2. Write Complete 리뷰 가져오기 (리뷰Write Complete인 상품들)
		List<OrderVO> doneReviewList = mypageService.selectDoneReviewList(memberNo);
		int totalDoneReviewsNum = mypageService.selectTotalDoneReviewsNum(memberNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("availableReviewList", availableReviewList);
		mav.addObject("doneReviewList", doneReviewList);
		mav.addObject("totalAvailableReviewsNum", totalAvailableReviewsNum);
		mav.addObject("totalDoneReviewsNum", totalDoneReviewsNum);
		mav.setViewName("/mypage/mypageReview");
		mav.addAllObjects(pagingMap);
		System.out.println(mav);
		System.out.println("availableReviewList= " +availableReviewList);
		return mav;
	}

	// ajax로 주문자 정보나 사용한 쿠폰 id를 db에 저장해놓기 위한 코드
	@ResponseBody
	@PostMapping(value = "/storeOrderInfo.do")
	public String storeOrderInfo(HttpServletRequest request) {
		String result = "";
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int orderNo = mypageService.selectNewOrderNo();
		try {
			int memberNo = member.getMemberNo();
			String orderer_name = request.getParameter("orderer_name");
			String orderer_phone = request.getParameter("orderer_phone");
			String receiver_name = request.getParameter("receiver_name");
			String receiver_address = request.getParameter("receiver_address");
			String receiver_addressDetail = request.getParameter("receiver_addressDetail");
			String receiver_phone = request.getParameter("receiver_phone");
			String receiver_comment = request.getParameter("receiver_comment");
			String used_point = request.getParameter("used_point");
			String used_couponId = request.getParameter("used_couponId");
			String point_price = request.getParameter("point_price");
			String total_price = request.getParameter("total_price");
			String discount_price = request.getParameter("discount_price");
			if (receiver_comment.equals("direct")) {
				receiver_comment = request.getParameter("receiver_comment_direct");
			}

			List<OrderVO> selectGoodsList = (List<OrderVO>) session.getAttribute("selectGoodsList");
			List<OrderVO> orderList = new ArrayList();
			
			for (int i = 0; i < selectGoodsList.size(); i++) {
				OrderVO temp = selectGoodsList.get(i);
				temp.setOrderNo(orderNo);
				temp.setOrderer_name(orderer_name);
				temp.setOrderer_phone(orderer_phone);
				temp.setReceiver_name(receiver_name);
				temp.setReceiver_address(receiver_address + "&nbsp" + receiver_addressDetail);
				temp.setReceiver_phone(receiver_phone);
				temp.setReceiver_comment(receiver_comment);
				temp.setUsed_point(Integer.parseInt(used_point));
				temp.setUsed_couponId(Integer.parseInt(used_couponId));
				temp.setPoint_price(Integer.parseInt(point_price));
				temp.setTotal_price(Integer.parseInt(total_price));
				temp.setDiscount_price(Integer.parseInt(discount_price));
				temp.setMemberNo(memberNo);
				orderList.add(temp);
			}
			
			// 일단 데이터베이스에 저장해뒀다가 결제가 완료되면 다시 끌고 옴
			mypageService.insertTempOrderList(orderList);
			session.setAttribute("tempOrderNo", orderNo);
			result = "success";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	@ResponseBody
	@PostMapping("/mypage/doneReviews.do")
	public String getDoneReviews(HttpServletRequest request) throws Exception {
		String result = "";
		Map pagingMap = GeneralFunctions.getPagingMap(request,5);
		List<OrderVO> doneReviewList = mypageService.selectDoneReviewListWithPagingMap(pagingMap);
		
		int memberNo = Integer.parseInt(pagingMap.get("memberNo").toString());
		int section = Integer.parseInt(pagingMap.get("section").toString());
		int totalDoneReviewsNum = mypageService.selectTotalDoneReviewsNum(memberNo);
		int numForPage = Integer.parseInt(pagingMap.get("numForPage").toString());
		for (int i = 0; i < doneReviewList.size(); i++) {
			OrderVO temp = doneReviewList.get(i);

			result += "<div\r\n" + "            class=\"row\"\r\n" + "            onclick=\"location.href='"
					+ request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + temp.getGoodsNo() + "'\"\r\n"
					+ "          >\r\n" + "            <div class=\"col-md-3\">\r\n" + "              <img\r\n"
					+ "                src=\"" + request.getContextPath() + "/download.do?imageFileName="
					+ temp.getGoodsImg() + "&path=goodsNo" + temp.getGoodsNo() + "\"\r\n" + "              />\r\n"
					+ "            </div>\r\n" + "            <div class=\"col-md textsize-2 textbold\">\r\n"
					+ "              " + temp.getGoodsName() + " " + temp.getGoods_qty() + "개 <br />\r\n"
					+ "              " ;
					
			if (temp.getDeliveryDate()!=null && temp.getDeliveryDate().toString().trim() != "null") {
				result 
				+= temp.getDeliveryDate();
			}
					
			result += " " + temp.getDelivery_status() + "\r\n"
					+ "            </div>\r\n" + "          </div>\r\n" + "          <hr class=\"line-gray\" />";

		}
		String[] params = {String.valueOf(memberNo)};
		result += GeneralFunctions.renderPageButtons(section, numForPage, totalDoneReviewsNum, "fn_loadDoneReviews", params);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mypage/availableReviews.do")
	public String getAvailableReviews(HttpServletRequest request) throws Exception{
		String result = "";
		Map pagingMap = GeneralFunctions.getPagingMap(request,5);
		List<OrderVO> availableReviewList = mypageService.selectAvailableReviewListWithPagingMap(pagingMap);

		int memberNo = Integer.parseInt(pagingMap.get("memberNo").toString());
		int section = Integer.parseInt(pagingMap.get("section").toString());
		int totalAvailableReviewsNum = mypageService.selectTotalAvailableReviewsNum(memberNo);
		int numForPage = Integer.parseInt(pagingMap.get("numForPage").toString());
		for (int i = 0; i < availableReviewList.size(); i++) {
			OrderVO temp = availableReviewList.get(i);

			result += "<div class=\"row\">\r\n"
					+ "            <div class=\"col-md-3\">\r\n"
					+ "              <img\r\n"
					+ "                src=\""
					+ request.getContextPath()
					+ "/download.do?imageFileName="
					+ temp.getGoodsImg()
					+ "&path=goodsNo"
					+ temp.getGoodsNo()
					+ "\"\r\n"
					+ "              />\r\n"
					+ "            </div>\r\n"
					+ "            <div class=\"col-md textsize-2 textbold\">\r\n"
					+ "              "
					+ temp.getGoodsName()
					+ " "
					+ temp.getGoods_qty()
					+ "개 <br />\r\n"
					+ "              ";
			if (temp.getDeliveryDate()!=null && temp.getDeliveryDate().toString().trim() != "null") {
				result 
				+= temp.getDeliveryDate();
			}
			result+=
					 " "
					+ temp.getDelivery_status()
					+ "\r\n"
					+ "            </div>\r\n"
					+ "            <div class=\"col-md textsize-2 textbold\">\r\n"
					+ "              <button\r\n"
					+ "                type=\"button\"\r\n"
					+ "                onclick=\"location.href='"
					+ "${contextPath}"
					+ "/review/writeReview.do?order_seqNo="
					+ "${item.order_seqNo}"
					+ "'\"\r\n"
					+ "              >\r\n"
					+ "                리뷰작성\r\n"
					+ "              </button>\r\n"
					+ "            </div>\r\n"
					+ "          </div>\r\n"
					+ "\r\n"
					+ "          <hr class=\"line-gray\" />"
					;

		}
		String[] params = {String.valueOf(memberNo)};
		result += GeneralFunctions.renderPageButtons(section, numForPage, totalAvailableReviewsNum, "fn_loadAvailableReviews", params);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mypage/selectCoupon.do")
	public Map selectCoupon(HttpServletRequest request){
		Map condMap = GeneralFileUploader.getParameterMap(request);
		HttpSession session = request.getSession();
		Map result = new HashMap();
		
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		System.out.println("condMap : "+condMap);
		try {
			condMap.put("memberNo", member.getMemberNo());
			result = mypageService.selectCouponByCouponNoAndMemberNo(condMap);
			String condition = (String) result.get("condition");
			if (condition.contains("이상")) {
				String intStr = condition.replaceAll("[^\\d]", "");
				int conNum = Integer.parseInt(intStr);
				result.put("condition", conNum);
			}else {
				result.put("condition", 0);
			}
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result = new HashMap();
			result.put("result", "fail");
		}
		System.out.println(result);
		return result;
		
		
	} 
	
}
