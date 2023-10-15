package com.example.demo.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.goods.dao.GoodsDAO;
import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.ReviewVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public List<GoodsVO> selectAllGoodsList() {
		return goodsDAO.selectAllGoodsList();

	}

	@Override
	public GoodsVO selectNumGoodsList() {
		return goodsDAO.selectNumGoodsList();
	}

	@Override
	public List<GoodsVO> goodsDetail(int goodsNo) {
		return goodsDAO.goodsDetail(goodsNo);
	}

	@Override
	public GoodsVO selectGoodsByGoodsNo(int goodsNo) {
		return goodsDAO.selectGoodsByGoodsNo(goodsNo);
	}

	@Override
	public int selectTotalReviewsNum(int goodsNo) {

		return goodsDAO.selectTotalReviewsNum(goodsNo);
	}

	@Override
	public float selectReviewAverage(int goodsNo) {
		return goodsDAO.selectReviewAverage(goodsNo);
	}

	@Override
	public List<CartVO> selectOptionsByGoodsNo(int goodsNo) {
		return goodsDAO.selectOptionsByGoodsNo(goodsNo);
	}

	@Override
	public List<HotDealVO> selectNewHotDealList() {
		return goodsDAO.selectNewHotDealList();
	}

	@Override
	public int selectTotalGoodsNumForAll() {
		return goodsDAO.selectTotalGoodsNumForAll();
	}

	@Override
	public void insertNewBookmark(BookmarkVO bookmarkVO) {

		goodsDAO.insertNewBookmark(bookmarkVO);
	}

	@Override
	public boolean isExistBookmark(BookmarkVO bookmarkVO) {
		int bookmarkNum = goodsDAO.isExistBookmark(bookmarkVO);
		if (bookmarkNum > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GoodsVO> selectGoodsListWithSearchFilter(Map searchMap) {
		return goodsDAO.selectGoodsListWithSearchFilter(searchMap);
	}
	
	@Override
	public List<HotDealVO> selectHotDealListWithSearchFilter(Map searchMap) {
		return goodsDAO.selectHotDealListWithSearchFilter(searchMap);
	}

	@Override
	public int selectGoodsTotalNumWithSearchFilter(Map searchMap) {
		return goodsDAO.selectGoodsTotalNumWithSearchFilter(searchMap);
	}

	@Override
	public List<GoodsVO> selectGoodsListWithPagingMap(Map pagingMap) {
		return goodsDAO.selectGoodsListWithPagingMap(pagingMap);
	}

	
	@Override
	public List<HotDealVO> selectHotDealListWithPagingMap(Map pagingMap) {
		return goodsDAO.selectHotDealListWithPagingMap(pagingMap);
	}

	

	@Override
	public int selectGoodsTotalNumWithPagingMap(Map pagingMap) {
		return goodsDAO.selectGoodsTotalNumWithPagingMap(pagingMap);
	}
	
	@Override
	public int selectHotDealTotalNumWithPagingMap(Map pagingMap) {
		return goodsDAO.selectHotDealTotalNumWithPagingMap(pagingMap);
	}

	@Override
	public List<ReviewVO> selectNewReviewsByGoodsNo(int goodsNo) {
		return goodsDAO.selectNewReviewsByGoodsNo(goodsNo);
	}

	@Override
	public List<ReviewVO> selectReviewsWithPagingMap(Map pagingMap) {
		
		return goodsDAO.selectReviewsWithPagingMap(pagingMap);
	}

	@Override
	public int selectMaxPrice(Map pagingMap) {
		return goodsDAO.selectMaxPrice(pagingMap);
	}

	@Override public int selectMaxPriceWithSearchFilter(Map searchMap) {
	 return goodsDAO.selectMaxPriceWithSearchFilter(searchMap); };

	
}