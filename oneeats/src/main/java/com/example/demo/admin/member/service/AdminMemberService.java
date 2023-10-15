package com.example.demo.admin.member.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

public interface AdminMemberService {

	List<MemberVO> selectAdminMemberList(Map pagingMap);

	int selectTotalMemberNum();

	MemberVO selectMemberByMemberNo(int memberNo);
}
