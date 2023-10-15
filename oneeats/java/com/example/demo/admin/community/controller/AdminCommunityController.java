package com.example.demo.admin.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface AdminCommunityController {

	
	public ModelAndView adminReviewList(HttpServletRequest request) throws Exception;

}
