package com.project.tain.business.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.business.board.model.dao.BsnBoardDao;
import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.domain.BsnBoardAdd;

@Service("bbService")
public class BsnBoardServiceImpl implements BsnBoardService{
	//디아이
	@Autowired
	private BsnBoardDao bbDao;
	
	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return bbDao.listCount();
	}

	@Override
	public List<BsnBoard> selectList() {
		// TODO Auto-generated method stub
		return bbDao.selectList();
	}

	@Override
	public BsnBoard selectOne(String bb_id) {
		// TODO Auto-generated method stub
		return bbDao.selectOne(bb_id);
	}

	@Override
	public int insertBsnBoard(BsnBoard bb) {
		System.out.println("aaa3");
		return bbDao.insertBsnBoard(bb);
	}
//	@Override
//	public int insertBsnBoard(BsnBoard bb, BsnBoardAdd bba) {
//		bbDao.insertBsnBoardAdd(bba);
//		return bbDao.insertBsnBoard(bb);
//	}

}
