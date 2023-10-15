package com.example.demo.seller.coupon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface SellerCouponController {
	
	public ModelAndView sellerCouponList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView sellerAddCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception;

}
