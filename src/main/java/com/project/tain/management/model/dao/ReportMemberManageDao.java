package com.project.tain.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.management.model.domain.ReportMemberManage;

@Repository("repmmDao")
public class ReportMemberManageDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 신고 수 조회
	public int listCount() {
		return sqlSession.selectOne("ReportMemberManage.listCount");
	}
		
	// 페이지 단위의 신고 조회
	public List<ReportMemberManage> selectList(int startPage, int limit) {  
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("ReportMemberManage.selectList", null, row);
	}
	
	// 신고자 검색 
	public List<ReportMemberManage> searchList(String keyword) {
		return sqlSession.selectList("ReportMemberManage.searchList", keyword);
	}

}
