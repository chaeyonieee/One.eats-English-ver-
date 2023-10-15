package com.example.demo.seller.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.community.dao.SellerCommunityDAO;
import com.example.demo.vo.ReviewVO;

@Service("sellerCommunityService")
public class SellerCommunityServiceImpl implements SellerCommunityService{
	@Autowired
	private SellerCommunityDAO sellerCommunityDAO;

	@Override
	public List<ReviewVO> selectReviewListWithPagingMap(Map pagingMap) {
		
		return sellerCommunityDAO.selectReviewListWithPagingMap(pagingMap);
	}

	@Override
	public int selectTotalReviewsNumWithPagingMap(Map pagingMap) {
		return sellerCommunityDAO.selectTotalReviewsNumWithPagingMap(pagingMap);
	}

	
	
}
