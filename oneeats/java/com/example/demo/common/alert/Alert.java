package com.example.demo.common.alert;

import org.springframework.web.servlet.ModelAndView;

public class Alert {
	public static ModelAndView alertAndRedirect(String msg, String page) {
		ModelAndView mav = new ModelAndView("/alert");
		mav.addObject("redirectMessage", msg);
		mav.addObject("redirectPage", page);
		return mav;
	}
}
