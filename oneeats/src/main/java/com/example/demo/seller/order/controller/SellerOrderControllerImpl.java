package com.example.demo.seller.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.seller.order.service.SellerOrderService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Controller("sellerOrderController")
public class SellerOrderControllerImpl implements SellerOrderController{
	@Autowired
	private SellerOrderService sellerOrderService;

	@Override
	@RequestMapping(value = "/seller/order/sellerOrderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE sellerOrderList");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int sellerNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");
		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		String order_search_type = request.getParameter("order_search_type");
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
		if (order_search_type != null && order_search_type.length() < 1) {
			order_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("order_search_type", order_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		pagingMap.put("sellerNo", sellerNo);
		
		List<OrderVO> sellerOrderList = sellerOrderService.selectOrderByMemberType(pagingMap);
		int totalOrderNum = sellerOrderService.selectTotalOrderNum();
		System.out.println("sellerOrderList="+sellerOrderList);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(pagingMap);
		mav.addObject("sellerOrderList", sellerOrderList);
		mav.addObject("totalOrderNum", totalOrderNum);
		System.out.println("totalOrderNum="+totalOrderNum);
		System.out.println(mav);
		return mav;
	}

	@Override
	@RequestMapping(value = "/seller/order/sellerOrderCancel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView sellerOrderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE sellerOrderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		String delivery_status = request.getParameter("delivery_status");

		int[] order_seqNos = sellerOrderService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			sellerOrderService.updateDeliveryStatusToCancel(order_seqNo);
		}
		
		
		  int firstOrderSeqNo = order_seqNos.length > 0 ? order_seqNos[0] : 0;
		  sellerOrderService.updateDeliveryStatusToCancel(firstOrderSeqNo);
		 
		
		ModelAndView mav = new ModelAndView("redirect:/seller/order/sellerOrderList.do");
		return mav;
	}
	
	

}
