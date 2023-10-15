package com.example.demo.common.file;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {
	private static final String CURR_IMAGE_REPO_PATH = "c:\\file_repo";
	
	
	@RequestMapping(value = "/form")
	private String form() {
		return "uploadForm";

	}

	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	private ModelAndView upload(MultipartHttpServletRequest multipartHttpServletRequest,HttpServletResponse response) throws IllegalStateException, IOException{
		multipartHttpServletRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Enumeration enu = multipartHttpServletRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartHttpServletRequest.getParameter(name);
			map.put(name, value);
		}
		
		List fileList = fileProcess(multipartHttpServletRequest);
		map.put("fileList", fileList);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("result");
		return mav;
	}

	private List fileProcess(MultipartHttpServletRequest multipartHttpServletRequest) throws IllegalStateException, IOException {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartHttpServletRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = (String) fileNames.next();
			MultipartFile mFile = multipartHttpServletRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+fileName);
			if (mFile.getSize()!=0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+originalFileName));
			}
			
		}
		return fileList;
		
	}
	
}
