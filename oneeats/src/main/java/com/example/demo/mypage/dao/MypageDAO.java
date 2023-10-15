package com.example.demo.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.PointHistoryVO;
import com.example.demo.vo.ReviewVO;

@Mapper
@Repository("mypageDAO")
public interface MypageDAO {
	
	public List<BookmarkVO> selectBookListWithPagingMap(Map pagingMap);

	public int selectBookListTotalNum(int memberNo);

	public List<CouponVO> selectCouponListWithPagingMap(Map pagingMap);
	public int selectCouponListTotalNum(int memberNo);
	public List<PointHistoryVO> selectPointListWithPagingMap(Map pagingMap);
	public int selectPointListTotalNum(int memberNo);
	
	public void deleteMember(MemberVO member);

	public List<OrderVO> selectOrderList() throws DataAccessException;
	
	public List<OrderVO> selectOrderByMemberNo(int memberNo);
	
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws DataAccessException;
	
	public void insertOrderList(List<OrderVO> orderList);
	
	public int[] selectSeqNoByOrderNo(int orderNo);

	public void updateDeliveryStatusToCancel(int order_seqNo);
	
	public int selectCountOrderNum(Map<String, Object> map);
	
	public List<OrderVO> selectOrderByMemberNo(Map pagingMap);
	
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws DataAccessException;
	
	public MemberVO selectMypageList(String member_id) throws DataAccessException;
	
	//민아 Edit the profile
	public void mypageintroupdate(HashMap memberMap) throws DataAccessException;
	
	//민아 찜
	public List selectBookList(MemberVO memberInfo) throws DataAccessException;
	
	//민아 찜 Delete
	public int deleteBookMark(int goodsNo) throws DataAccessException;
	
	//민아 Coupon
	public List<CouponVO> couponSearch(MemberVO memberInfo) throws DataAccessException;
	public List<PointHistoryVO> pointSearch(MemberVO memberInfo) throws DataAccessException;

	public int selectNewOrderNo();

	//민아 Order AddressManagement - 출력
	public List<DeliveryAddressVO> myAddress(int memberNo) throws DataAccessException;
	public void deleteAddress(int deliveryNo);
	
	//민아 Member Information Modify
	public void updateMemberInfo(MemberVO memberVO) throws DataAccessException;
	
	public List<OrderVO> selectAvailableReviewList(int memberNo) throws DataAccessException;
	
	public List<OrderVO> selectDoneReviewList(int memberNo) throws DataAccessException;

	public CouponVO couponNum(String couponCode);
	
	public CouponVO couponNull(CouponVO result);
	
	public void couponInsert(CouponVO result);

	public void insertTempOrderList(List<OrderVO> orderList);

	public void updateTempOrderList(Map payInfoMap);

	public void insertAddressWithMap(Map condMap);

	public void updateDeliveryAddressWithMap(Map condMap);

	public void updateDeliveryAddress(DeliveryAddressVO targetDeliveryAddress);

	public void updateMemberAddressWithMap(Map condMap);

	public void deleteDeliveryAddressWithMap(Map condMap);

	public void insertPointHistory(Map payInfoMap);

	public void updateMemberPoint(Map payInfoMap);

	public OrderVO selectTempOrder(Map condMap);

	public void insertTossApi(Map payInfoMap);

	public String selectTossApiByOrderNo(int orderNo);

	public String isSNSMember(MemberVO memberInfo);

	public int selectTotalAvailableReviewsNum(int memberNo);

	public int selectTotalDoneReviewsNum(int memberNo);

	public List<OrderVO> selectDoneReviewListWithPagingMap(Map pagingMap);

	public List<OrderVO> selectAvailableReviewListWithPagingMap(Map pagingMap);

	public void updateMemberCouponUsed(Map payInfoMap);

	public Map selectCouponByCouponNoAndMemberNo(Map condMap);

	public int selectValidateTotalPrice(Map payInfoMap);
	
	public List<PointHistoryVO> memberPoint (MemberVO memberInfo);
	
}
