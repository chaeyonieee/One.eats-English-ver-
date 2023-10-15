package com.example.demo.admin.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.community.dao.AdminCommunityDAO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
import com.example.demo.vo.RecipeVO;
import com.example.demo.vo.ReviewVO;

@Service("adminCommunityService")
public class AdminCommunityServiceImpl implements AdminCommunityService {

	@Autowired
	private AdminCommunityDAO adminCommunityDAO;

	@Override
	public List<NoticeVO> adminNoticeList() {
		List<NoticeVO> noticeList = adminCommunityDAO.adminNoticeList();
		return noticeList;
	}

	@Override
	public NoticeVO adminNoticeDetail(int noticeNo) {
		NoticeVO noticeVO = adminCommunityDAO.adminNoticeDetail(noticeNo);
		return noticeVO;
	}

	@Override
	public void adminNotideDetailupdate(NoticeVO noticeVO) {
		adminCommunityDAO.adminNotideDetailupdate(noticeVO);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		adminCommunityDAO.deleteNotice(noticeNo);
	}

	@Override
	public int newNum() {
		int noticeNo = adminCommunityDAO.newNum();
		return noticeNo;
	}

	@Override
	public void addNotice(NoticeVO noticeVO) {
		adminCommunityDAO.addNotice(noticeVO);
	}

	@Override
	public List<NoticeVO> selectNoticeListWithPagingMap(Map pagingMap){
		return adminCommunityDAO.selectNoticeListWithPagingMap(pagingMap);
	}
	@Override
	public List<OneQnAVO> selectOneQnAListWithPagingMap(Map pagingMap){
		return adminCommunityDAO.selectOneQnAListWithPagingMap(pagingMap);
	}
	@Override
	public int selectNoticeListTotalNumWithCategory(Map pagingMap) {
		return adminCommunityDAO.selectNoticeListTotalNumWithCategory(pagingMap);
	}
	@Override
	public int selectOneQnAListTotalNumWithCategory() {
		int num = adminCommunityDAO.selectOneQnAListTotalNumWithCategory();	
		return num;
	}
	
	@Override
	public int selectMostQnAListTotalNumWithCategory(String category) {

		return adminCommunityDAO.selectMostQnAListTotalNumWithCategory(category);
	}

	@Override
	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap) {
		return adminCommunityDAO.selectMostQnAListWithPagingMap(pagingMap);
	}

	@Override
	public void insertNewMostQnAWithMap(Map condMap) {
		adminCommunityDAO.insertNewMostQnAWithMap(condMap);
	}

	@Override
	public MostQnAVO selectMostQnAByNo(String qnaNo) {
		return adminCommunityDAO.selectMostQnAByNo(qnaNo);
	}

	@Override
	public void updateMostQnAWithMap(Map condMap) {
		adminCommunityDAO.updateMostQnAWithMap(condMap);
	}

	@Override
	public void deleteMostQnA(int qnaNo) {
		adminCommunityDAO.deleteMostQnA(qnaNo);
	}

	@Override
	public List<RecipeVO> selectRecipeListWithPagingMap(Map pagingMap) {
		return adminCommunityDAO.selectRecipeListWithPagingMap(pagingMap);
	}

	@Override
	public int selectTotalRecipeNum(Map pagingMap) {
		
		return adminCommunityDAO.selectTotalRecipeNum(pagingMap);
	}
	
	@Override
	public List<OneQnAVO> oneQnAList(){
		List<OneQnAVO> oneQnAList = adminCommunityDAO.oneQnAList();
		return oneQnAList;
	}

	@Override
	public List<ReviewVO> selectReviewListWithPagingMap(Map pagingMap) {
		return adminCommunityDAO.selectReviewListWithPagingMap(pagingMap);
	}

	@Override
	public int selectTotalReviewNum(Map pagingMap) {
		return adminCommunityDAO.selectTotalReviewNum(pagingMap);
	}

	@Override
	public void deleteReview(int reviewNo) {
		adminCommunityDAO.deleteReview(reviewNo);
		
	}
	
	

}
