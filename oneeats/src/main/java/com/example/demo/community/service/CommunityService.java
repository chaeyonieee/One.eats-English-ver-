package com.example.demo.community.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
import com.example.demo.vo.RecipeVO;

public interface CommunityService {
	
	public MemberVO selectMemberByMemberNo(int memberNo);

	public List<RecipeVO> selectRecipeList(Map pagingMap);

	public List<RecipeVO> selectNewRecipeList();

	public RecipeVO selectRecipeByRecipeNo(int recipeNo);

	public List<Map> selectingredientByRecipeNo(int recipeNo);

	public boolean addRecipe(RecipeVO recipeVO, List<IngredientVO> ingredientList);

	public int selectNewRecipeNo();

	public boolean addRecipe(Map map, List<IngredientVO> ingredientList);

	public boolean modRecipe(Map map, List<IngredientVO> ingredientList, String recipeNo);

	public void deleteRecipe(int recipeNo);

	public List<RecipeVO> selectNewRecipeList(int recipeNo);
	
	public List<NoticeVO> noticeList();
	
	public NoticeVO noticeDetail(int noticeNo);

	public List<Map> countRecipeNums();

	public List<OneQnAVO> oneQnAList();
	
	public OneQnAVO oneQnADetail(int qnaNo);
	
	public void replyInsert(OneQnAVO oneQnAVO);
	
	public int newQnANo();
	
	public List<OneQnAVO> replyList(int qnaNo);
	
	public void oneQnAFormInsert(OneQnAVO oneQnAVO);

	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap);
	
	public List<NoticeVO> selectNoticeListWithPagingMap(Map pagingMap);
	
	public List<OneQnAVO> selectOneQnAListWithPagingMap(Map pagingMap);

	public int selectMostQnAListTotalNumWithCategory(String category);
	
	public int selectNoticeListTotalNumWithCategory(Map pagingMap);

	public int selectOneQnAListTotalNumWithPagingMap(Map pagingMap);
	
	public int selectOneQnAListTotalNumWithCategory();
}
