package com.example.demo.seller.community.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.ReviewVO;

public interface SellerCommunityService {

	public List<ReviewVO> selectReviewListWithPagingMap(Map pagingMap);

	public int selectTotalReviewsNumWithPagingMap(Map pagingMap);

}
