package com.example.demo.admin.hotdeal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

@Mapper
@Repository("adminHotDealDAO")
public interface AdminHotDealDAO {
	public GoodsVO selectGoodsVO(int goodsNo);

	public int selectNewHotDealNo();

	public void insertHotDeal(HotDealVO hotDealVO) throws DataAccessException;

	public HotDealVO selectHotDealByHotDealNo(int hotdealNo);

	public List<GoodsVO> selectGoodsList(Map map) throws DataAccessException;;

	public GoodsVO SearchGoods(int goodsNo);

	// 카테고리
	public List<Map> countHotDealNums();

	// 페이징 처리
	public List<HotDealVO> selectNewHotDealList();

	// Hot Deal List
	public List<HotDealVO> selectHotDealListForList(Map pagingMap) throws DataAccessException;
	
	//Hot Deal Delete
	public int deleteHotdealGoods(int hotdealNo) throws DataAccessException;

	//Modify
	public GoodsVO selectGoodsByGoodsNo(int goodsNo);
	public HotDealVO selectHotDealByGoodsNo(int hotdealNo);

	public void updateAdminHotDeal(HotDealVO sellerHotDeal);
	
	public int selectTotalHotDealNum();
}
