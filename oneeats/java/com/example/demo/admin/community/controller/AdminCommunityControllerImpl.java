package com.example.demo.admin.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.community.service.AdminCommunityService;
import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.common.functions.GeneralFunctions;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
import com.example.demo.vo.RecipeVO;
import com.example.demo.vo.ReviewVO;

@Controller("adminCommunityController")
@RequestMapping("/admin/community")
public class AdminCommunityControllerImpl implements AdminCommunityController {

	@Autowired
	private AdminCommunityService adminCommunityService;

	@Override
	@RequestMapping("/review/adminReviewList.do")
	public ModelAndView adminReviewList(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map map = GeneralFileUploader.getParameterMap(request);
		Map pagingMap = GeneralFunctions.getPagingMap(map, 10);
		List<ReviewVO> reviewList = adminCommunityService.selectReviewListWithPagingMap(pagingMap);
		mav.addAllObjects(pagingMap);
		mav.addObject("reviewList",reviewList);
		int totalReviewNum = adminCommunityService.selectTotalReviewNum(pagingMap);
		mav.addObject("totalReviewNum",totalReviewNum);
		return mav;
	}


	// 민아 Admin 1:1 Inquiry  리스트
		@RequestMapping("/oneQnA/adminOneQnAList.do")
		public ModelAndView oneQnADetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("HERE community oneQnADetail Controller");
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			request.setCharacterEncoding("utf-8");
			Map pagingMap = GeneralFileUploader.getParameterMap(request);
			String pageNum = (String) pagingMap.get("pageNum");
			String section = (String) pagingMap.get("section");
			if (pageNum == null || pageNum.trim().length() < 1) {
				pageNum = "1";
				pagingMap.put("pageNum", pageNum);
			}
			if (section == null || section.trim().length() < 1) {
				section = "1";
				pagingMap.put("section", section);
			}
			
			try {
				int start = ((Integer.parseInt(section)-1)*10+Integer.parseInt(pageNum)-1)*10;
				pagingMap.put("start", start);
				List<OneQnAVO> oneQnAList = adminCommunityService.selectOneQnAListWithPagingMap(pagingMap);
				mav.addAllObjects(pagingMap);
				mav.addObject("oneQnAList", oneQnAList);
				System.out.println("oneQnAList = " +oneQnAList);
				int totalOneQnAQnANum = adminCommunityService.selectOneQnAListTotalNumWithCategory();
				mav.addObject("totalOneQnAQnANum",totalOneQnAQnANum);
				HttpSession session = request.getSession();
				MemberVO member = (MemberVO) session.getAttribute("memberInfo");
				System.out.println(mav);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			return mav;
		}

	// 민아 Admin Notice
	@RequestMapping("/notice/adminNoticeList.do")
	public ModelAndView adminNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE community noticeList Controller");
		ModelAndView mav = new ModelAndView();
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		String category = (String) pagingMap.get("category");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}
		if (category == null || category.trim().length() < 1) {
			category = "all";
			pagingMap.put("category", category);
		}

		try {

			int start = ((Integer.parseInt(section)-1)*10+Integer.parseInt(pageNum)-1)*10;
			pagingMap.put("start", start);
			List<NoticeVO> noticeList = adminCommunityService.selectNoticeListWithPagingMap(pagingMap);
			mav.addAllObjects(pagingMap);
			mav.addObject("noticeList", noticeList);
			System.out.println("noticeList = " +noticeList);
			int totalNoticeNum = adminCommunityService.selectNoticeListTotalNumWithCategory(pagingMap);
			System.out.println(totalNoticeNum);
			mav.addObject("totalNoticeNum",totalNoticeNum);

			System.out.println(mav);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("viewName = " + viewName);
		mav.setViewName(viewName);
		return mav;
	}

	// adminNoticeModForm
	// 민아 Admin Notice - Modify
	@RequestMapping("/notice/adminNoticeMod.do")
	public ModelAndView adminNoticeMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE community adminNoticeMod Controller");
		ModelAndView mav = new ModelAndView();
		String noticeNo_ = request.getParameter("noticeNo");
		int noticeNo = Integer.parseInt(noticeNo_);
		NoticeVO noticeVO = adminCommunityService.adminNoticeDetail(noticeNo);
		System.out.println("noticeVO = " + noticeVO);
		mav.addObject("notice", noticeVO);
		mav.setViewName("/admin/community/notice/adminNoticeModForm");
		return mav;
	}

	// 민아 Admin Notice - Modify
	@RequestMapping("/notice/adminNotideDetailMod.do")
	public ModelAndView adminNotideDetailupdate(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
		System.out.println("HERE community adminNotideDetailMod Controller");
		ModelAndView mav = new ModelAndView();
		adminCommunityService.adminNotideDetailupdate(noticeVO);
		mav.addObject("notice", noticeVO);
		mav = Alert.alertAndRedirect("The modification is complete.",
				request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
		return mav;
	}

	// 민아 Admin Notice - Delete
	@RequestMapping("/notice/admindeleteNotice.do")
	public ModelAndView deleteNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE community admindeleteNotice Controller");
		ModelAndView mav = new ModelAndView();
		String noticeNo_ = request.getParameter("noticeNo");
		int noticeNo = Integer.parseInt(noticeNo_);
		adminCommunityService.deleteNotice(noticeNo);
		mav = Alert.alertAndRedirect("Delete가  Complete되었습니다.",
				request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
		return mav;
	}

	// 민아 Admin Notice - Delete
	@RequestMapping("/notice/adminNoticeAddList.do")
	public ModelAndView adminNoticeAddList(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
		System.out.println("HERE community adminNoticeAddList Controller");
		ModelAndView mav = new ModelAndView();
		int noticeNo = adminCommunityService.newNum();
		System.out.println("noticeNo = " + noticeNo);
		noticeVO.setNoticeNo(noticeNo);
		adminCommunityService.addNotice(noticeVO);
		mav = Alert.alertAndRedirect("Write이  Complete되었습니다.",
				request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
		return mav;
	}

	@RequestMapping("/mostQnA/adminMostQnAList.do")
	public ModelAndView adminMostQnAList(HttpServletRequest request) throws IOException {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		request.setCharacterEncoding("utf-8");
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		String category = (String) pagingMap.get("category");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}
		if (category == null || category.trim().length() < 1) {
			category = "all";
			pagingMap.put("category", category);
		}
		try {
			int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 10;
			pagingMap.put("start", start);
			List<MostQnAVO> mostQnAList = adminCommunityService.selectMostQnAListWithPagingMap(pagingMap);
			mav.addAllObjects(pagingMap);
			mav.addObject("mostQnAList", mostQnAList);
			int totalMostQnANum = adminCommunityService.selectMostQnAListTotalNumWithCategory(category);
			mav.addObject("totalMostQnANum", totalMostQnANum);

			System.out.println(mav);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	@RequestMapping(value = "/mostQnA/addMostQnA.do", method = RequestMethod.POST)
	public ModelAndView addMostQnA(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map condMap = GeneralFileUploader.getParameterMap(request);

		// 설명문의 줄바꿈 처리
		String content = (String) condMap.get("content");
		System.out.println(content);
		content.replaceAll("\\r|\\n", "<br>");
		condMap.put("content", content);

		try {
			adminCommunityService.insertNewMostQnAWithMap(condMap);
			mav = Alert.alertAndRedirect("Frequently Asked Questions을 추가했습니다.",
					request.getContextPath() + "/admin/community/mostQnA/adminMostQnAList.do");

		} catch (Exception e) {
			e.printStackTrace();
			String previousPage = request.getHeader("Referer");
			mav = Alert.alertAndRedirect("Frequently Asked Questions을 추가하지 못 했습니다.", previousPage);
		}

		return mav;

	}

	@RequestMapping(value = "/mostQnA/adminMostQnAModForm.do")
	public ModelAndView adminMostQnAModForm(HttpServletRequest request) throws IOException {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		request.setCharacterEncoding("utf-8");

		String qnaNo = request.getParameter("qnaNo");
		MostQnAVO mostQnA = adminCommunityService.selectMostQnAByNo(qnaNo);
		mav.addObject("mostQnA", mostQnA);
		System.out.println(mav);
		return mav;
	}

	@RequestMapping(value = "/mostQnA/modMostQnA.do", method = RequestMethod.POST)
	public ModelAndView adminModMostQnA(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		Map condMap = GeneralFileUploader.getParameterMap(request);

		// 설명문의 줄바꿈 처리
		String content = (String) condMap.get("content");
		System.out.println(content);
		content.replaceAll("\\r|\\n", "<br>");
		condMap.put("content", content);
		try {
			adminCommunityService.updateMostQnAWithMap(condMap);
			mav = Alert.alertAndRedirect("Updated successfully.",
					request.getContextPath() + "/admin/community/mostQnA/adminMostQnAList.do");
		} catch (Exception e) {
			e.printStackTrace();
			mav = GeneralFunctions.getAlertPreviousRedirect(request, "Failed to update.");
		}

		return mav;

	}

	@RequestMapping(value = "/mostQnA/deleteQnA.do")
	public ModelAndView deleteMostQnA(HttpServletRequest request, @RequestParam("qnaNo") int qnaNo) {
		ModelAndView mav = new ModelAndView();
		String previousPage = request.getHeader("Referer");
		try {
			adminCommunityService.deleteMostQnA(qnaNo);
			mav = Alert.alertAndRedirect("The delete is complete.", previousPage);
		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("Unable to complete delete..", previousPage);
		}

		return mav;
	}
	
	@RequestMapping("/recipe/adminRecipeList.do")
	public ModelAndView adminRecipeList(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		
		String category = request.getParameter("category");
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String recipe_search_type = request.getParameter("recipe_search_type");
		int pageNum;
		int section;
		if (_pageNum == null || _pageNum.trim().length() < 1) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(_pageNum);
		}
		if (_section == null || _section.trim().length() < 1) {
			section = 1;
		} else {
			section = Integer.parseInt(_section);
		}
		if (recipe_search_type != null && recipe_search_type.length() < 1) {
			recipe_search_type = "all";
		}
		
		pagingMap.put("category", category);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("recipe_search_type", recipe_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		List<RecipeVO> recipeList= adminCommunityService.selectRecipeListWithPagingMap(pagingMap);
		mav.addObject("recipeList",recipeList);
		
		int totalRecipeNum = adminCommunityService.selectTotalRecipeNum(pagingMap);
		mav.addObject("totalRecipeNum",totalRecipeNum);
		mav.addAllObjects(pagingMap);
		return mav;
	}
	
	
	@RequestMapping("/review/deleteReview.do")
	public ModelAndView adminDeleteReview(@RequestParam("reviewNo") int reviewNo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			adminCommunityService.deleteReview(reviewNo);
			mav = Alert.alertAndRedirect("The delete is complete.",request.getContextPath()+"/admin/community/review/adminReviewList.do");
		} catch (Exception e) {
			
			mav = Alert.alertAndRedirect("Unable to complete delete..", request.getContextPath()+"/admin/community/review/adminReviewList.do");
		}
		
		return mav;
		
	}
	
}
