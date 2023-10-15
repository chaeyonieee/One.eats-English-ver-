package com.example.demo.admin.order.controller;

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

import com.example.demo.admin.order.service.AdminOrderService;
import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.vo.OrderVO;

@Controller("adminOrderController")
public class AdminOrderControllerImpl implements AdminOrderController {
	@Autowired
	private AdminOrderService adminOrderService;
	
	@Override
	@RequestMapping(value = "/admin/order/adminOrderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE adminOrderList");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
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
		
		List<OrderVO> adminOrderList = adminOrderService.selectOrderByMemberType(pagingMap);
		int totalOrderNum = adminOrderService.selectTotalOrderNum();
		System.out.println(adminOrderList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(pagingMap);
		mav.addObject("adminOrderList", adminOrderList);
		mav.addObject("totalOrderNum", totalOrderNum);
		System.out.println("totalOrderNum="+totalOrderNum);
		System.out.println(mav);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/admin/order/adminOrderCancel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminOrderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HERE adminOrderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		String delivery_status = request.getParameter("delivery_status");

		int[] order_seqNos = adminOrderService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			adminOrderService.updateDeliveryStatusToCancel(order_seqNo);
		}
		
		
		  int firstOrderSeqNo = order_seqNos.length > 0 ? order_seqNos[0] : 0;
		  adminOrderService.updateDeliveryStatusToCancel(firstOrderSeqNo);
		 
		
		ModelAndView mav = new ModelAndView("redirect:/admin/order/adminOrderList.do");
		return mav;
	}
	
	@RequestMapping("/admin/order/modDeliveryStatus.do")
	public ModelAndView modDeliveryStatus(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		String delivery_status = request.getParameter("delivery_status");
		int[] order_seqNos = adminOrderService.selectSeqNoByOrderNo(orderNo);
		try {
			adminOrderService.updateDeliveryStatusWithOrderSeqArray(order_seqNos,delivery_status);
			mav = Alert.alertAndRedirect("Updated successfully.", request.getContextPath() +"/admin/order/adminOrderList.do");
		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("Failed to update.", request.getContextPath() +"/admin/order/adminOrderList.do");
		}
		
		
		
		return mav;
		
		
	}
}
