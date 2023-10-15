package com.example.demo.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.vo.OrderVO;

public interface MypageController {
	
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderDetail(@RequestParam("orderNo") int orderNo, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView orderConfirm(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView newOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myPageMain(String message, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView mypageintro(MultipartHttpServletRequest request)  throws Exception;
	
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView couponSearch(HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//민아 Order AddressManagement - 출력
	public ModelAndView myAddress(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteAddress(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bookCart(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//민아 Member InformationModify1
	public ModelAndView mypageMemberMod(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//민아 Member InformationModify2
	public ModelAndView mypageMemberModInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
