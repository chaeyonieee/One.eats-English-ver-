
package com.example.demo.admin.goods.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.goods.service.AdminGoodsService;
import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OptionVO;

@Controller("adminGoodsController")
public class AdminGoodsControllerImpl implements AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;

	@RequestMapping(value = "/admin/goods/adminGoodsForm.do")
	public ModelAndView sellerGoodsForm(HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);

		return mav;
	}

	// Product Registration
	@Override
	@RequestMapping(value = "/admin/goods/addAdminGoods.do", method = RequestMethod.POST)
	public ModelAndView addGoods(MultipartHttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newGoodsNo = adminGoodsService.selectNewGoodsNo();
		List fileList = GeneralFileUploader.upload(request, "/goods/" + newGoodsNo);
		System.out.println("fileList : " + fileList);
		System.out.println("newGoodsNo = " + newGoodsNo);

		// map에 goods 정보를 저장
		Map map = GeneralFileUploader.getParameterMap(request);
		map.put("goodsNo", newGoodsNo);
		for (int i = 0; i < fileList.size(); i++) {
			map.put("img" + (i + 1), fileList.get(i));
		}
		System.out.println("map : " + map);
		// 세션에서 Login한 유저 정보를 불러와 map에 저장
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		if (memberVO == null) {
			map.put("memberNo", 1);
		} else {
			map.put("memberNo", memberVO.getMemberNo());
		}
		System.out.println(map.get("memberNo"));
		boolean result1 = adminGoodsService.addGoods(map);

		// 옵션정보 가져와서 각각의 VO에 저장
		String[] optionNames = request.getParameterValues("option_name"); // 당근당근 optionX
		String[] optionQtys = request.getParameterValues("option_qty");
		String[] optionPrice = request.getParameterValues("option_price");

		OptionVO[] options = new OptionVO[optionNames.length];
		for (int i = 0; i < options.length; i++) {
			OptionVO optionVO = new OptionVO();
			options[i] = optionVO;

		}

		ModelAndView mav = new ModelAndView();
		for (int i = 0; i < optionNames.length; i++) {
			if (optionNames[i] != null) {
				options[i].setName(optionNames[i]);
				options[i].setOption_qty(optionQtys[i]);
				options[i].setPrice(optionPrice[i]);
				options[i].setGoodsNo(newGoodsNo);
				System.out.println(options[i]);
				boolean result = adminGoodsService.optionaddGoods(options[i]);
				if (!result) {
					mav.addObject("redirectMessage", "Product Registration에 실패했습니다.");
					mav.addObject("redirectPage", request.getContextPath() + "/seller/goods/sellerGoodsForm.do");
					mav.setViewName("/alert");
					break;
				}

			} else {
				System.out.println("Product registration failed.");
				break;
			}

		}

		System.out.println("Product registration successful.");
		mav = Alert.alertAndRedirect("Product을 등록했습니다.",
				request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + newGoodsNo);
		return mav;
	}

	// Product List
	@RequestMapping(value = "/admin/goods/adminGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		String _pageNum = request.getParameter("pageNum");
		String _section = request.getParameter("section");
		String goods_search_type = request.getParameter("goods_search_type");
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
		if (goods_search_type != null && goods_search_type.length() < 1) {
			goods_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("section", section);
		pagingMap.put("goods_search_type", goods_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		
		List<GoodsVO> goodsList = adminGoodsService.selectGoodsList(pagingMap);
		List<GoodsVO> newGoodsList = adminGoodsService.selectNewGoodsList();
		int totalGoodsNum = adminGoodsService.selectTotalGoodsNum();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		mav.addObject("newGoodsList", newGoodsList);
		mav.addAllObjects(pagingMap);
		mav.addObject("totalGoodsNum", totalGoodsNum);
		System.out.println("totalGoodsNum :"+totalGoodsNum);
		System.out.println("mav :" + mav);
				return mav;
	}

	//리스트 Delete
		@Override
		@RequestMapping(value = "/admin/goods/deleteAdminGoods.do", method = RequestMethod.GET)
		public ModelAndView deleteAdminGoods(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			adminGoodsService.deleteAdminGoods(goodsNo);
			ModelAndView mav = new ModelAndView("redirect:/admin/goods/adminGoodsList.do");
			return mav;
		}
		
	//Admin Product Delete
		@Override
		@RequestMapping(value = "/admin/goods/deleteAdminSellerGoods.do", method = RequestMethod.GET)
		public ModelAndView deleteAdminSellerGoods(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			adminGoodsService.deleteAdminGoods(goodsNo);
			ModelAndView mav = new ModelAndView("redirect:/admin/goods/adminSellerGoodsList.do");
			return mav;
		}

	//Product Modification 창
		@RequestMapping(value = "/admin/goods/AdminGoodsModForm.do")
		public ModelAndView modForm(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request)
				throws IOException {
			request.setCharacterEncoding("utf-8");
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			GoodsVO goodsVO = adminGoodsService.selectGoodsByGoodsNo(goodsNo);
			mav.addObject("goods", goodsVO);

			List<Map> optionsList = adminGoodsService.selectOptionsBygoodsNo(goodsNo);
			mav.addObject("optionsList", optionsList);

			System.out.println(mav);

			return mav;

		}


		
		//Admin Business List창
		@RequestMapping(value = "/admin/goods/adminSellerGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView adminSellerGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			response.setContentType("html/text;charset=utf-8");
			String viewName = (String) request.getAttribute("viewName");
			String _pageNum = request.getParameter("pageNum");
			String _section = request.getParameter("section");
			String goods_search_type = request.getParameter("goods_search_type");
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
			if (goods_search_type !=null && goods_search_type.length()<1) {
				goods_search_type = "all";
			}	
			Map pagingMap = GeneralFileUploader.getParameterMap(request);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("section", section);
			pagingMap.put("goods_search_type", goods_search_type);
			pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
			
			List<GoodsVO> goodsList = adminGoodsService.selectSellerGoodsList(pagingMap);
			
			int totalGoodsNum = adminGoodsService.selectTotalGoodsNum();
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("goodsList", goodsList);
		
			mav.addAllObjects(pagingMap);
			mav.addObject("totalGoodsNum", totalGoodsNum);
			System.out.println("totalGoodsNum:"+totalGoodsNum);
			System.out.println("mav :" + mav);
			return mav;
			
		}
		
		@RequestMapping(value = "/admin/goods/adminGoodsModForm.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView sellerGoodsModForm(HttpServletRequest request, HttpServletResponse response)
				throws IOException {
			System.out.println("HERE adminGoodsModForm");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			
			int goodsNo = (Integer.parseInt(request.getParameter("goodsNo")));
			System.out.println("goodsNo="+goodsNo);
			GoodsVO sellerGoods = adminGoodsService.selectGoodsByGoodsNo(goodsNo);
			System.out.println("sellerGoods=" + sellerGoods);
			List<OptionVO> options = adminGoodsService.selectOptionByGoodsNo(goodsNo);
			System.out.println("options="+options);

			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("sellerGoods", sellerGoods);
			mav.addObject("options", options);
			return mav;
		}
		
		@RequestMapping(value = "/admin/goods/adminGoodsMod.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView adminGoodsMod(MultipartHttpServletRequest request, HttpServletResponse response)
				throws IOException {
			System.out.println("HERE adminGoodsMod");
			request.setCharacterEncoding("utf-8");
	
			int goodsNo= (Integer.parseInt(request.getParameter("goodsNo")));
			
			
			System.out.println("goodsNo="+goodsNo);
			
			String category = request.getParameter("category");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String rapping = request.getParameter("rapping");
			String manufacturer = request.getParameter("manufacturer");
			String weight = request.getParameter("weight");
			String expDate = request.getParameter("expDate");
			String description = request.getParameter("description");
			String[] option_names = request.getParameterValues("option_name");
			String[] option_qtys = request.getParameterValues("option_qty");
			String[] option_prices = request.getParameterValues("option_price");
			System.out.println("option_names="+Arrays.toString(option_names));
			System.out.println("expDate="+expDate);
			
			
			System.out.println("rapping="+rapping);
			
			int[] optionNos = adminGoodsService.selectOptionNoByGoodsNo(goodsNo);
			for (int optionNo : optionNos) {
				adminGoodsService.deleteOption(optionNo);
			}

			GoodsVO adminGoods = new GoodsVO();
			adminGoods.setCategory(category);
			adminGoods.setName(name);
			adminGoods.setPrice(price);
			adminGoods.setRapping(rapping);
			adminGoods.setManufacturer(manufacturer);
			adminGoods.setWeight(weight);
			adminGoods.setExpDate(expDate);
			adminGoods.setDescription(description);
			adminGoods.setGoodsNo(goodsNo);
			System.out.println("adminGoods="+adminGoods);
			
			String[] originalFileNames = new String[5];
			originalFileNames[0]=request.getParameter("originalFileName1");
			originalFileNames[1]=request.getParameter("originalFileName2");
			originalFileNames[2]=request.getParameter("originalFileName3");
			originalFileNames[3]=request.getParameter("originalFileName4");
			originalFileNames[4]=request.getParameter("originalFileName5");
			
			Iterator<String> files = request.getFileNames();
			String[] imgs = new String[5];
			while (files.hasNext()) {
				String fileName = (String) files.next();
				fileName.strip();
				MultipartFile mFile = request.getFile(fileName);
				System.out.println("fileName="+fileName);
				if (fileName.equals("img1")) {
					imgs[0] = mFile.getOriginalFilename();
				}else if(fileName.equals("img2")) {
					imgs[1] = mFile.getOriginalFilename();
					
				}else if(fileName.equals("img3")) {
					imgs[2] = mFile.getOriginalFilename();
				}else if(fileName.equals("img4")) {
					imgs[3] = mFile.getOriginalFilename();
					
				}else if(fileName.equals("img5")) {
					imgs[4] = mFile.getOriginalFilename();
				}

			}
			
			
			boolean isImgModify = false;
			for (int i = 0; i < imgs.length; i++) {
				String goodsImg = imgs[i];
				goodsImg = goodsImg.strip();
				System.out.println(goodsImg);
				if (goodsImg != null && goodsImg.length() > 0) {
					System.out.println("goodsImg="+goodsImg +"저장하고, "+originalFileNames[i]+"를 지운다?");
					isImgModify = true;
					GeneralFileUploader.removeFile(originalFileNames[i], "/goods/" + goodsNo);
					if (i==1) {
						adminGoods.setImg1(goodsImg);
					}else if(i==2) {
						adminGoods.setImg2(goodsImg);
					}else if(i==3) {
						adminGoods.setImg3(goodsImg);
					}else if(i==4) {
						adminGoods.setImg4(goodsImg);
					}else if(i==5) {
						adminGoods.setImg5(goodsImg);
					}
				}
			}
			if (isImgModify) {
				GeneralFileUploader.upload(request, "/goods/" + goodsNo);
			}
			
			
			List<OptionVO> selectOptions = new ArrayList();
			for (int i=0; i<option_names.length; i++) {
				OptionVO temp = new OptionVO();
				temp.setName(option_names[i]);
				temp.setOption_qty(option_qtys[i]);
				temp.setPrice(option_prices[i]);
				temp.setGoodsNo(goodsNo);
				selectOptions.add(temp);
			}
			System.out.println("selectOptions"+selectOptions);
			

			adminGoodsService.updateAdminGoods(adminGoods);
			for (OptionVO optionVO : selectOptions) {
				adminGoodsService.insertOptionForMod(optionVO);
			}

			ModelAndView mav = new ModelAndView("redirect:/admin/goods/adminGoodsList.do");
			return mav;
		}

		
		
		
		
		
}

