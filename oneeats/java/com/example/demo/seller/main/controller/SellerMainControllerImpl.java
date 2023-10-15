package com.example.demo.seller.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.main.service.SellerMainService;

@Controller("sellerMainController")
public class SellerMainControllerImpl implements SellerMainController{
	@Autowired
	private SellerMainService sellerMainService;
	
	@RequestMapping(value = "/seller/main/sellerMain.do")
	public ModelAndView sellerMain(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}

}
