package com.project.tain.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.vo.MemberRegVO;

@Repository
public class MemberRegDao {
	@Autowired
	SqlSession sqlSession;
	private static final String NameSpace = "MemberRegMapper";

	// 회원가입
	@Transactional
	public int join(MemberRegVO vo) throws Exception {
		return sqlSession.insert(NameSpace + ".join", vo);
	}

	// 아이디 중복 검사
	public int check_id(String m_id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".check_id", m_id);
	}

	// 이메일 중복 검사
	public int check_email(String m_email) throws Exception {
		System.out.println("dao check_email: "+m_email );
		return sqlSession.selectOne(NameSpace + ".check_email", m_email);
	}

	// 이메일 인증
	@Transactional
	public int approval_member(MemberRegVO vo) throws Exception {
		return sqlSession.update(NameSpace + ".approval_member", vo);
	}

	// 로그인 검사
	public MemberRegVO login(String m_id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".login", m_id);
	}

	// 로그인 접속일자 변경0
	@Transactional
	public int update_log(String m_id) throws Exception {
		return sqlSession.update(NameSpace + ".update_log", m_id);
	}

	// 아이디 찾기
	public String find_id(String m_email) throws Exception {
		return sqlSession.selectOne(NameSpace + ".find_id", m_email);
	}

	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberRegVO vo) throws Exception {
		return sqlSession.update(NameSpace +".update_pw", vo);
	}
}
