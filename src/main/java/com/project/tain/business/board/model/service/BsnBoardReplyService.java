package com.project.tain.business.board.model.service;

import java.util.List;

import com.project.tain.business.board.model.domain.BsnBoardReply;

public interface BsnBoardReplyService {
	
	// 댓글 좋아요 수
	int bbrLike() ;
	
	// 댓글 목록
	List<BsnBoardReply> bbrList(String bb_id);
	
	// 댓글 등록
	int insertBbr(BsnBoardReply bbr);
	
	// 댓글 삭제
	int deleteBbr(String bb_id);
	
	
	// 댓글 좋아요 수
	int bbrrLike() ;
	
	// 답글 목록
	List<BsnBoardReply> bbrrList(String bb_id);
	
	// 답글 등록
	int insertBbrr(BsnBoardReply bbr);
	
	// 답글 삭제
	int deleteBbrr(String bb_id);
}
