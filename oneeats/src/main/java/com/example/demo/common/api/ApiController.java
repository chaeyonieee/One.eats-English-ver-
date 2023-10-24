package com.example.demo.common.api;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.kakao.service.KakaoService;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.common.functions.GeneralFunctions;
import com.example.demo.member.service.MemberService;

@Controller
public class ApiController {
	@Autowired
	private KakaoService kakaoService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/api/register.do", method = RequestMethod.POST)
	public ModelAndView Register(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		boolean result = true;
		ModelAndView mav = new ModelAndView();
		try {
			int memberNo = memberService.registerInfoNo(); // new로운 No
			Map memberMap = GeneralFileUploader.getParameterMap(request);
			memberMap.put("memberNo", memberNo);
			System.out.println(memberMap);
			String _birth = (String) memberMap.get("birth");
			String sms_agreement = (String) memberMap.get("sms_agreement");
			String email_agreement = (String) memberMap.get("email_agreement");
			String zipCode = (String) memberMap.get("zipCode");
			String phone = (String) memberMap.get("phone");
			
			if (_birth == null || _birth.trim().length() < 1) {
				memberMap.put("birth", null);
			}
			if (email_agreement == null || email_agreement.trim().length() < 1) {
				memberMap.put("email_agreement", "no");
			}
			if (sms_agreement == null || sms_agreement.trim().length() < 1) {
				memberMap.put("sms_agreement", "no");
			}

			if (zipCode == null || zipCode.trim().length() < 1 || !GeneralFunctions.isInteger(zipCode)) {
				memberMap.put("zipCode", 0);
			}
			
			if(phone == null || phone.trim().length()<1) {
				memberMap.put("phone", "snsRegister");
			}
			
			memberMap.put("pwd", "snsRegister");

			try {
				memberService.insertMemberWithSNSMap(memberMap);
			} catch (Exception e) {
				e.printStackTrace();
				result = false;
			}
		} catch (Exception e) {
			result = false;
		}
		if (result) {
			mav = Alert.alertAndRedirect("Registration for membership is complete.", request.getContextPath() + "/member/loginForm.do");
		} else {

			mav = Alert.alertAndRedirect("An error occurred, unable to do the registrationl.",
					request.getContextPath() + "/member/registerTypeSelect.do");

		}
		return mav;
	}

	@RequestMapping(value = "/apitest/registerSelect.do")
	public ModelAndView registerForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/member/registerTypeSelect");
		mav.addObject("kakaoUrl", kakaoService.getKakaoLogin());
		return mav;
	}

}
