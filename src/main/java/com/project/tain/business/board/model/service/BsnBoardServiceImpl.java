package com.project.tain.business.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.business.board.model.dao.BsnBoardDao;
import com.project.tain.business.board.model.domain.BsnBoard;

@Service("bbService")
public class BsnBoardServiceImpl implements BsnBoardService{
	//디아이
	@Autowired
	private BsnBoardDao bbDao;
	
	@Override
	public int listCount(String m_id) {
		return bbDao.listCount(m_id);
	}

	@Override
	public List<BsnBoard> selectListAll(String m_id) {
		return bbDao.selectListAll(m_id);
	}
	@Override
	public List<BsnBoard> selectList() {
		return bbDao.selectList();
	}
	@Override
	public List<BsnBoard> selectListImg() {
		return bbDao.selectListImg();
	}
	
	@Override
	public BsnBoard selectOne(String bb_id) {
		return bbDao.selectOne(bb_id);
	}
	@Override
	public BsnBoard selectOneText(String bb_id) {
		// TODO Auto-generated method stub
		return bbDao.selectOneText(bb_id);
	}
	@Override
	public BsnBoard selectOneImg(String bb_id) {
		return bbDao.selectOneImg(bb_id);
	}

	@Override
	public int insertBsnBoard(BsnBoard bb) {
		System.out.println("aaa2");
		bbDao.insertBsnBoard(bb);
		return bbDao.insertBsnBoardAdd(bb);
	}

	@Override
	public BsnBoard updateBsnBoard(BsnBoard bb) {
		int result = bbDao.updateBsnBoard(bb);
		if(result>0) {
			bb=bbDao.selectOne(bb.getBb_id());
			bbDao.updateBsnBoardAdd(bb);
		} else {
			bb=null;
		}
		return bb;
	}

	@Override
	public int deleteBsnBoard(String bb_id) {
		bbDao.deleteBsnBoardAdd(bb_id);
		return bbDao.deleteBsnBoard(bb_id);
	}

	@Override
	public int saveBsnTag(BsnBoard bb) {
//		BsnBoard bb1 = new BsnBoard();
//		bb1.setH_tag(bb.getH_tag());
		return bbDao.saveBsnTag(bb);
	}

	// 게시물 상세(해시태그)
	public List<String> selectOneTags(String bb_id) {
		return bbDao.selectOneTags(bb_id);
	}

	






	// 게시물 삭제(텍스트)
	
	// 게시물 삭제(이미지)
}
