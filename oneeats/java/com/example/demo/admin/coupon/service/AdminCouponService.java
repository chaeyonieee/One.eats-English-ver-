package com.example.demo.admin.coupon.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.CouponVO;
import com.example.demo.vo.OrderVO;

public interface AdminCouponService {

	List<CouponVO> selectAdminCouponByMemberNo(int memberNo);

	void insertAdminCoupon(CouponVO coupon);

	void deleteAdminCoupon(int couponNo);

	List<CouponVO> selectAdminCouponByMemberNo(Map pagingMap);

	int selectTotalCouponNum(int memberNo);

}
