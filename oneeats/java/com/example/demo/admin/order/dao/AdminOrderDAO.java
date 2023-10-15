package com.example.demo.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.OrderVO;

@Mapper
@Repository("adminOrderDAO")
public interface AdminOrderDAO {

	List<OrderVO> selectOrderList();

	int[] selectSeqNoByOrderNo(int orderNo);

	void updateDeliveryStatusToCancel(int order_seqNo);

	int selectTotalOrderNum();

	List<OrderVO> selectOrderByMemberType(Map pagingMap);

	public void updateDeliveryStatus(OrderVO temp);

	OrderVO selectOrderByOrderSeqNo(int order_seqNo);

	void updateMemberPoint(OrderVO orderVO);

	void insertPointHistoryWithOrderVO(OrderVO orderVO);

}
