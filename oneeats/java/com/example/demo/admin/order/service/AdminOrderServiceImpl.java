package com.example.demo.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.admin.order.dao.AdminOrderDAO;
import com.example.demo.vo.OrderVO;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	private AdminOrderDAO adminOrderDAO;

	@Override
	public List<OrderVO> selectOrderList(){
		return adminOrderDAO.selectOrderList();
	}

	@Override
	public int[] selectSeqNoByOrderNo(int orderNo) {
		return adminOrderDAO.selectSeqNoByOrderNo(orderNo);
	}

	@Override
	public void updateDeliveryStatusToCancel(int order_seqNo) {
		adminOrderDAO.updateDeliveryStatusToCancel(order_seqNo);
		
	}
	
	@Override
	public List<OrderVO> selectOrderByMemberType(Map pagingMap) {
		return adminOrderDAO.selectOrderByMemberType(pagingMap);
	}

	@Override
	public int selectTotalOrderNum() {
		return adminOrderDAO.selectTotalOrderNum();
	}

	@Override
	@Transactional
	public void updateDeliveryStatusWithOrderSeqArray(int[] order_seqNos, String delivery_status) {
		for (int i = 0; i < order_seqNos.length; i++) {
			int order_seqNo = order_seqNos[i];
			OrderVO temp = new OrderVO();
			temp.setOrder_seqNo(order_seqNo);
			temp.setDelivery_status(delivery_status);
			adminOrderDAO.updateDeliveryStatus(temp);
		}
		if (delivery_status.equals("Order Complete")) {			
			OrderVO orderVO = adminOrderDAO.selectOrderByOrderSeqNo(order_seqNos[0]);
			adminOrderDAO.updateMemberPoint(orderVO);
			adminOrderDAO.insertPointHistoryWithOrderVO(orderVO);
		}
		
	}	
	
	
	
}
