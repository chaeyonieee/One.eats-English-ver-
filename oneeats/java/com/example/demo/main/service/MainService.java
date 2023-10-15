package com.example.demo.main.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.CartVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.RecipeVO;

public interface MainService {
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception;

	public List<GoodsVO> selectAllGoodsList();

	public List<GoodsVO> orderByNew();

	public List<RecipeVO> selectAllRecipesList();

	public CartVO selectOptionByNo(int optionNo);

	public List<CouponVO> selectCouponByMemberNo(int memberNo);

	public OrderVO selectOptionsGoodsToOrderByOptionNo(int optionNo);

	public List<HotDealVO> selectNewHotDealList();

	public List<GoodsVO> selectNewGoodsList();

	public List<RecipeVO> selectNewRecipeList();

	public List<GoodsVO> selectBestGoodsList();

	public List<GoodsVO> selectTopReviewGoodsList();

	public CartVO selectOneOptionByGoodsNo(int goodsNo);
}
