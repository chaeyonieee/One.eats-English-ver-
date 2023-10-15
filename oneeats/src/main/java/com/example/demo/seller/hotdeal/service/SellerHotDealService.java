package com.example.demo.seller.hotdeal.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.MemberVO;

public interface SellerHotDealService {

	public GoodsVO selectGoodsVO(int goodsNo);

	public int selectNewHotDealNo();

	public void addHotDeal(HotDealVO hotDealVO);

	public HotDealVO selectHotDealByHotDealNo(int hotdealNo);

	public List<GoodsVO> selectGoodsList(Map map);

	public GoodsVO SearchGoods(int goodsNo);

	// List
	public List<HotDealVO> selectNewHotDealList();

	// 카테고리
	public List<Map> countHotDealNums();

	// Product 리스트
	public List<HotDealVO> selectHotDealListForList(Map pagingMap);

	//Product Delete
	public int deleteHotdealGoods(int hotdealNo) throws DataAccessException;

	//Modify폼
	public GoodsVO selectGoodsByGoodsNo(int hotdealNo);
	public HotDealVO selectHotDealByGoodsNo(int hotdealNo);
	
	//Modify
	public void updateSellerHotDeal(HotDealVO sellerHotDeal);

	public List<HotDealVO> selectSellerHotDealList(Map pagingMap);

	public int selectTotalHotDealNum();


	
}
