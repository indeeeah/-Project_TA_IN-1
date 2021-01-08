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
	public int likeCount() {
		return sqlSession.selectOne("BsnBoardReply.likeCount");
	}
	
	// 댓글 목록(전체)
	public List<BsnBoardReply> bbrList(String bb_id){
		System.out.println("댓글리스트다오");
		System.out.println("댓글 bb_id:" + bb_id);
		return sqlSession.selectList("BsnBoardReply.bbrList", bb_id);
	}
	
	// 댓글 등록
	public int insertBbr(BsnBoardReply bbr) {
		System.out.println("aaa3");
		return sqlSession.insert("BsnBoardReply.insertBbr", bbr);
	}
	
	// 댓글 수정
	public int updateBbr(BsnBoardReply bbr) {
		return sqlSession.delete("BsnBoardReply.updateBbr", bbr);
	}
	
	// 댓글 삭제
	public int deleteBbr(String bb_id) {
		System.out.println("bbr삭제디");
		return sqlSession.delete("BsnBoardReply.deleteBbr", bb_id);
	}
}
