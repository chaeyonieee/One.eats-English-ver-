package com.example.demo.seller.order.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.OrderVO;

public interface SellerOrderService {

	List<OrderVO> selectOrderList();

	int[] selectSeqNoByOrderNo(int orderNo);

	void updateDeliveryStatusToCancel(int order_seqNo);

	List<OrderVO> selectOrderByMemberType(Map pagingMap);

	int selectTotalOrderNum();


}
