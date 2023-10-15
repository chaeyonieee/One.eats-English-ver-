package com.example.demo.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.MemberVO;

public interface MemberService {
	
	public MemberVO login(Map loginMap) throws Exception;
	public void registerInfo(MemberVO memberVO) throws Exception;
	public int registerInfoNo() throws Exception;
	public String idSearch(MemberVO memberVO) throws Exception;
	
	public void sellerRegisterInfo(MemberVO memberVO) throws Exception;
	
	public MemberVO pwSearch(MemberVO memberVO) throws DataAccessException;
	
	public int updatePw(MemberVO memberVO) throws Exception;
	public void insertMemberWithMap(Map memberMap) throws Exception;
	public MemberVO selectMemberByEmail(String email);
	public MemberVO selectMemberById(String string);
	public void insertSellerMemberWithMap(Map memberMap);
	public List<String> selectIdList(MemberVO memberVO);
	public void saveRandomSMSInzungBunho(String randomNumber);
	public String loadRandomSMSInzungBunho(String bunho);
	
	public int loadVerificationNoByNumber(String number);
	public String selectMemberFromSNSId(Map infoMap);
	public void insertMemberWithSNSMap(Map memberMap);

}
