package com.example.demo.admin.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.CouponVO;

@Mapper
@Repository("adminCouponDAO")
public interface AdminCouponDAO {

	List<CouponVO> selectAdminCouponByMemberNo(int memberNo);

	void insertAdminCoupon(CouponVO coupon);

	void deleteAdminCoupon(int couponNo);

	List<CouponVO> selectAdminCouponByMemberNo(Map pagingMap);

	int selectTotalCouponNum(int memberNo);

}
