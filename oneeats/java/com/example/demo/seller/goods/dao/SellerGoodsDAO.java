package com.example.demo.seller.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;

import com.example.demo.vo.OptionVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("sellerGoodsDAO")
public interface SellerGoodsDAO {


	public void insertNewGoods(GoodsVO goodsVO);

	public int selectNewGoodsNo();

	public boolean insertOptions(OptionVO optionVO);

	public boolean updateOptions(OptionVO optionVO);

	public void insertNewGoodsWithMap(Map map);

	public GoodsVO selectGoodsVO(int goodsNo);

	public List<OptionVO> selectOptionVO(int goodsNo);

	public void updateNewGoodsWithMap(GoodsVO goodsvo);

	// Order List
	public List<GoodsVO> selectGoodsList(Map pagingMap);

	
	//카테고리
	public List<Map> countGoodsNums(); 
	
	
	// 페이징 처리
	public List<GoodsVO> selectNewGoodsList();

	// Order Delete
	public int deleteSellerGoods(int goodsNo) throws DataAccessException;

	

	public GoodsVO goodsItem(int goodsNo);

	public void DeleteGoods(GoodsVO goodsvo);

	public int[] selectOptionNoByGoodsNo(int goodsNo);

	public void updateOption(int optionNo);

	public List<OptionVO> selectOptionByGoodsNo(int goodsNo);

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public void updateOption(List<OptionVO> selectOptions);

	public void updateSellerGoods(GoodsVO sellerGoods);

	public void deleteOption(int optionNo);

	public void insertOptionsForMod(List<OptionVO> selectOptions);

	public void insertOptionForMod(OptionVO optionVO);

	public int selectTotalGoodsNum();

	
	
	//북샵따라하기
	//public void updateGoodsInfo(Map goodsMap) throws DataAccessException;
}
