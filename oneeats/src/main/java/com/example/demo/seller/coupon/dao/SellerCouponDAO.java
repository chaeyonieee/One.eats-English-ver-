package com.example.demo.seller.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.CouponVO;

@Mapper
@Repository("sellerCouponDAO")
public interface SellerCouponDAO {

	void insertSellerCoupon(CouponVO coupon);

	List<CouponVO> selectSellerCouponByMemberNo(int memberNo);

	void deleteSellerCoupon(int couponNo);

	List<CouponVO> selectSellerCouponByMemberNo(Map pagingMap);

	int selectTotalCouponNum(int memberNo);

}
