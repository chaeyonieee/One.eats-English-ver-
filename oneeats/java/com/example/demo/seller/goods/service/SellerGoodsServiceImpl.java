package com.example.demo.seller.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.seller.goods.dao.SellerGoodsDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;

@Service("sellerGoodsService")
public class SellerGoodsServiceImpl implements SellerGoodsService {
	@Autowired
	private SellerGoodsDAO sellerGoodsDAO;

//	@Override
//	public int addGoods(Map map) throws DataAccessException {
//		return sellerGoodsDAO.insertGoods(map);
//	}
//
//	@Override
//	public int addOption(Map map) throws DataAccessException {
//		return sellerGoodsDAO.insertOption(map);
	// }

	/*
	 * @Override public boolean addGoods(GoodsVO goodsVO, List<OptionVO> optionList)
	 * { boolean result = true; try { sellerGoodsDAO.insertNewGoods(goodsVO);
	 * sellerGoodsDAO.insertOptions(optionList); } catch (Exception e) { result =
	 * false; } return result; }
	 */

	@Override
	public boolean addGoods(Map map) {
		boolean result1 = true;
		try {
			sellerGoodsDAO.insertNewGoodsWithMap(map);

		} catch (Exception e) {
			e.printStackTrace();
			result1 = false;
		}
		return result1;
	}

	public boolean optionaddGoods(OptionVO optionVO) {
		boolean result = sellerGoodsDAO.insertOptions(optionVO);
		return result;
	}

	public boolean optionModGoods(OptionVO optionVO) {
		boolean result = sellerGoodsDAO.updateOptions(optionVO);
		return result;
	}

	@Override
	public GoodsVO selectGoodsVO(int goodsNo) {
		GoodsVO goodsVO = sellerGoodsDAO.selectGoodsVO(goodsNo);
		return goodsVO;
	}

	@Override
	public List<OptionVO> selectOptionVO(int goodsNo) {
		List<OptionVO> optionVO = sellerGoodsDAO.selectOptionVO(goodsNo);
		return optionVO;
	}

	@Override
	public int selectNewGoodsNo() {
		return sellerGoodsDAO.selectNewGoodsNo();
	}

	@Override
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList) {
		// TODO Auto-generated method stub
		return false;
	}

	// Product 페이징 처리

	@Override
	public List<GoodsVO> selectGoodsList(Map pagingMap) {
		return sellerGoodsDAO.selectGoodsList(pagingMap);
	}

//Product List
	@Override
	public List<GoodsVO> selectNewGoodsList() {
		return sellerGoodsDAO.selectNewGoodsList();
	}

//카테고리
	@Override
	public List<Map> countGoodsNums() {
		return sellerGoodsDAO.countGoodsNums();
	};

//Product Delete
	@Override
	public int deleteSellerGoods(int goodsNo) throws DataAccessException {
		return sellerGoodsDAO.deleteSellerGoods(goodsNo);
	}

	@Override
	public void DeleteGoods(GoodsVO goodsvo) {
		sellerGoodsDAO.DeleteGoods(goodsvo);

	}

	@Override
	public GoodsVO goodsItem(int goodsNo) {
		GoodsVO goodsItem = sellerGoodsDAO.goodsItem(goodsNo);
		return goodsItem;
	}

	@Override
	public void ModGoods(GoodsVO goodsvo) {
		sellerGoodsDAO.updateNewGoodsWithMap(goodsvo);

	}


	@Override
	public GoodsVO selectGoodsByGoodsNo(int goodsNo) {
		return sellerGoodsDAO.selectGoodsByGoodsNo(goodsNo);
	}

	@Override
	public int[] selectOptionNoByGoodsNo(int goodsNo) {
		return sellerGoodsDAO.selectOptionNoByGoodsNo(goodsNo);
	}

	@Override
	public void updateOption(int optionNo) {
		sellerGoodsDAO.updateOption(optionNo);
		
	}

	@Override
	public List<OptionVO> selectOptionByGoodsNo(int goodsNo) {
		return sellerGoodsDAO.selectOptionByGoodsNo(goodsNo);
	}

	@Override
	public void updateOption(List<OptionVO> selectOptions) {
		sellerGoodsDAO.updateOption(selectOptions);
		
	}

	@Override
	public void updateSellerGoods(GoodsVO sellerGoods) {
		
		sellerGoodsDAO.updateSellerGoods(sellerGoods);	
		
	}

	@Override
	public void deleteOption(int optionNo) {
		sellerGoodsDAO.deleteOption(optionNo);
		
	}

	@Override
	public void insertOptionsForMod(List<OptionVO> selectOptions) {
		sellerGoodsDAO.insertOptionsForMod(selectOptions);
	
	}

	@Override
	public void insertOptionForMod(OptionVO optionVO) {
		sellerGoodsDAO.insertOptionForMod(optionVO);
		
	}

	@Override
	public int selectTotalGoodsNum() {
		return sellerGoodsDAO.selectTotalGoodsNum();
	}


}
