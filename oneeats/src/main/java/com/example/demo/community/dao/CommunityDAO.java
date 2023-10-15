package com.example.demo.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("communityDAO")
public interface CommunityDAO {
	
	public MemberVO selectMemberByMemberNo(int memberNo);

	public List<RecipeVO> selectRecipeList(Map pagingMap);
	
	public List<RecipeVO> selectNewRecipeList();
	
	public RecipeVO selectRecipeByRecipeNo(int recipeNo);

	public List<Map> selectIngredientByRecipeNo(int recipeNo);

	public int selectNewRecipeNo();

	public void insertNewRecipe(RecipeVO recipeVO);

	public void insertIngredients(List<IngredientVO> ingredientList);

	public void insertNewRecipeWithMap(Map map);

	public void insertIngredientsWithMap(Map condMap);

	public void updateRecipe(Map map);

	public void deleteIngredientsByRecipeNo(int recipeNo);

	public void deleteRecipe(int recipeNo);

	public List<RecipeVO> selectNewRecipeListExceptCurrentRecipe(int recipeNo);

	public List<Map> countRecipeNums(); 
	
	public List<NoticeVO> noticeList();
	
	public NoticeVO noticeDetail(int noticeNo);
	
	public List<OneQnAVO> oneQnAList();
	
	public OneQnAVO oneQnADetail(int qnaNo);
	
	public void oneQnAFormInsert(OneQnAVO oneQnAVO);

	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap);
	
	public List<NoticeVO> selectNoticeListWithPagingMap(Map pagingMap);
	
	public List<OneQnAVO> selectOneQnAListWithPagingMap(Map pagingMap);

	public int selectMostQnAListTotalNumWithCategory(String category);
	
	public int selectNoticeListTotalNumWithCategory(Map pagingMap);
	
	public int selectOneQnAListTotalNumWithCategory();
	
	public void replyInsert(OneQnAVO oneQnAVO);
	
	public int newQnANo();
	
	public List<OneQnAVO> replyList(int qnaNo);

	public int selectOneQnAListTotalNumWithPagingMap(Map pagingMap);

	public void updateQnAStatusDone(int parentNo);
}
