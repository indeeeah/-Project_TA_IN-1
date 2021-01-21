package com.project.tain.business.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.business.board.model.domain.BsnBoardReply;

@Repository("bbrDao")
public class BsnBoardReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 좋아요 수
	public int bbrLike() {
		return sqlSession.selectOne("BsnBoardReply.bbrLike");
	}
	
	// 댓글 목록(전체)
	public List<BsnBoardReply> bbrList(BsnBoardReply bbr){
		System.out.println("댓글목록다오 bb_id:" + bbr.getBb_id());
		System.out.println("댓글목록다오 m_id:" + bbr.getM_id());
		return sqlSession.selectList("BsnBoardReply.bbrList", bbr);
	}
	
	// 댓글 등록
	public int insertBbr(BsnBoardReply bbr) {
		System.out.println("댓글등록dao:"+bbr);
		return sqlSession.insert("BsnBoardReply.insertBbr", bbr);
	}
	
	// 댓글 삭제
	public int deleteBbr(String bb_id) {
		System.out.println("댓글삭제dao:"+bb_id);
		return sqlSession.delete("BsnBoardReply.deleteBbr", bb_id);
	}
	
	// 답글 좋아요 수
	public int bbrrLike() {
		return sqlSession.selectOne("BsnBoardReply.bbrrLike");
	}
	
	// 답글 목록(전체)
	public List<BsnBoardReply> bbrrList(BsnBoardReply bbr){
		System.out.println("답글목록다오 bb_id:" + bbr);
		return sqlSession.selectList("BsnBoardReply.bbrrList", bbr);
	}
	
	// 답글 등록
	public int insertBbrr(BsnBoardReply bbr) {
		System.out.println("답글등록dao:"+bbr);
		return sqlSession.insert("BsnBoardReply.insertBbrr", bbr);
	}
	
	// 답글 삭제
	public int deleteBbrr(String bb_id) {
		System.out.println("답글삭제dao:"+bb_id);
		return sqlSession.delete("BsnBoardReply.deleteBbrr", bb_id);
	}
}
