package com.example.demo.seller.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.OrderVO;

@Mapper
@Repository("sellerOrderDAO")
public interface SellerOrderDAO {

	List<OrderVO> selectOrderList();

	int[] selectSeqNoByOrderNo(int orderNo);

	void updateDeliveryStatusToCancel(int order_seqNo);

	List<OrderVO> selectOrderByMemberType(Map pagingMap);

	int selectTotalOrderNum();


}
