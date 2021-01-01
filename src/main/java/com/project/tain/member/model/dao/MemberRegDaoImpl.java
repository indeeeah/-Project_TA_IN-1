package com.project.tain.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.member.model.vo.MemberRegVO;

@Repository
public class MemberRegDaoImpl implements MemberRegDao{
	@Autowired
	SqlSession sqlSession;
	
	private static final String NameSpace ="com.member.mapper.memberRegMapper";
	@Override
	public boolean login(MemberRegVO vo) throws Exception {
		String name = sqlSession.selectOne(NameSpace + ".login", vo);
		return (name == null) ? false : true;
	}

	@Override
	public void join(MemberRegVO vo) throws Exception {
		sqlSession.insert(NameSpace + ".join", vo);
	}

	@Override
	public List<MemberRegVO> memberFindId(MemberRegVO vo) throws Exception {
		return sqlSession.selectList(NameSpace + ".memberFindId", vo);
	}

	@Override
	public String memberFindPw(MemberRegVO vo) throws Exception {
		return sqlSession.selectOne(NameSpace + ".memberFindPw", vo); 
	}

	@Override
	public int idcheck(String id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".idcheck", id);
	}


	}

	

