package com.example.demo.common.alert;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class myErrorController implements ErrorController{
	
	@RequestMapping("/error")
	public ModelAndView error(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("/main/error");
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		
	    if (status != null) {
	        Integer statusCode = Integer.valueOf(status.toString());
	        mav.addObject("statusCode",statusCode);
	        
	    }
		return mav;
		
	}
}
