package com.example.demo.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;

public interface AdminGoodsService {
	// Product 추가
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList);

	public int selectNewGoodsNo();

	public boolean addGoods(Map map);

	public boolean optionaddGoods(OptionVO optionVO);

	// Product 리스트
	public List<GoodsVO> selectGoodsList(Map pagingMap);

	// Product List 페이징
	public List<GoodsVO> selectNewGoodsList();

	// Product Delete
	public int deleteAdminGoods(int goodsNo) throws DataAccessException;

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public List<Map> selectOptionsBygoodsNo(int goodsNo);

	// Admin Product 리스트
	public List<GoodsVO> selectSellerGoodsList(Map pagingMap);

	// Admin Product List 페이징
	public List<GoodsVO> selectNewSellerGoodsList();

	// 카테고리
	public List<Map> countGoodsNums();

	// 카테고리
	public List<Map> countSellerGoodsNums();
	
	//Modify
	
	public List<OptionVO> selectOptionByGoodsNo(int goodsNo);
	public int[] selectOptionNoByGoodsNo(int goodsNo);
	public void deleteOption(int optionNo);
	public void updateAdminGoods(GoodsVO sellerGoods);
	public void insertOptionsForMod(List<OptionVO> selectOptions);
	public void updateOption(List<OptionVO> selectOptions);
	void insertOptionForMod(OptionVO optionVO);

	public int selectTotalGoodsNum();
}
