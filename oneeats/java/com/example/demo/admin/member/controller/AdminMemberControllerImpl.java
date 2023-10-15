package com.example.demo.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.member.service.AdminMemberService;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController{
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	
	@RequestMapping(value = "/admin/member/adminMemberList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminMemberList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE adminMemberList");
		request.setCharacterEncoding("utf-8");
		String viewName =  (String) request.getAttribute("viewName");
		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String adminMember_search_type = request.getParameter("adminMember_search_type");
		int pageNum;
		int section;
		if (_pageNum == null || _pageNum.length() <= 0) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(_pageNum);
		}
		if (_section == null || _section.length() <= 0) {
			section = 1;
		} else {
			section = Integer.parseInt(_section);
		}
		if (adminMember_search_type != null && adminMember_search_type.length() < 1) {
			adminMember_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("adminMember_search_type", adminMember_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		
		List<MemberVO> adminMemberList = adminMemberService.selectAdminMemberList(pagingMap);
		int totalMemberNum = adminMemberService.selectTotalMemberNum();

		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(pagingMap);
		mav.addObject("adminMemberList", adminMemberList);
		mav.addObject("totalMemberNum", totalMemberNum);
		System.out.println("totalMemberNum="+totalMemberNum);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/admin/member/adminMemberDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminMemberDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE adminMemberDetail");
		request.setCharacterEncoding("utf-8");
		String viewName =  (String) request.getAttribute("viewName");
		
		int memberNo = (Integer.parseInt(request.getParameter("memberNo")));
		System.out.println("memberNo="+memberNo);
		MemberVO adminMemberDetail = adminMemberService.selectMemberByMemberNo(memberNo);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("adminMember", adminMemberDetail);
		System.out.println("adminMemberDetail="+adminMemberDetail);
		return mav;
	}
	
	
}
