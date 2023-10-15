package com.example.demo.seller.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface SellerOrderController {
	
	public ModelAndView sellerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView sellerOrderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
