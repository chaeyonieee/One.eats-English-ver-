package com.example.demo.admin.hotdeal.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

public interface AdminHotDealService {

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
	public void updateAdminHotDeal(HotDealVO sellerHotDeal);

	public int selectTotalHotDealNum();
	
	
	
}
