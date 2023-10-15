package com.example.demo.admin.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminOrderController {
	
	public ModelAndView adminOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView adminOrderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
