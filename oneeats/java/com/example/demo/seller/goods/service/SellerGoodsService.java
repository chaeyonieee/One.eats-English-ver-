package com.example.demo.seller.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;


public interface SellerGoodsService {

//Product 추가	
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList);

	public int selectNewGoodsNo();
	
	public GoodsVO selectGoodsVO(int goodsNo);
	
	public List<OptionVO> selectOptionVO(int goodsNo);

	public boolean optionaddGoods(OptionVO optionVO);

	public boolean optionModGoods(OptionVO optionVO);
	
	public boolean addGoods(Map map);

//Product 리스트	
	public List<GoodsVO> selectGoodsList(Map pagingMap);
	public int selectTotalGoodsNum();

	
//카테고리 
	public List<Map> countGoodsNums();
	
	
	
	

//Product List 페이징	
	public List<GoodsVO> selectNewGoodsList();
	
// Product Delete
	public int deleteSellerGoods(int goodsNo) throws DataAccessException;

//Product Modification
	public void ModGoods(GoodsVO goodsvo) throws DataAccessException;

	public void DeleteGoods(GoodsVO goodsvo);

	public GoodsVO goodsItem(int goodsvo);

	public int[] selectOptionNoByGoodsNo(int goodsNo);

	public void updateOption(int optionNo);

	public List<OptionVO> selectOptionByGoodsNo(int goodsNo);

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public void updateOption(List<OptionVO> selectOptions);

	public void updateSellerGoods(GoodsVO sellerGoods);

	public void deleteOption(int optionNo);

	public void insertOptionsForMod(List<OptionVO> selectOptions);

	public void insertOptionForMod(OptionVO optionVO);



	
}
