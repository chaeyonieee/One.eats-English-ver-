package com.example.demo;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.member.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/home.do")
	public ModelAndView home(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}

	@RequestMapping(value = {"/*.do","/*/*.do","/*/*/*.do","/*/*/*/*.do"})
	public ModelAndView every(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		System.out.println("/"+viewName);
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sms/sendInzungSMStest.do")
	public String sendsmstest(HttpServletRequest request) {
		String randomNumber = getRandomNumber();
		memberService.saveRandomSMSInzungBunho(randomNumber);
		return "success";
	}
	
	private String getRandomNumber() {
		String result = "";
		Random random = new Random();
		int rand = 0;
		rand = random.nextInt(1000000);
		result = String.valueOf(rand);
		int len = result.length();
		for (int i = 0; i < 6 - len; i++) {
			result = "0" + result;
		}

		return result;
	}

}