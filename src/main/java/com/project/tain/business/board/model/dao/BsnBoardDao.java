package com.project.tain.business.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.domain.BsnBoardAdd;

@Repository("bbDao")
public class BsnBoardDao {
	//디아이
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return sqlSession.selectOne("BsnBoard.bsnListCount");
	}
	
	public List<BsnBoard> selectList(){
		return sqlSession.selectList("BsnBoard.bsnSelectList");
	}
	
	public BsnBoard selectOne(String bb_id) {
		return sqlSession.selectOne("BsnBoard.bsnSelectOne", bb_id);
	}
	
	public int insertBsnBoard(BsnBoard bb) {
		System.out.println("aaa4");
		System.out.println(bb.getM_id());
		System.out.println(bb.getBb_name());
		System.out.println(bb.getBb_info());
		System.out.println(bb.getBb_price());
		System.out.println(bb.getBb_option1());
		System.out.println(bb.getBb_option2());
		System.out.println(bb.getBb_option3());
		System.out.println(bb.getBb_option4());
		System.out.println(bb.getBb_topid());
		System.out.println(bb.getBb_type());
		return sqlSession.insert("BsnBoard.insertBsnBoard", bb);
	}
	
	public int insertBsnBoardAdd(BsnBoardAdd bba) {
		return sqlSession.insert("BsnBoard.insertBsnBoardAdd", bba);
	}

}
