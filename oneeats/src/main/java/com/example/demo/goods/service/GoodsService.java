package com.example.demo.goods.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.OptionVO;
import com.example.demo.vo.ReviewVO;

public interface GoodsService {

	public List<GoodsVO> selectAllGoodsList();

	public GoodsVO selectNumGoodsList();

	public List<GoodsVO> goodsDetail(int goodsNo);

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public int selectTotalReviewsNum(int goodsNo);

	public float selectReviewAverage(int goodsNo);

	public List<CartVO> selectOptionsByGoodsNo(int goodsNo);

	public List<HotDealVO> selectNewHotDealList();

	public int selectTotalGoodsNumForAll();

	public void insertNewBookmark(BookmarkVO bookmarkVO);

	public boolean isExistBookmark(BookmarkVO bookmarkVO);

	public List<GoodsVO> selectGoodsListWithSearchFilter(Map searchMap);
	public List<HotDealVO> selectHotDealListWithSearchFilter(Map searchMap);

	public int selectGoodsTotalNumWithSearchFilter(Map searchMap);

	public List<GoodsVO> selectGoodsListWithPagingMap(Map pagingMap);

	public int selectGoodsTotalNumWithPagingMap(Map pagingMap);

	public List<ReviewVO> selectNewReviewsByGoodsNo(int goodsNo);

	public List<ReviewVO> selectReviewsWithPagingMap(Map pagingMap);

	public int selectMaxPrice(Map pagingMap);

	//public int selectMaxPriceWithSearchFilter(Map searchMap);

	public List<HotDealVO> selectHotDealListWithPagingMap(Map pagingMap);

	public int selectHotDealTotalNumWithPagingMap(Map pagingMap);

	public int selectMaxPriceWithSearchFilter(Map searchMap);
	

}
