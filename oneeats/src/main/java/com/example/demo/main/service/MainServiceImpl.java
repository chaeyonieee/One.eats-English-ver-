package com.example.demo.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.main.dao.MainDAO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.RecipeVO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;

	@Override
	public Map<String, List<GoodsVO>> listGoods() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsVO> selectAllGoodsList() {
		return mainDAO.selectAllGoodsList();
	}

	@Override
	public List<GoodsVO> orderByNew() {
		return mainDAO.orderByNew();
	}

	@Override
	public List<RecipeVO> selectAllRecipesList() {
		return mainDAO.selectAllRecipesList();
	}

	@Override
	public CartVO selectOptionByNo(int optionNo) {
		return mainDAO.selectOptionByNo(optionNo);
	}

	@Override
	public List<CouponVO> selectCouponByMemberNo(int memberNo) {
		return mainDAO.selectCouponByMemberNo(memberNo);
	}

	@Override
	public OrderVO selectOptionsGoodsToOrderByOptionNo(int optionNo) {
		
		return mainDAO.selectOptionsGoodsToOrderByOptionNo(optionNo);
	}

	@Override
	public List<HotDealVO> selectNewHotDealList() {
		return mainDAO.selectNewHotDealList();
	}

	@Override
	public List<GoodsVO> selectNewGoodsList() {
		return mainDAO.selectNewGoodsList();
	}

	@Override
	public List<RecipeVO> selectNewRecipeList() {
		return mainDAO.selectNewRecipeList();
	}

	@Override
	public List<GoodsVO> selectBestGoodsList() {
		return mainDAO.selectBestGoodsList();
	}

	@Override
	public List<GoodsVO> selectTopReviewGoodsList() {
		return mainDAO.selectTopReviewGoodsList();
	}

	@Override
	public CartVO selectOneOptionByGoodsNo(int goodsNo) {
		
		return mainDAO.selectOneOptionByGoodsNo(goodsNo);
	}

	
}
