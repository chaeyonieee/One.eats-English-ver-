package com.example.demo.common.api.toss.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.toss.dto.TossDTO;
import com.example.demo.common.file.GeneralFileUploader;

@Controller
public class TossController {
	@Value("${toss.api.secret}")
	private String TOSS_SECRET;

	@Value("${toss.api.key}")
	private String TOSS_API;

	@RequestMapping("/toss/orderSuccess.do")
	public ModelAndView orderSuccess(HttpServletRequest request) throws Exception {
		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String secretKey = TOSS_SECRET + ":";

		Encoder encoder = Base64.getEncoder();
		byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
		String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

		paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

		URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Authorization", authorizations);
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		JSONObject obj = new JSONObject();
		obj.put("paymentKey", paymentKey);
		obj.put("orderId", orderId);
		obj.put("amount", amount);

		OutputStream outputStream = connection.getOutputStream();
		outputStream.write(obj.toString().getBytes("UTF-8"));

		int code = connection.getResponseCode();
		boolean isSuccess = code == 200 ? true : false;

		InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

		Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(reader);
		responseStream.close();
		System.out.println(jsonObject);

		Map map = (Map) jsonObject;

		ModelAndView mav = new ModelAndView("redirect:/mypage/newOrder.do");
		mav.addAllObjects(map);
		TossDTO tossInfo = new TossDTO(map);
		tossInfo.setJson_data(jsonObject.toString());
		HttpSession session = request.getSession();
		session.setAttribute("tossInfo", tossInfo);
		return mav;
	}

	@RequestMapping("/toss/orderFail.do")
	public ModelAndView orderFail(HttpServletRequest request) {
		ModelAndView mav = Alert.alertAndRedirect("Payment Failed.", request.getContextPath() + "/mypage/orderConfirm.do");
		return mav;
	}

	
	@RequestMapping("/toss/orderCancel.do")
	public ModelAndView orderCancel(HttpServletRequest request) throws IOException, Exception {
		ModelAndView mav = new ModelAndView();
		String paymentKey = request.getParameter("paymentKey");
		String orderNo = request.getParameter("orderNo");
		String cancelReason = request.getParameter("cancel_reason");
		String bank = request.getParameter("bank");
		String accountNumber = request.getParameter("accountNumber");
		String holderName = request.getParameter("holderName");
		String paymentType = request.getParameter("paymentType");
		String secretKey = TOSS_SECRET + ":";

		// 부분 cancel에서만 사용
//		String cancelAmount = "300";


		
		Encoder encoder = Base64.getEncoder();
		byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
		String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

		URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey + "/cancel");

		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Authorization", authorizations);
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);

		JSONObject obj = new JSONObject();
		obj.put("cancelReason", cancelReason);
//		obj.put("cancelAmount", cancelAmount);
		
		if (paymentType != null && paymentType.equals("Virtual Account")) {
			JSONObject refundReceiveAccount = new JSONObject();
			refundReceiveAccount.put("bank", bank);
			refundReceiveAccount.put("accountNumber", accountNumber);
			refundReceiveAccount.put("holderName", holderName);

			obj.put("refundReceiveAccount", refundReceiveAccount);
		}
		
		
	//	obj.put("refundableAmount", refundableAmount);

		OutputStream outputStream = connection.getOutputStream();
		outputStream.write(obj.toString().getBytes("UTF-8"));

		int code = connection.getResponseCode();
		boolean isSuccess = code == 200 ? true : false;

		InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

		Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(reader);
		responseStream.close();
		System.out.println(jsonObject);
		
		if (isSuccess) {
			mav.setViewName("redirect:"+request.getContextPath()+"/mypage/orderCancelResult.do");
			mav.addObject("orderNo",orderNo);
		}else {
			mav = Alert.alertAndRedirect("Cancellation was not successful.", request.getContextPath()+"/mypage/orderList.do");
		}
		
		return mav;

	}

}
