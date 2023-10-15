package com.example.demo.admin.hotdeal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.admin.hotdeal.dao.AdminHotDealDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

@Service("adminHotDealService")
public class AdminHotDealServiceImpl implements AdminHotDealService {
	@Autowired
	private AdminHotDealDAO adminHotDealDAO;

	@Override
	public GoodsVO selectGoodsVO(int goodsNo) {
		GoodsVO goodsVO = adminHotDealDAO.selectGoodsVO(goodsNo);
		return goodsVO;
	}
	
	
	@Override
	public int selectNewHotDealNo() {
		return adminHotDealDAO.selectNewHotDealNo();
	}


	@Override
	public void addHotDeal(HotDealVO hotDealVO) {
		
		adminHotDealDAO.insertHotDeal(hotDealVO);
	}


	@Override
	public HotDealVO selectHotDealByHotDealNo(int hotdealNo) {
		return adminHotDealDAO.selectHotDealByHotDealNo(hotdealNo);
	}


	@Override
	public List<GoodsVO> selectGoodsList(Map map) {
		return adminHotDealDAO.selectGoodsList(map);
	}

	@Override
	public GoodsVO SearchGoods(int goodsNo) {
		GoodsVO goodsVO = adminHotDealDAO.SearchGoods(goodsNo);
		return goodsVO;
	}

	//Product List
		@Override
		public List<HotDealVO> selectNewHotDealList() {
			return adminHotDealDAO.selectNewHotDealList();
		}
		//카테고리
		@Override
		public List<Map> countHotDealNums() {
			return adminHotDealDAO.countHotDealNums();
		};
	
		@Override
		public List<HotDealVO> selectHotDealListForList(Map pagingMap) {
			return adminHotDealDAO.selectHotDealListForList(pagingMap);
		}
		
		
		@Override
		public int deleteHotdealGoods(int goodsNo) throws DataAccessException {
			return adminHotDealDAO.deleteHotdealGoods(goodsNo);
		}
		
		@Override
		public GoodsVO selectGoodsByGoodsNo(int hotdealNo) {
			return adminHotDealDAO.selectGoodsByGoodsNo(hotdealNo);
		}
		
		
		@Override
		public HotDealVO selectHotDealByGoodsNo(int hotdealNo) {
			return adminHotDealDAO.selectHotDealByGoodsNo(hotdealNo);
		}
		
		
		@Override
		public void updateAdminHotDeal(HotDealVO sellerHotDeal) {
			
			adminHotDealDAO.updateAdminHotDeal(sellerHotDeal);	
			
		}
		@Override
		public int selectTotalHotDealNum() {
			return adminHotDealDAO.selectTotalHotDealNum();
		}
		
}
	