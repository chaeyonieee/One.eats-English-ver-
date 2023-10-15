package com.example.demo.review.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	
	public OrderVO SearchGoods(OrderVO orderVO);
	
	public int newReviewNo();
	
	public int reviewInsert(Map condMap);

	public int isReviewed(Map condMap);

	public void updateMemberPoint(Map condMap);

	public void insertPointHistoryForReview(Map condMap);

	public void updateOrderReviewStatus(Map condMap);

}
