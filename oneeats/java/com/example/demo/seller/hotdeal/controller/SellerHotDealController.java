package com.example.demo.seller.hotdeal.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface SellerHotDealController {
	
	
	public ModelAndView addHotdeals(HttpServletRequest request) throws IOException;

	public ModelAndView deleteHotdealGoods(@RequestParam("hotdealNo") int goodsNo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
