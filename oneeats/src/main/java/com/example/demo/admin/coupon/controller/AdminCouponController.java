package com.example.demo.admin.coupon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminCouponController {
	
	public ModelAndView adminCouponList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView adminAddCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception;

}
