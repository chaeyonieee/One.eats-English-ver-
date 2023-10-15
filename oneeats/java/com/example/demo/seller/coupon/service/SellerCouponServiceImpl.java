package com.example.demo.seller.coupon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.coupon.dao.SellerCouponDAO;
import com.example.demo.vo.CouponVO;

@Service("sellerCouponService")
public class SellerCouponServiceImpl implements SellerCouponService{
	@Autowired 
	private SellerCouponDAO sellerCouponDAO;

	@Override
	public List<CouponVO> selectSellerCouponByMemberNo(int memberNo) {
		return sellerCouponDAO.selectSellerCouponByMemberNo(memberNo);
	}

	@Override
	public void insertSellerCoupon(CouponVO coupon) {
		sellerCouponDAO.insertSellerCoupon(coupon);
		
	}

	@Override
	public void deleteSellerCoupon(int couponNo) {
		sellerCouponDAO.deleteSellerCoupon(couponNo);
	}

	@Override
	public List<CouponVO> selectSellerCouponByMemberNo(Map pagingMap) {
		return sellerCouponDAO.selectSellerCouponByMemberNo(pagingMap);
	}

	@Override
	public int selectTotalCouponNum(int memberNo) {
		return sellerCouponDAO.selectTotalCouponNum(memberNo);
	} 
	
	

}
