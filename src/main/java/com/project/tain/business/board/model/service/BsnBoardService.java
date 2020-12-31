package com.project.tain.business.board.model.service;

import java.util.List;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.domain.BsnBoardAdd;

public interface BsnBoardService {
	// 게시물 수
	public int listCount();
	
	public List<BsnBoard> selectList();
	
	public BsnBoard selectOne(String bb_id);
	
	public int insertBsnBoard(BsnBoard bb);
	
}
