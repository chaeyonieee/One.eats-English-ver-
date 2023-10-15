package com.example.demo.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.admin.goods.dao.AdminGoodsDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;


@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;

	@Override
	public boolean addGoods(Map map) {
		boolean result1 = true;
		try {
			adminGoodsDAO.insertNewGoodsWithMap(map);

		} catch (Exception e) {
			e.printStackTrace();
			result1 = false;
		}
		return result1;
	}

	public boolean optionaddGoods(OptionVO optionVO) {
		boolean result = adminGoodsDAO.insertOptions(optionVO);
		return result;
	}

	@Override
	public int selectNewGoodsNo() {
		return adminGoodsDAO.selectNewGoodsNo();
	}

	@Override
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList) {
		// TODO Auto-generated method stub
		return false;
	}

	// Product 페이징 처리

	@Override
	public List<GoodsVO> selectNewGoodsList() {
		return adminGoodsDAO.selectNewGoodsList();
	}

	// Product List
	@Override
	public List<GoodsVO> selectGoodsList(Map pagingMap) {
		return adminGoodsDAO.selectGoodsList(pagingMap);
	}
	
	//Product Delete
		@Override
		public int deleteAdminGoods(int goodsNo) throws DataAccessException {
			return adminGoodsDAO.deleteAdminGoods(goodsNo);
		}

		
	//Product Modification
		@Override
		public List<Map> selectOptionsBygoodsNo(int goodsNo) {
			return adminGoodsDAO.selectOptionsBygoodsNo(goodsNo);
		}

		
		@Override
		public GoodsVO selectGoodsByGoodsNo(int goodsNo) {
			return adminGoodsDAO.selectGoodsByGoodsNo(goodsNo);
		}
		
		// Admin Product 페이징 처리

		@Override
		public List<GoodsVO> selectNewSellerGoodsList() {
			return adminGoodsDAO.selectNewSellerGoodsList();
		}

		// Admin Product List
		@Override
		public List<GoodsVO> selectSellerGoodsList(Map pagingMap){
			return adminGoodsDAO.selectSellerGoodsList(pagingMap);
		}
	

		//카테고리
			@Override
			public List<Map> countGoodsNums() {
				return adminGoodsDAO.countGoodsNums();
			};
			//카테고리
			@Override
			public List<Map> countSellerGoodsNums() {
				return adminGoodsDAO.countSellerGoodsNums();
			};
	
			@Override
			public void updateOption(List<OptionVO> selectOptions) {
				adminGoodsDAO.updateOption(selectOptions);
				
			}

			@Override
			public void updateAdminGoods(GoodsVO sellerGoods) {
				
				adminGoodsDAO.updateSellerGoods(sellerGoods);	
				
			}

			@Override
			public void deleteOption(int optionNo) {
				adminGoodsDAO.deleteOption(optionNo);
				
			}

			@Override
			public void insertOptionsForMod(List<OptionVO> selectOptions) {
				adminGoodsDAO.insertOptionsForMod(selectOptions);
			
			}

			@Override

			public void insertOptionForMod(OptionVO optionVO) {
				adminGoodsDAO.insertOptionForMod(optionVO);
				
			}

			
			
			@Override
			public int selectTotalGoodsNum() {
				return adminGoodsDAO.selectTotalGoodsNum();
			}

		

			@Override
			public int[] selectOptionNoByGoodsNo(int goodsNo) {
				return adminGoodsDAO.selectOptionNoByGoodsNo(goodsNo);
			}

			@Override
			public List<OptionVO> selectOptionByGoodsNo(int goodsNo) {
				return adminGoodsDAO.selectOptionByGoodsNo(goodsNo);
			}
}
