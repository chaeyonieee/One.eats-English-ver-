package com.example.demo.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.vo.MemberVO;

public interface MemberController {
	
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView updatePw(HttpServletRequest request, HttpServletResponse response) throws Exception;
	

	public ModelAndView Register(HttpServletRequest request) throws Exception;

	public ModelAndView idSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView PwdSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView sellerRegister(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
