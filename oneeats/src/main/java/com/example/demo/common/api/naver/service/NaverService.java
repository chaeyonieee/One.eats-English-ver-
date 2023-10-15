package com.example.demo.common.api.naver.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.example.demo.common.api.naver.dto.NaverDTO;

@Service
public class NaverService {
	@Value("${naver.client.id}")
	private String NAVER_CLIENT_ID;

	@Value("${naver.client.secret}")
	private String NAVER_CLIENT_SECRET;

	@Value("${naver.redirect.url}")
	private String NAVER_REDIRECT_URL;

	private final static String NAVER_AUTH_URI = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	private final static String NAVER_API_URI = "https://nid.naver.com/oauth2.0/token";

	public String getNaverLogin(String state) {
		return NAVER_AUTH_URI + "&client_id=" + NAVER_CLIENT_ID + "&redirect_uri=" + NAVER_REDIRECT_URL + "&state="
				+ state;
	}

	public NaverDTO getNaverInfo(String code, String state) throws Exception {
		if (code == null)
			throw new Exception("Failed get authorization code");

		String accessToken = "";
		String refreshToken = "";

		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "application/x-www-form-urlencoded");

			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", NAVER_CLIENT_ID);
			params.add("client_secret", NAVER_CLIENT_SECRET);
			params.add("code", code);
			params.add("redirect_uri", NAVER_REDIRECT_URL);
			params.add("state", state);

			RestTemplate restTemplate = new RestTemplate();
			HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(params, headers);

			ResponseEntity<String> response = restTemplate.exchange(NAVER_API_URI, HttpMethod.POST, httpEntity,
					String.class);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(response.getBody());

			accessToken = (String) jsonObj.get("access_token");
			refreshToken = (String) jsonObj.get("refresh_token");
		} catch (Exception e) {
			throw new Exception("API call failed");
		}
		
		return getUserInfoWithToken(accessToken);

	}

	private NaverDTO getUserInfoWithToken(String accessToken) throws Exception {
		// HttpHeader 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader 담기
		RestTemplate rt = new RestTemplate();
		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers);
		ResponseEntity<String> response = rt.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.POST,
				httpEntity, String.class);

		// Response 데이터 파싱
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(response.getBody());
		JSONObject res = (JSONObject) jsonObj.get("response");

		String id = (String) res.get("id");
		String name = String.valueOf(res.get("name"));
		String email = String.valueOf(res.get("email"));
		String mobile = String.valueOf(res.get("mobile"));
		NaverDTO naverInfo = new NaverDTO(id, name, email, mobile); 
		return naverInfo;
	}

	public void getNaverDelete(String code, String state) throws Exception {
		if (code == null)
			throw new Exception("Failed get authorization code");

		String accessToken = "";
		String refreshToken = "";

		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "application/x-www-form-urlencoded");

			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", "authorization_code");
			params.add("client_id", NAVER_CLIENT_ID);
			params.add("client_secret", NAVER_CLIENT_SECRET);
			params.add("code", code);
			params.add("redirect_uri", NAVER_REDIRECT_URL);
			params.add("state", state);

			RestTemplate restTemplate = new RestTemplate();
			HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(params, headers);

			ResponseEntity<String> response = restTemplate.exchange(NAVER_API_URI, HttpMethod.POST, httpEntity,
					String.class);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(response.getBody());

			accessToken = (String) jsonObj.get("access_token");
			refreshToken = (String) jsonObj.get("refresh_token");
		} catch (Exception e) {
			throw new Exception("API call failed");
		}
		deleteToken(accessToken);
		return;

	}

	/**
	 * 서버 통신 메소드
	 * 
	 * @param apiURL
	 * @param headerStr
	 * @return
	 * @throws IOException
	 */
	private String requestToServer(String apiURL, String headerStr) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		System.out.println("header Str: " + headerStr);
		if (headerStr != null && !headerStr.equals("")) {
			con.setRequestProperty("Authorization", headerStr);
		}
		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.println("responseCode=" + responseCode);
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			return res.toString();
		} else {
			return null;
		}
	}

	private String requestToServer(String apiURL) throws IOException {
		return requestToServer(apiURL, "");
	}

	private String deleteToken(String accessToken) throws IOException {
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
		apiURL += "client_id=" + NAVER_CLIENT_ID;
		apiURL += "&client_secret=" + NAVER_CLIENT_SECRET;
		apiURL += "&access_token=" + accessToken;
		apiURL += "&service_provider=NAVER";
		String res = requestToServer(apiURL);
		System.out.println(res);
		return null;
	}
}
