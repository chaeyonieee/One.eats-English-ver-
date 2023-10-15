package com.example.demo.admin.coupon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.coupon.dao.AdminCouponDAO;
import com.example.demo.vo.CouponVO;

@Service("adminCouponService")
public class AdminCouponServiceImpl implements AdminCouponService {
	@Autowired
	private AdminCouponDAO adminCouponDAO;

	@Override
	public List<CouponVO> selectAdminCouponByMemberNo(int memberNo) {
		return adminCouponDAO.selectAdminCouponByMemberNo(memberNo);
	}

	@Override
	public void insertAdminCoupon(CouponVO coupon) {
		adminCouponDAO.insertAdminCoupon(coupon);
	}

	@Override
	public void deleteAdminCoupon(int couponNo) {
		adminCouponDAO.deleteAdminCoupon(couponNo);
	}

	@Override
	public List<CouponVO> selectAdminCouponByMemberNo(Map pagingMap) {
		return adminCouponDAO.selectAdminCouponByMemberNo(pagingMap);
	}

	@Override
	public int selectTotalCouponNum(int memberNo) {
		return adminCouponDAO.selectTotalCouponNum(memberNo);
	}
	
}
