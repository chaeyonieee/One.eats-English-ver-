package com.example.demo.common.api.naver.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.kakao.dto.KakaoDTO;
import com.example.demo.common.api.naver.dto.NaverDTO;
import com.example.demo.common.api.naver.service.NaverService;
import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;

@RequestMapping("naver")
@Controller
public class NaverController {

	@Autowired
	private NaverService naverService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/loginForm.do")
	public ModelAndView naverlogin(HttpServletRequest request) {
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		ModelAndView mav = new ModelAndView("redirect:" + naverService.getNaverLogin(state));
		HttpSession session = request.getSession();
		session.setAttribute("naverFor", "login");
		return mav;

	}

	@RequestMapping(value = "/registerForm.do")

	public ModelAndView naverRegister(HttpSession session) {
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		ModelAndView mav = new ModelAndView("redirect:" + naverService.getNaverLogin(state));
		session.setAttribute("naverFor", "register");
		return mav;
	}

	@RequestMapping(value = "/callback")
	public ModelAndView callback(HttpServletRequest request) throws Exception {
		System.out.println("네이버 콜백 됨.");
		NaverDTO naverInfo = naverService.getNaverInfo(request.getParameter("code"), request.getParameter("state"));

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String naverFor = (String) session.getAttribute("naverFor");
		session.removeAttribute("naverFor");

		if (naverFor == null || naverFor.trim().length() < 1) {
			mav = Alert.alertAndRedirect("잘못된 api 접근입니다.", request.getContextPath() + "/main/mainPage.do");
			return mav;
		}

		String hash = naverInfo.hash();
		hash = hash.substring(0, 10);
		Map infoMap = new HashMap();
		infoMap.put("id", "n_" + hash);
		infoMap.put("sns_id", naverInfo.getId());
		infoMap.put("sns_type", "naver");
		mav.addAllObjects(infoMap);

		String memberId = memberService.selectMemberFromSNSId(infoMap);
		MemberVO member = memberService.selectMemberById(memberId);

		if (member == null || member.getId().trim().length() < 1) {
			if (naverFor.equals("login")) {
				mav = Alert.alertAndRedirect("네이버 계정으로 가입된 계정이 아닙니다. \\n Member Registration 페이지로 이동합니다.",
						"/naver/registerApiForm.do");
				mav.addObject("sns_id","");
			} else {
				mav.setViewName("redirect:/naver/registerApiForm.do");
			}
			session.removeAttribute("naverFor");
			session.setAttribute("naverInfo", naverInfo);
		} else {
			if (naverFor.equals("login")) {
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("memberInfo", member);
				mav = Alert.alertAndRedirect("Login 되었습니다.", "/main/mainPage.do");
			} else {
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("memberInfo", member);
				mav = Alert.alertAndRedirect("이미 네이버로 가입되어 있는 계정입니다. \\n Login 되었습니다.", "/main/mainPage.do");
			}

		}

		return mav;

	}

	@RequestMapping("/registerApiForm.do")
	public ModelAndView registerApi(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/member/registerApi");
		HttpSession session = request.getSession();
		NaverDTO naverInfo = (NaverDTO) session.getAttribute("naverInfo");
		session.removeAttribute("naverInfo");
		String hash = naverInfo.hash().substring(0, 10);
		
		mav.addObject("sns_id", naverInfo.getId());
		mav.addObject("sns_type", "naver");
		mav.addObject("api_id", "n_" + hash);
		mav.addObject("name", naverInfo.getName());
		mav.addObject("phone", naverInfo.getPhone());
		mav.addObject("email", naverInfo.getEmail());
		return mav;
	}

}
