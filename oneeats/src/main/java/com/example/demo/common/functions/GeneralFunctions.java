package com.example.demo.common.functions;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;

public class GeneralFunctions {
	public static boolean isInteger(String string) {
		boolean isInteger = string.matches("-?\\d+");
		return isInteger;

	}

	public static String hash256(String str) {
		String hash = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hashBytes = digest.digest(str.getBytes(StandardCharsets.UTF_8));

			StringBuilder hexString = new StringBuilder();
			for (byte hashByte : hashBytes) {
				String hex = Integer.toHexString(0xff & hashByte);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}

			hash = hexString.toString();
			System.out.println(hash);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash;
	}

	public static String hashMD5(String str) {
		String hash="";
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] hashBytes = digest.digest(str.getBytes());

			StringBuilder hexString = new StringBuilder();
			for (byte hashByte : hashBytes) {
				String hex = String.format("%02x", hashByte);
				hexString.append(hex);
			}

			hash = hexString.toString();
			System.out.println(hash);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash;
	}
	
	public static String getPreviousPage(HttpServletRequest request) {
		return request.getHeader("Referer");
	}
	
	public static ModelAndView getAlertPreviousRedirect(HttpServletRequest request, String msg) {
		return Alert.alertAndRedirect(msg, getPreviousPage(request));
	}
	
	public static String getQuery(Map map) {
		String query = "";
		for (Object key : map.keySet()) {
			String _key = key.toString();
		    String value = map.get(key).toString();
		    query += "&"+_key+"="+value;
		}
		query = query.substring(1);
		return query;
	}
	
	
	public static Map getPagingMap(Map map,int elNumForPage) throws Exception {
		String _pageNum = (String) map.get("pageNum");
		String _section = (String) map.get("section");
		String category = (String) map.get("category");
		
		
		if (_pageNum==null||_pageNum.trim().length()<1) {
			_pageNum = "1";
		}
		if (_section==null || _section.trim().length()<1) {
			_section = "1";
		}
		if (category==null) {
			category="";
		}
		
		int start = ((Integer.parseInt(_section) - 1)*10 + Integer.parseInt(_pageNum) - 1) * elNumForPage;
		int numForPage = elNumForPage;
		map.put("section", _section);
		map.put("pageNum", _pageNum);
		map.put("category", category);
		map.put("start", start);
		map.put("numForPage", numForPage);
		return map;
	}

	public static Map getPagingMap(Map map) throws Exception{
		return getPagingMap(map,10);
	}
	
	
	public static Map getPagingMap(HttpServletRequest request) throws Exception{
		return getPagingMap(GeneralFileUploader.getParameterMap(request));
	}
	
	public static Map getPagingMap(HttpServletRequest request,int elNumForPage) throws Exception{
		return getPagingMap(GeneralFileUploader.getParameterMap(request),elNumForPage);
	}
	
	
	public static String renderPageButtons(int section, int elNumForPage, int totalNumber,String onclickFunction,String[] functionParams) {
		String result = "";
		result += " <div><ul class=\"ul-li\">";

		if (section > 1) {
			result += " <li class=\"li-btn\">\r\n" + "                <button\r\n"
					+ "                  class=\"btn-2 btn-square bg-white btn-border\"\r\n"
					+ "                  onclick=\""+onclickFunction
					+ "('-1','1'";
			for (String param : functionParams) {
				result += ",'"+param+"'";
			}
			result += ")\"\r\n"
					+ "                >\r\n" + "                  <i class=\"bi bi-arrow-left\"></i>\r\n"
					+ "                </button>\r\n" + "              </li>";

		}
		double remainPages = (totalNumber - (section-1)*elNumForPage*10);
		int end = (int) Math.ceil(remainPages / elNumForPage);
		if (end>10) {
			end = 10;
		}
		for (int i = 1; i <= end; i++) {
			result += "<li class=\"li-btn\">\r\n"
					+ "                            <button\r\n"
					+ "                              class=\"btn-2 btn-square bg-white btn-border\"\r\n"
					+ "                              onclick=\""+onclickFunction
					+ "('0','"+i
					+ "'";
			for (String param : functionParams) {
				result += ",'"+param+"'";
			}
			
			result		+= ")\"\r\n"
					+ "                            >\r\n"
					+ "                              "+(((section-1)*10)+i)
					+ "\r\n"
					+ "                            </button>\r\n"
					+ "                          </li>";
		}
		
		if (section*elNumForPage*10<totalNumber) {
			result += "<li class=\"li-btn\">\r\n"
					+ "                            <button\r\n"
					+ "                              class=\"btn-2 btn-square bg-white btn-border\"\r\n"
					+ "                              onclick=\""+onclickFunction
					+ "('1','1'";
			for (String param : functionParams) {
				result += ",'"+param+"'";
			}
			result
					+= ")\"\r\n"
					+ "                            >\r\n"
					+ "                              <i class=\"bi bi-arrow-right\"></i>"
					+ "                            </button>\r\n"
					+ "                          </li>";
		}
		result += " </ul></div>";
		
		
		return result;
	}

}
