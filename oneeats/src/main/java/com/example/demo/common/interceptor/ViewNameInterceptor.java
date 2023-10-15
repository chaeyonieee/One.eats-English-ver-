package com.example.demo.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {
@Override
public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler)
		throws Exception {
	System.out.println("prehandle");
	try {
		String viewName = getViewName(req);
		req.setAttribute("viewName", viewName);
		System.out.println(viewName);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return true;
}

@Override
public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler,
		ModelAndView modelAndView) throws Exception {
	
}

@Override
public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object handler, Exception ex)
		throws Exception {
	
}

private String getViewName(HttpServletRequest req) throws Exception {
	String contextPath = req.getContextPath();
	String uri = (String) req.getAttribute("javax.servlet.include.request_uri");
	if(uri==null||uri.trim().equals("")) {
		uri = req.getRequestURI();
	}
	
	int begin = 0;
	if(!((contextPath==null)||("".equals(contextPath)))) {
		begin = contextPath.length();
	}
	
	int end;
	if(uri.indexOf(";")!=-1) {
		end = uri.indexOf(";");
	} else if(uri.indexOf("?")!=-1) {
		end = uri.indexOf("?");
	} else {
		end = uri.length();
	}
	
	String fileName = uri.substring(begin, end);
	if(fileName.indexOf(".")!=-1) {
		fileName = fileName.substring(0, fileName.lastIndexOf("."));
	}
	if(fileName.indexOf("/")!=-1) {
		fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
	}
	return fileName;
}

}
