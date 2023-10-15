package com.example.demo.seller.coupon.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.CouponVO;

public interface SellerCouponService {

	List<CouponVO> selectSellerCouponByMemberNo(int memberNo);

	void insertSellerCoupon(CouponVO coupon);

	void deleteSellerCoupon(int couponNo);

	List<CouponVO> selectSellerCouponByMemberNo(Map pagingMap);

	int selectTotalCouponNum(int memberNo);

}
