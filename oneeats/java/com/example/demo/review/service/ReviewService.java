package com.example.demo.review.service;

import java.util.Map;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

public interface ReviewService {

	public OrderVO SearchGoods(OrderVO order);
	
	public int newReviewNo();
	
	public int reviewInsert(Map condMap);

	public boolean isReviewed(Map condMap);

}
