package com.example.demo.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.OrderVO;

public interface AdminOrderService {

	List<OrderVO> selectOrderList();

	int[] selectSeqNoByOrderNo(int orderNo);

	void updateDeliveryStatusToCancel(int order_seqNo);

	int selectTotalOrderNum();

	List<OrderVO> selectOrderByMemberType(Map pagingMap);

	public void updateDeliveryStatusWithOrderSeqArray(int[] order_seqNos, String delivery_status);

}
