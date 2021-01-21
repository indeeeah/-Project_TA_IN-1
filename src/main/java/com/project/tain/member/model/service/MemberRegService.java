package com.project.tain.member.model.service;

import java.util.HashMap;

import com.project.tain.member.model.vo.BusinessMemberVO;
import com.project.tain.member.model.vo.MemberRegVO;

public interface MemberRegService {
	public int check_id(String m_id) throws Exception;

	public int check_email(String m_email) throws Exception;

	int join(MemberRegVO vo) throws Exception;
	int businessJoin(BusinessMemberVO vo) throws Exception;

	int approval_member(MemberRegVO vo);

	MemberRegVO login(MemberRegVO vo) throws Exception;

	String find_id(HashMap<String, Object> voMap) throws Exception;



	void find_pw(MemberRegVO vo)  throws Exception;

	// 로그인 최종 시간 업데이트
	int update_log(MemberRegVO vo)  throws Exception;
	
	// 패스워드 찾기-패스워드 업데이트
	int update_pw(MemberRegVO vo) throws Exception;
}
