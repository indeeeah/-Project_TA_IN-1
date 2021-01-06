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
	public List<BsnBoard> selectListAll() {
		// TODO Auto-generated method stub
		return bbDao.selectListAll();
	}
	@Override
	public List<BsnBoard> selectList() {
		// TODO Auto-generated method stub
		return bbDao.selectList();
	}
	@Override
	public List<BsnBoardAdd> selectListImg() {
		// TODO Auto-generated method stub
		return bbDao.selectListImg();
	}
	
	@Override
	public BsnBoard selectOne(String bb_id) {
		// TODO Auto-generated method stub
		return bbDao.selectOne(bb_id);
	}
	@Override
	public BsnBoard selectOneText(String bb_id) {
		// TODO Auto-generated method stub
		return bbDao.selectOneText(bb_id);
	}
	@Override
	public BsnBoardAdd selectOneImg(String bb_id) {
		// TODO Auto-generated method stub
		return bbDao.selectOneImg(bb_id);
	}

	@Override
	public int insertBsnBoard(BsnBoard bb, BsnBoardAdd bba) {
		System.out.println("aaa2");
		bbDao.insertBsnBoard(bb);
		return bbDao.insertBsnBoardAdd(bba);
	}
//	@Override
//	public int insertBsnBoard(BsnBoard bb, BsnBoardAdd bba) {
//		bbDao.insertBsnBoardAdd(bba);
//		return bbDao.insertBsnBoard(bb);
//	}

	@Override
	public int updateBsnBoard(BsnBoard bb, BsnBoardAdd bba) {
		bbDao.updateBsnBoardAdd(bba);
		return bbDao.updateBsnBoard(bb);
	}

	@Override
	public int deleteBsnBoard(String bb_id) {
		bbDao.deleteBsnBoardAdd(bb_id);
		return bbDao.deleteBsnBoard(bb_id);
	}

	






	// 게시물 삭제(텍스트)
	
	// 게시물 삭제(이미지)
}
