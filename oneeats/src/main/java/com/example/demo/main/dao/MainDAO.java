package com.example.demo.main.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.CartVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("mainDAO")
public interface MainDAO {
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;

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
