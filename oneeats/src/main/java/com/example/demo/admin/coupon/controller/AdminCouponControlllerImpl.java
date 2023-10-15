package com.example.demo.admin.coupon.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.coupon.service.AdminCouponService;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.MemberVO;

@Controller("adminCouponController")
public class AdminCouponControlllerImpl implements AdminCouponController {
	@Autowired
	AdminCouponService adminCouponService;
	
	@Override
	@RequestMapping(value = "/admin/coupon/adminCouponList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminCouponList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE adminCouponList");
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
		
		List<CouponVO> adminCouponList = adminCouponService.selectAdminCouponByMemberNo(pagingMap);
		int totalCouponNum = adminCouponService.selectTotalCouponNum(memberNo);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(pagingMap);
		mav.addObject("adminCouponList", adminCouponList);
		mav.addObject("totalCouponNum", totalCouponNum);
		System.out.println("totalCouponNum="+totalCouponNum);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/admin/coupon/adminCouponForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView adminCouponForm(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("HERE adminCouponForm");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("11111viewName="+viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/admin/coupon/adminAddCoupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminAddCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("HERE adminAddCoupon");
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

		adminCouponService.insertAdminCoupon(coupon);
		
		ModelAndView mav = new ModelAndView("redirect:/admin/coupon/adminCouponList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/admin/coupon/deleteCoupon.do",method = RequestMethod.GET)
	public ModelAndView deleteCoupon(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int couponNo = (Integer.parseInt(request.getParameter("couponNo")));
		
		adminCouponService.deleteAdminCoupon(couponNo);
		ModelAndView mav = new ModelAndView("redirect:/admin/coupon/adminCouponList.do");
		return mav;
	}
	
}
