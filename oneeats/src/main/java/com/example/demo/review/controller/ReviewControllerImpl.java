package com.example.demo.review.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.review.service.ReviewService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

@Controller("reviewController")
public class ReviewControllerImpl implements ReviewController{
	@Autowired 
	private ReviewService reviewService;
	
	@RequestMapping(value = "/review/goodsReview.do")
	public ModelAndView goodsReview(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/review/writeReview.do")
	public ModelAndView writeReview(HttpServletRequest request) {
		System.out.println("HERE writeReview Controller ");
		ModelAndView mav = new ModelAndView();
		String order_seqNo_ = request.getParameter("order_seqNo");
		int order_seqNo = Integer.parseInt(order_seqNo_);
		OrderVO orderVO= new OrderVO();
		orderVO.setOrder_seqNo(order_seqNo);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		orderVO.setMemberNo(memberNo);
		OrderVO order = reviewService.SearchGoods(orderVO);
		System.out.println("order= "+order);
		mav.addObject("order",order);
		mav.addObject("member",memberInfo);
		mav.setViewName("/review/writeReview");
		return mav;
	}
	
	@RequestMapping(value = "/review/reviewInsert.do")
	public ModelAndView reviewInsert(MultipartHttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map condMap = GeneralFileUploader.getParameterMap(request);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo"); //memberNo가져오기
		int memberNo = memberInfo.getMemberNo();
		String reviewImg = GeneralFileUploader.getFileName(request);
		condMap.put("memberNo", memberNo);
		condMap.put("reviewImg", reviewImg);
		System.out.println(condMap);
		reviewService.reviewInsert(condMap);
		int reviewNo = Integer.parseInt(condMap.get("reviewNo").toString());
		List fileList = GeneralFileUploader.upload(request, "/review/" + reviewNo);
		
		mav = Alert.alertAndRedirect("Successfully registered.", request.getContextPath() + "/mypage/mypageReviewList.do");
		return mav;
	}
}
