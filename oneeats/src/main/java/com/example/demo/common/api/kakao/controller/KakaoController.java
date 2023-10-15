package com.example.demo.common.api.kakao.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.kakao.dto.KakaoDTO;
import com.example.demo.common.api.kakao.service.KakaoService;
import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller
@RequestMapping("kakao")
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/registerForm.do")
	public ModelAndView kakaoRegister(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:" + kakaoService.getKakaoLogin());
		HttpSession session = request.getSession();
		session.setAttribute("kakaoFor", "register");
		return mav;
	}

	@RequestMapping(value = "/loginForm.do")
	public ModelAndView kakaoLogin(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("redirect:" + kakaoService.getKakaoLogin());
		HttpSession session = request.getSession();
		session.setAttribute("kakaoFor", "login");
		return mav;
	}

	@GetMapping("/callback")
	public ModelAndView callback(HttpServletRequest request) throws Exception {
		KakaoDTO kakaoInfo = kakaoService.getKakaoInfo(request.getParameter("code"));

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String kakaoFor = (String) session.getAttribute("kakaoFor");

		if (kakaoFor == null || kakaoFor.trim().length() < 1) {
			mav = Alert.alertAndRedirect("Invalid API access.", request.getContextPath() + "/main/mainPage.do");
			return mav;
		}

		// id를 참조해서 가입된 유저인지 판단한다.
		// 가입된 유저면 그대로 Login, 가입되지 않은 유저면 Member Registration창으로 이동.
		long hash = kakaoInfo.hash();
		System.out.println(kakaoInfo);
		
		Map infoMap = new HashMap();
		infoMap.put("id", "kakao_"+hash);
		infoMap.put("sns_id", kakaoInfo.getId());
		infoMap.put("sns_type", "kakao");
		
		String memberId = memberService.selectMemberFromSNSId(infoMap);
		MemberVO member = memberService.selectMemberById(memberId);
				

		if (member == null || member.getId().trim().length() < 1) {
			if (kakaoFor.equals("login")) {
				mav = Alert.alertAndRedirect("This is not an account registered with a Kakao account. \\n redirected to the registration page.",
						"/kakao/registerApiForm.do");
				
				
			} else {
				mav.setViewName("redirect:/kakao/registerApiForm.do");
			}
			session.removeAttribute("kakaoFor");
			session.setAttribute("kakaoInfo", kakaoInfo);
		} else {
			if (kakaoFor.equals("login")) {
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("memberInfo", member);
				mav = Alert.alertAndRedirect("You have been logged in.", "/main/mainPage.do");
			} else {
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("memberInfo", member);
				mav = Alert.alertAndRedirect("This account has already been registered with Kakao. \\n You have been logged in", "/main/mainPage.do");
			}

		}

		return mav;
	}

	@RequestMapping("/registerApiForm.do")
	public ModelAndView registerApi(HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/registerApi");
		KakaoDTO kakaoInfo = (KakaoDTO) session.getAttribute("kakaoInfo");
		session.removeAttribute("kakaoInfo");
		long hash = kakaoInfo.hash();
		mav.addObject("api_id", "kakao_" + hash);
		mav.addObject("sns_id", hash);
		mav.addObject("sns_type","kakao");
		mav.addObject("name", kakaoInfo.getNickname());
		mav.addObject("email", kakaoInfo.getEmail());
		return mav;
	}
}
