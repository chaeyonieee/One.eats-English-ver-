package com.example.demo.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.member.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	// 민아 Login
	@Override
	public MemberVO login(Map loginMap) throws Exception {
		return memberDAO.login(loginMap);
	}

	// 민아 Member Registration
	@Override
	public void registerInfo(MemberVO memberVO) throws Exception {
		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public int registerInfoNo() throws Exception {
		int MemberNo = memberDAO.insertMemberNo();
		return MemberNo;
	}

	@Override
	public String idSearch(MemberVO memberVO) throws DataAccessException {
		return memberDAO.idSearch(memberVO);
	}

	@Override
	public void sellerRegisterInfo(MemberVO memberVO) throws Exception {
		memberDAO.insertSellerNewMember(memberVO);
	}

	@Override
	public MemberVO pwSearch(MemberVO memberVO) throws DataAccessException {
		return memberDAO.pwSearch(memberVO);
	}

	@Override
	public int updatePw(MemberVO member) throws DataAccessException {
		return memberDAO.updatePw(member);
	}

	@Override
	@Transactional
	public void insertMemberWithMap(Map memberMap) throws Exception{
		String inzung_id = memberMap.get("inzung_id").toString();
		memberDAO.updateVerificationNumberVerificated(inzung_id);
		memberDAO.insertMemberWithMap(memberMap);
	}

	@Override
	public MemberVO selectMemberByEmail(String email) {

		return memberDAO.selectMemberByEmail(email);
	}

	@Override
	public MemberVO selectMemberById(String id) {
		return memberDAO.selectMemberById(id);
	}

	@Override
	@Transactional
	public void insertSellerMemberWithMap(Map memberMap) {
		String inzung_id = memberMap.get("inzung_id").toString();
		memberDAO.updateVerificationNumberVerificated(inzung_id);
		memberDAO.insertSellerMemberWithMap(memberMap);

	}

	@Override
	public List<String> selectIdList(MemberVO memberVO) {
		return memberDAO.selectIdList(memberVO);
	}

	@Override
	public void saveRandomSMSInzungBunho(String randomNumber) {
		memberDAO.insertRandomBunho(randomNumber);
		
	}

	@Override
	public String loadRandomSMSInzungBunho(String inputNumber) {
		return memberDAO.selectVerificationNumber(inputNumber);
	}
	

	@Override
	public int loadVerificationNoByNumber(String number) {
		return memberDAO.selectVerificationNoByNumber(number);
	}

	@Override
	public String selectMemberFromSNSId(Map infoMap) {
		
		return memberDAO.selectMemberFromSNSId(infoMap);
	}

	@Override
	@Transactional
	public void insertMemberWithSNSMap(Map memberMap) {
		int memberNo = memberDAO.selectNewSNSMemberNo();
		String id = (String) memberMap.get("id");
		id += "_"+memberNo;
		memberMap.put("id", id);
		memberDAO.insertMemberWithMap(memberMap);
		memberDAO.insertSNSIdWithMap(memberMap);
	}


	

}
