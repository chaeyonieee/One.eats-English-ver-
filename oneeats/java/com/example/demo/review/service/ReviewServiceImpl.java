package com.example.demo.review.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.review.dao.ReviewDAO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public OrderVO SearchGoods(OrderVO order) {
		OrderVO orderVO = reviewDAO.SearchGoods(order);
		return orderVO;
	}
	
	@Override
	public int newReviewNo() {
		int reviewNo = reviewDAO.newReviewNo();
		return reviewNo;
	}
	
	@Override
	@Transactional
	public int reviewInsert(Map condMap) {
		reviewDAO.updateOrderReviewStatus(condMap);
		boolean isReviewed = isReviewed(condMap);
		if (isReviewed==false) {
			reviewDAO.updateMemberPoint(condMap);
			reviewDAO.insertPointHistoryForReview(condMap);
		}
		
		return reviewDAO.reviewInsert(condMap);
	}
	
	@Override
	public boolean isReviewed(Map condMap) {
		int result = reviewDAO.isReviewed(condMap);
		if (result>0) {
			return true;
		}
		return false;
	}


	
	
}
