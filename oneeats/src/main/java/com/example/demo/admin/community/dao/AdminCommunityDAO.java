package com.example.demo.admin.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
import com.example.demo.vo.RecipeVO;
import com.example.demo.vo.ReviewVO;

@Mapper
@Repository("adminCommunityDAO")
public interface AdminCommunityDAO {
	public List<RecipeVO> sellectAllRecipe();
	
	public List<NoticeVO> adminNoticeList();
	
	public NoticeVO adminNoticeDetail(int noticeNo);
	
	public void adminNotideDetailupdate(NoticeVO noticeVO);
	
	 public void deleteNotice(int noticeNo);
	 
	 public int newNum();
	 
	 public void addNotice(NoticeVO noticeVO);

	public int selectMostQnAListTotalNumWithCategory(String category);

	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap);

	public void insertNewMostQnAWithMap(Map condMap);

	public MostQnAVO selectMostQnAByNo(String qnaNo);

	public void updateMostQnAWithMap(Map condMap);

	public void deleteMostQnA(int qnaNo);
	
	public List<OneQnAVO> oneQnAList();
	
	public List<NoticeVO> selectNoticeListWithPagingMap(Map pagingMap);

	public List<OneQnAVO> selectOneQnAListWithPagingMap(Map pagingMap);

	public int selectNoticeListTotalNumWithCategory(Map pagingMap);

	public int selectOneQnAListTotalNumWithCategory();

	public List<RecipeVO> selectRecipeListWithPagingMap(Map pagingMap);

	public int selectTotalRecipeNum(Map pagingMap);

	public List<ReviewVO> selectReviewListWithPagingMap(Map pagingMap);

	public int selectTotalReviewNum(Map pagingMap);

	public void deleteReview(int reviewNo);
}
