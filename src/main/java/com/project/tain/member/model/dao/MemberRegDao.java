package com.project.tain.member.model.dao;

import java.util.List;

import com.project.tain.member.model.vo.MemberRegVO;

public interface MemberRegDao {
	public boolean login(MemberRegVO vo) throws Exception;
	
	public void join(MemberRegVO vo) throws Exception;
	
	public List<MemberRegVO> memberFindId(MemberRegVO vo) throws Exception;
	
	public String memberFindPw(MemberRegVO vo) throws Exception;
	
	public int idcheck(String id) throws Exception;
}

