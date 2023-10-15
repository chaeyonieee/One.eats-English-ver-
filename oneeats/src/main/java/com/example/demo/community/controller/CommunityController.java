package com.example.demo.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CommunityController {

	
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView noticeDetail(HttpServletRequest request, HttpServletResponse response) throws IOException;
	public ModelAndView oneQnA(HttpServletRequest request, HttpServletResponse response) throws IOException;
	public ModelAndView oneQnADetail(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView oneQnAReply(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView DoubleReply(HttpServletRequest request, HttpServletResponse response);
	ModelAndView mostQnAList(HttpServletRequest request) throws IOException;
	public ModelAndView oneQnAFormInsert(HttpServletRequest request, HttpServletResponse response);
	}
