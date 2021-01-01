package com.project.tain.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.member.model.vo.MemberRegVO;

@Repository
public class MemberRegDao{
	@Autowired
	SqlSession sqlSession;
	
	private static final String NameSpace ="MemberRegMapper";
	public boolean login(MemberRegVO vo) throws Exception {
		String name = sqlSession.selectOne(NameSpace + ".login", vo);
		return (name == null) ? false : true;
	}

	public int join(MemberRegVO vo) throws Exception {
		return sqlSession.insert(NameSpace + ".join", vo);
	}

	public List<MemberRegVO> memberFindId(MemberRegVO vo) throws Exception {
		return sqlSession.selectList(NameSpace + ".memberFindId", vo);
	}

	public String memberFindPw(MemberRegVO vo) throws Exception {
		return sqlSession.selectOne(NameSpace + ".memberFindPw", vo); 
	}

	public int idcheck(String id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".idcheck", id);
	}


	}

	

