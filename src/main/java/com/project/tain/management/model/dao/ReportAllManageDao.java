package com.project.tain.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.management.model.domain.ReportAllManage;

@Repository("reAllmDao")
public class ReportAllManageDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 신고 수 조회
	public int listCount() {
		return sqlSession.selectOne("ReportAllManage.listCount");
	}
		
	// 페이지 단위의 신고 조회
	public List<ReportAllManage> selectList(int startPage, int limit) {  
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("ReportAllManage.selectList", null, row);
	}
	
	// 신고자 검색 
	public List<ReportAllManage> searchList(String keyword) {
		return sqlSession.selectList("ReportAllManage.searchList", keyword);
	}
	
	
	//***************************//
	// 게시글 전체 신고 수 조회
	public int rblistCount() {
		return sqlSession.selectOne("ReportAllManage.rblistCount");
	}
			
	// 페이지 단위의 게시글 신고 조회
	public List<ReportAllManage> rbselectList(int startPage, int limit) {  
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("ReportAllManage.rbselectList", null, row);
	}
		
	// 게시물 검색 
	public List<ReportAllManage> rbsearchList(String keyword) {
		return sqlSession.selectList("ReportAllManage.rbsearchList", keyword);
	}

	// 게시물 삭제(텍스트)
	public int deleteBoardManage(String b_id) {
		return sqlSession.delete("ReportAllManage.deleteBoardManage", b_id);

	}

	// ****************************//
	// 비지니스 게시글 전체 신고 수 조회
	public int rbblistCount() {
		return sqlSession.selectOne("ReportAllManage.listCount");
	}
			
	// 페이지 단위의 비지니스게시글 신고 조회
	public List<ReportAllManage> rbbselectList(int startPage, int limit) {  
		int startRow = (startPage-1)*limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("ReportAllManage.rbbselectList", null, row);
	}
		
	// 게시물 검색 
	public List<ReportAllManage> rbbsearchList(String keyword) {
		return sqlSession.selectList("ReportAllManage.rbbsearchList", keyword);
	}

	// 비지니스 게시물 삭제(텍스트)
	public int deleteBsboardManage(String bb_id) {
		return sqlSession.delete("ReportAllManage.deleteBsboardManage", bb_id);
	}
}
