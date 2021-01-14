package com.project.tain.management.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.management.model.domain.BoardAllManage;

@Repository("bAllmDao")
public class BoardAllManageDao {

	@Autowired
	private SqlSession sqlSession;

	// 게시물 총 수
	public int bmListCount() {
		return sqlSession.selectOne("BoardAllManage.bmListCount");
	}

	// 게시물 목록(텍스트)
	public List<BoardAllManage> bmSelectList() {
		return sqlSession.selectList("BoardAllManage.bmSelectList");
	}

	// 회원 검색
	public List<BoardAllManage> bmSearchList(String keyword) {
		return sqlSession.selectList("BoardAllManage.bmSearchList", keyword);
	}

	// 특정 페이지 단위의 회원 조회
	public List<BoardAllManage> bmSelectList(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("BoardAllManage.bmSelectList", null, row);
	}

	// 게시물 삭제(텍스트)
	public int deleteBManage(String b_id) {
		return sqlSession.delete("BoardAllManage.deleteBManage", b_id);

	}

	// 비지니스 게시물 총 수
	public int bsbmListCount() {
		return sqlSession.selectOne("BoardAllManage.bsbmListCount");
	}

	// 비지니스 게시물 목록(텍스트)
	public List<BoardAllManage> bsbmSelectList() {
		return sqlSession.selectList("BoardAllManage.bsbmSelectList");
	}

	// 회원 검색
	public List<BoardAllManage> bsbmSearchList(String keyword) {
		return sqlSession.selectList("BoardAllManage.bsbmSearchList", keyword);
	}

	// 특정 페이지 단위의 회원 조회
	public List<BoardAllManage> bsbmSelectList(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("BoardAllManage.bsbmSelectList", null, row);
	}

	// 비지니스 게시물 삭제(텍스트)
	public int deleteBsbManage(String bb_id) {
		return sqlSession.delete("BoardAllManage.deleteBsbManage", bb_id);

	}

}
