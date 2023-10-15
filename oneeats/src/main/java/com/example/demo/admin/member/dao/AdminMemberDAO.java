package com.example.demo.admin.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Mapper
@Repository("adminMemberDAO")
public interface AdminMemberDAO {
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	
	public int insertMemberNo() throws DataAccessException;

	public List<MemberVO> selectAdminMemberList(Map pagingMap);

	public int selectTotalMemberNum();

	public MemberVO selectMemberByMemberNo(int memberNo);

}
