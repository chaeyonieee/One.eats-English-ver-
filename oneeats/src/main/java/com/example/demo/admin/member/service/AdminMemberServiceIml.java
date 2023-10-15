package com.example.demo.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.member.dao.AdminMemberDAO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Service("adminMemberService")
public class AdminMemberServiceIml implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	@Override
	public List<MemberVO> selectAdminMemberList(Map pagingMap) {
		return adminMemberDAO.selectAdminMemberList(pagingMap);
	}

	@Override
	public int selectTotalMemberNum() {
		return adminMemberDAO.selectTotalMemberNum();
	}

	@Override
	public MemberVO selectMemberByMemberNo(int memberNo) {
		return adminMemberDAO.selectMemberByMemberNo(memberNo);
	}
	
}
