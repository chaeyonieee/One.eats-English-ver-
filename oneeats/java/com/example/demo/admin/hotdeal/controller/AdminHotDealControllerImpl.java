package com.example.demo.admin.hotdeal.controller;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.hotdeal.service.AdminHotDealService;
import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

@Controller
public class AdminHotDealControllerImpl implements AdminHotDealController {
	@Autowired
	private AdminHotDealService adminHotDealService;
	
	@RequestMapping(value = "/admin/hotdeal/adminHotDealForm.do")
	public ModelAndView sellerHotDealForm(HttpServletRequest request) {

		String goodsNo1 = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo1);
		GoodsVO goodsVO = adminHotDealService.selectGoodsVO(goodsNo);
		System.out.println("goodsVO = " + goodsVO);

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goods", goodsVO);
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value = "/admin/hotdeal/adminHotDealAdd.do", method = RequestMethod.POST)
	public ModelAndView addHotdeals(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("hotdeal등록하기");
		ModelAndView mav = new ModelAndView();
		int newHotDealNo = adminHotDealService.selectNewHotDealNo();

		HotDealVO hotDealVO = new HotDealVO();
		hotDealVO.setHotdealNo(newHotDealNo);
		String name = request.getParameter("name");
		hotDealVO.setName(name);
		String discounted_price = request.getParameter("discounted_price");
		hotDealVO.setDiscounted_price(discounted_price);
		String goods_qty = request.getParameter("goods_qty");
		hotDealVO.setGoods_qty(goods_qty);
		String finishDate = request.getParameter("finishDate");
		hotDealVO.setFinishDate(finishDate);
		String category = request.getParameter("category");
		hotDealVO.setCategory(category);
		String description = request.getParameter("description");
		hotDealVO.setDescription(description);
		String goodsNo_ = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo_);
		hotDealVO.setGoodsNo(goodsNo);

		System.out.println("hotdealVO = " + hotDealVO);
		adminHotDealService.addHotDeal(hotDealVO);

		System.out.println("Product registration successful.");
		mav = Alert.alertAndRedirect("Product을 등록했습니다.",
				request.getContextPath() + "/goods/hotdealDetail.do?hotdealNo=" + newHotDealNo);

		return mav;

	}
	
	@RequestMapping(value = "/admin/hotdealDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goodsDetail(@RequestParam("hotdealNo") int hotdealNo, HttpServletRequest request)
			throws Exception {
		System.out.println("hotdealDetail");
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("hotdealNo = " + hotdealNo);
		HotDealVO hotdeal = adminHotDealService.selectHotDealByHotDealNo(hotdealNo);
		System.out.println("hotdeal = " + hotdeal);
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("hotdeal", hotdeal);
		int goodsNo = hotdeal.getGoodsNo();

		GoodsVO goodsVO = adminHotDealService.SearchGoods(goodsNo);
		System.out.println("goods = " + goodsVO);
		mav.addObject("goods", goodsVO);
		mav.setViewName(viewName);

		return mav;

	}
	// Product List
		@RequestMapping(value = "/admin/hotdeal/adminHotDealList.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView adminHotDealList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("HERE adminHotDealList");
			request.setCharacterEncoding("utf-8");
			response.setContentType("html/text;charset=utf-8");
			String viewName = (String) request.getAttribute("viewName");
			String _pageNum = request.getParameter("pageNum");
			String _section = request.getParameter("section");
			String hotdeal_search_type = request.getParameter("hotdeal_search_type");
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
			if (hotdeal_search_type != null && hotdeal_search_type.length() < 1) {
				hotdeal_search_type = "all";
			}
			Map pagingMap = GeneralFileUploader.getParameterMap(request);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("section", section);
			pagingMap.put("hotdeal_search_type", hotdeal_search_type);
			pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);

			List<HotDealVO> hotdealList = adminHotDealService.selectHotDealListForList(pagingMap);
			List<HotDealVO> newHotDealList = adminHotDealService.selectNewHotDealList();
			int totalHotDealNum = adminHotDealService.selectTotalHotDealNum();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("HotDealList", hotdealList);
			mav.addObject("newHotDealList", newHotDealList);
			mav.addAllObjects(pagingMap);
			mav.addObject("totalHotDealNum", totalHotDealNum);
			System.out.println(totalHotDealNum);
			System.out.println("mav :" + mav);
			return mav;
		}

		// 리스트 Delete
		@Override
		@RequestMapping(value = "/admin/hotdeal/deleteHotdealGoods.do", method = RequestMethod.GET)
		public ModelAndView deleteHotdealGoods(@RequestParam("hotdealNo") int hotdealNo, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			adminHotDealService.deleteHotdealGoods(hotdealNo);
			ModelAndView mav = new ModelAndView("redirect:/admin/hotdeal/adminHotDealList.do");
			return mav;
		}

		@RequestMapping(value = "/admin/hotdeal/adminHotDealModForm.do", method = { RequestMethod.GET,
				RequestMethod.POST })
		public ModelAndView sellerGoodsModForm(HttpServletRequest request, HttpServletResponse response)
				throws IOException {
			System.out.println("HERE adminHotDealModForm");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			String hotdealNo1 = request.getParameter("hotdealNo");
			int hotdealNo = Integer.parseInt(hotdealNo1);
			System.out.println("hotdealNo: " + hotdealNo);
			HotDealVO sellerHotdeal = adminHotDealService.selectHotDealByGoodsNo(hotdealNo);
			System.out.println("sellerHotdeal=" + sellerHotdeal);

			int goodsNo = sellerHotdeal.getGoodsNo();
			GoodsVO goodsVO = adminHotDealService.SearchGoods(goodsNo);
			System.out.println("goods = " + goodsVO);
			ModelAndView mav = new ModelAndView();

			mav.addObject("goods", goodsVO);
			mav.addObject("hotdeal", sellerHotdeal);
			mav.setViewName(viewName);
			System.out.println(sellerHotdeal.getDescription());
			System.out.println("sellerHotdeal:"+sellerHotdeal);
			return mav;

		}


	@RequestMapping(value = "/admin/hotdeal/adminHotDealMod.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView sellerHotDealMod(HttpServletRequest request, HttpServletResponse response)
				throws IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("HEREadminHotDealMod.do ");
				String viewName = (String) request.getAttribute("viewName");

				String hotdealNo1 = request.getParameter("hotdealNo");
				int hotdealNo = Integer.parseInt(hotdealNo1);
				System.out.println("hotdealNo="+hotdealNo);
				String name = request.getParameter("name");
				String discounted_price = request.getParameter("discounted_price");
				String goods_qty = request.getParameter("goods_qty");
				String finishDate = request.getParameter("finishDate");
				String category = request.getParameter("category");
				String description = request.getParameter("description");
				
				HotDealVO sellerHotDeal = new HotDealVO();
				sellerHotDeal.setName(name);
				sellerHotDeal.setDiscounted_price(discounted_price);
				sellerHotDeal.setGoods_qty(goods_qty);
				sellerHotDeal.setFinishDate(finishDate);
				sellerHotDeal.setCategory(category);
				sellerHotDeal.setDescription(description);
				sellerHotDeal.setHotdealNo(hotdealNo);
				System.out.println("sellerHotDeal="+sellerHotDeal);
				adminHotDealService.updateAdminHotDeal(sellerHotDeal);
				ModelAndView mav = new ModelAndView("redirect:/admin/hotdeal/adminHotDealList.do");
				System.out.println(mav);
				return mav;
			}
		}
	
	
	
	

