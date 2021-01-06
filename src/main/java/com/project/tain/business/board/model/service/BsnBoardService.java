package com.project.tain.business.board.model.service;

import java.util.List;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.domain.BsnBoardAdd;

public interface BsnBoardService {
	// 게시물 수
	int listCount();
	
	// 게시물 목록(텍스트) 
	List<BsnBoard> selectListAll();
	// 게시물 목록(텍스트) 
	List<BsnBoard> selectList();
	// 게시물 목록(이미지)
	List<BsnBoardAdd> selectListImg();
	
	// 게시물 상세(전체)
	BsnBoard selectOne(String bb_id);
	// 게시물 상세(텍스트)
	BsnBoard selectOneText(String bb_id);
	// 게시물 상세(이미지)
	BsnBoardAdd selectOneImg(String bb_id);
	
	// 게시물 등록
	int insertBsnBoard(BsnBoard bb, BsnBoardAdd bba);
	
	// 게시물 수정
	int updateBsnBoard(BsnBoard bb, BsnBoardAdd bba);
	
	// 게시물 삭제
	int deleteBsnBoard(String bb_id);

	
}
