package com.project.tain.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.management.model.domain.MemberManage;

@Repository("mmDao")
public class MemberManageDao {
	@Autowired
	private SqlSession sqlSession;

	// 전체 회원 수 조회
	public int listCount() {
		return sqlSession.selectOne("MemberManage.listCount");
	}
	
	// 상세 조회
	public MemberManage selectOne(String m_id) {
		return sqlSession.selectOne("MemberManage.selectOne", m_id);
	}

	// 회원 검색
	public List<MemberManage> searchList(String keyword) {
		return sqlSession.selectList("MemberManage.searchList", keyword);
	}

	// 특정 페이지 단위의 회원 조회
	public List<MemberManage> selectList(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("MemberManage.selectList", null, row);
	}
	
	// 회원 수정
	public int updateMmanage(MemberManage m) {
		return sqlSession.update("MemberManage.updateMmanage", m);
	}

	// 회원 삭제
	public int deleteMmanage(String m_id) {
		return sqlSession.delete("MemberManage.deleteMmanage", m_id);
	}

	public int insertOutManage(String m_id) {
		return sqlSession.insert("MemberManage.insertOutManage", m_id);
	}
	
	// 탈퇴된 회원 수
	public int outlistCount() {
		return sqlSession.selectOne("MemberManage.outlistCount");
	}

	// 탈퇴된 회원 검색
	public List<MemberManage> outsearchList(String keyword) {
		return sqlSession.selectList("MemberManage.outsearchList", keyword);
	}
	
	//탈퇴되 회원조회
	public List<MemberManage> outSelect(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("MemberManage.outSelect", null, row);
	}
	
}
