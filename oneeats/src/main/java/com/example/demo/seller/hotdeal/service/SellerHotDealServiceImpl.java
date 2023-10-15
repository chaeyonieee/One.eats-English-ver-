package com.example.demo.seller.hotdeal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.seller.hotdeal.dao.SellerHotDealDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OptionVO;

@Service("sellerHotDealService")
public class SellerHotDealServiceImpl implements SellerHotDealService{
	@Autowired
	private SellerHotDealDAO sellerHotDealDAO;

	
	@Override
	public GoodsVO selectGoodsVO(int goodsNo) {
		GoodsVO goodsVO = sellerHotDealDAO.selectGoodsVO(goodsNo);
		return goodsVO;
	}
	
	
	@Override
	public int selectNewHotDealNo() {
		return sellerHotDealDAO.selectNewHotDealNo();
	}


	@Override
	public void addHotDeal(HotDealVO hotDealVO) {
		
		sellerHotDealDAO.insertHotDeal(hotDealVO);
	}


	@Override
	public HotDealVO selectHotDealByHotDealNo(int hotdealNo) {
		return sellerHotDealDAO.selectHotDealByHotDealNo(hotdealNo);
	}


	@Override
	public List<GoodsVO> selectGoodsList(Map map) {
		return sellerHotDealDAO.selectGoodsList(map);
	}

	@Override
	public GoodsVO SearchGoods(int goodsNo) {
		GoodsVO goodsVO = sellerHotDealDAO.SearchGoods(goodsNo);
		return goodsVO;
	}

	//Product List
		@Override
		public List<HotDealVO> selectNewHotDealList() {
			return sellerHotDealDAO.selectNewHotDealList();
		}
		//카테고리
		@Override
		public List<Map> countHotDealNums() {
			return sellerHotDealDAO.countHotDealNums();
		};
	
		@Override
		public List<HotDealVO> selectHotDealListForList(Map pagingMap) {
			return sellerHotDealDAO.selectHotDealListForList(pagingMap);
		}
		
		
		@Override
		public int deleteHotdealGoods(int goodsNo) throws DataAccessException {
			return sellerHotDealDAO.deleteHotdealGoods(goodsNo);
		}
		
		@Override
		public GoodsVO selectGoodsByGoodsNo(int hotdealNo) {
			return sellerHotDealDAO.selectGoodsByGoodsNo(hotdealNo);
		}
		
		
		@Override
		public HotDealVO selectHotDealByGoodsNo(int hotdealNo) {
			return sellerHotDealDAO.selectHotDealByGoodsNo(hotdealNo);
		}
		
		
		@Override
		public void updateSellerHotDeal(HotDealVO sellerHotDeal) {
			
			sellerHotDealDAO.updateSellerHotDeal(sellerHotDeal);	
			
		}

		@Override
		public List<HotDealVO> selectSellerHotDealList(Map pagingMap) {
			return sellerHotDealDAO.selectSellerHotDealList(pagingMap);
		}
		
	
		
		@Override
		public int selectTotalHotDealNum() {
			return sellerHotDealDAO.selectTotalHotDealNum();
		}
		
}
	


	
	
	
	
	
	
	

