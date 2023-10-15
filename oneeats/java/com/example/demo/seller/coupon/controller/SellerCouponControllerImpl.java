package com.example.demo.seller.coupon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.seller.coupon.service.SellerCouponService;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.MemberVO;

@Controller("sellerCouponController")
public class SellerCouponControllerImpl implements SellerCouponController{
	@Autowired 
	private SellerCouponService sellerCouponService;
	
	@Override
	@RequestMapping(value = "/seller/coupon/sellerCouponList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerCouponList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE sellerCouponList");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");
		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String coupon_search_type = request.getParameter("coupon_search_type");
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
		if (coupon_search_type != null && coupon_search_type.length() < 1) {
			coupon_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("coupon_search_type", coupon_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		pagingMap.put("memberNo", memberNo);
		
		List<CouponVO> sellerCouponList = sellerCouponService.selectSellerCouponByMemberNo(pagingMap);
		int totalCouponNum = sellerCouponService.selectTotalCouponNum(memberNo);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(pagingMap);
		mav.addObject("sellerCouponList", sellerCouponList);
		mav.addObject("totalCouponNum", totalCouponNum);
		System.out.println("totalCouponNum="+totalCouponNum);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/seller/coupon/sellerCouponForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView adminCouponForm(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("HERE sellerCouponForm");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("11111viewName="+viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/seller/coupon/sellerAddCoupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerAddCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("HERE sellerAddCoupon");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String)request.getAttribute("viewName");
		
		String name = request.getParameter("name");
		String discount_price = request.getParameter("discount_price");
		String condition = request.getParameter("condition");
		String expDate = request.getParameter("expDate");
		String couponCode = request.getParameter("couponCode");
		
		CouponVO coupon = new CouponVO();
		coupon.setName(name);
		coupon.setDiscount_price(discount_price);
		coupon.setCondition(condition);
		coupon.setExpDate(expDate);
		coupon.setMemberNo(memberNo);
		coupon.setCouponCode(couponCode);
		System.out.println("coupon="+coupon);

		sellerCouponService.insertSellerCoupon(coupon);
		
		ModelAndView mav = new ModelAndView("redirect:/seller/coupon/sellerCouponList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/seller/coupon/deleteCoupon.do",method = RequestMethod.GET)
	public ModelAndView deleteCoupon(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int couponNo = (Integer.parseInt(request.getParameter("couponNo")));
		
		sellerCouponService.deleteSellerCoupon(couponNo);
		ModelAndView mav = new ModelAndView("redirect:/seller/coupon/sellerCouponList.do");
		return mav;
	}
}
