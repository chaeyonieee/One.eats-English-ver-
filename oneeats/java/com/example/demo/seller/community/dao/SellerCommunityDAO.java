package com.example.demo.seller.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.ReviewVO;

@Mapper
@Repository("sellerCommunityDAO")
public interface SellerCommunityDAO {

	public List<ReviewVO> selectReviewListWithPagingMap(Map pagingMap);

	public int selectTotalReviewsNumWithPagingMap(Map pagingMap);

}
