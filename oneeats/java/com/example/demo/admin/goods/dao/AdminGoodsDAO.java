package com.example.demo.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;

@Mapper
@Repository("adminGoodsDAO")
public interface AdminGoodsDAO {

	public void insertNewGoods(GoodsVO goodsVO);

	public int selectNewGoodsNo();

	public boolean insertOptions(OptionVO optionVO);

	public void insertNewGoodsWithMap(Map map);

	// Product List
	public List<GoodsVO> selectGoodsList(Map pagingMap) throws DataAccessException;
	public int selectTotalGoodsNum();

	// 페이징 처리
	public List<GoodsVO> selectNewGoodsList();

	// Product Delete
	public int deleteAdminGoods(int goodsNo) throws DataAccessException;

	// Modify
	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public List<Map> selectOptionsBygoodsNo(int goodsNo);

	// Admin Product List
	public List<GoodsVO> selectSellerGoodsList(Map pagingMap) throws DataAccessException;

	// Admin 페이징 처리
	public List<GoodsVO> selectNewSellerGoodsList();

	// 카테고리
	public List<Map> countGoodsNums();

	// 카테고리
	public List<Map> countSellerGoodsNums();
	
	
	//Modify

	public void updateOption(List<OptionVO> selectOptions);

	public void updateSellerGoods(GoodsVO sellerGoods);

	public void deleteOption(int optionNo);

	public void insertOptionsForMod(List<OptionVO> selectOptions);

	public void insertOptionForMod(OptionVO optionVO);
	
	public List<OptionVO> selectOptionByGoodsNo(int goodsNo);
	
	public int[] selectOptionNoByGoodsNo(int goodsNo);
	
	
}
