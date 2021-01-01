package com.project.tain.member.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.tain.member.model.vo.MemberRegVO;

public interface MemberRegService {
	public boolean login(MemberRegVO vo, HttpSession session) throws Exception;

	public void join(MemberRegVO vo) throws Exception;

	public List<MemberRegVO> memberFindId(MemberRegVO vo) throws Exception;

	public String memberFindPw(MemberRegVO vo) throws Exception;

	public int idcheck(String id) throws Exception;

	void memberLogout(HttpSession session) throws Exception;
}
