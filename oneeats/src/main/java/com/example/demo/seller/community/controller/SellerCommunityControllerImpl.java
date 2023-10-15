package com.example.demo.seller.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.functions.GeneralFunctions;
import com.example.demo.seller.community.service.SellerCommunityService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.ReviewVO;

@Controller("sellerCommunityController")
public class SellerCommunityControllerImpl implements SellerCommunityController{
	@Autowired 
	private SellerCommunityService sellerCommunityService;
	
	@RequestMapping(value = "/seller/community/review/sellerReviewList.do")
	public ModelAndView sellerReviewList(HttpServletRequest request) throws Exception {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map pagingMap = GeneralFunctions.getPagingMap(request);
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		try {
			int memberNo = member.getMemberNo();
			pagingMap.put("memberNo", memberNo);
			List<ReviewVO> reviewList = sellerCommunityService.selectReviewListWithPagingMap(pagingMap);
			mav.addObject("reviewList",reviewList);
			
			int totalReviewsNum = sellerCommunityService.selectTotalReviewsNumWithPagingMap(pagingMap);
			mav.addObject("totalReviewsNum",totalReviewsNum);
			
			mav.addAllObjects(pagingMap);
			
		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("Failed to load the list.", request.getContextPath()+"/main/mainPage.do");
		}
		System.out.println(mav);
		return mav;
	}
	
}
