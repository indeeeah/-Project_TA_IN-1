package com.project.tain.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.management.model.domain.BsMemberManage;

@Repository("bsmmDao")
public class BsMemberManageDao {

	@Autowired
	private SqlSession sqlSession;

	// 전체 회원 수 조회
	public int listCount() {
		return sqlSession.selectOne("BsMemberManage.listCount");
	}

	// 상세 조회
	public BsMemberManage selectOne(String m_id) {
		return sqlSession.selectOne("BsMemberManage.selectOne", m_id);
	}

	// 회원 검색
	public List<BsMemberManage> searchList(String keyword) {
		return sqlSession.selectList("BsMemberManage.searchList", keyword);
	}

	// 특정 페이지 단위의 회원 조회
	public List<BsMemberManage> selectList(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("BsMemberManage.selectList", null, row);
	}

	// 회원 수정
	public int updateBsMmanage(BsMemberManage bsm) {
		return sqlSession.update("BsMemberManage.updateBsMmanage", bsm);
	}
	
	// 요청 승인
	public int updateApproval(BsMemberManage bsm) {
		return sqlSession.update("BsMemberManage.updateApproval", bsm);
	}
	
	public int updateUsage(BsMemberManage bsm) {
		return sqlSession.update("BsMemberManage.updateUsage", bsm);
	}
}
