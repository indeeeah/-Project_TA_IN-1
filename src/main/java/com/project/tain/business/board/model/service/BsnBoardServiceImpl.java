package com.project.tain.business.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.business.board.model.dao.BsnBoardDao;
import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.member.model.vo.BusinessMemberVO;

@Service("bbService")
public class BsnBoardServiceImpl implements BsnBoardService{
	//디아이
	@Autowired
	private BsnBoardDao bbDao;
	
	// 멤버 게시물 개수
	@Override
	public int listCount(String m_id) {
		return bbDao.listCount(m_id);
	}
	
	// 게시물 목록(전체)
	@Override
	public List<BsnBoard> selectListAll(String m_id) {
		return bbDao.selectListAll(m_id);
	}
	// 게시물 목록(페이징)
	@Override
	public List<BsnBoard> selectListPage(String m_id, int startPage, int limit) {
		// TODO Auto-generated method stub
		return bbDao.selectListPage(m_id, startPage, limit);
	}
	// 게시물 목록(텍스트)
	@Override
	public List<BsnBoard> selectList() {
		return bbDao.selectList();
	}
	// 게시물 목록(이미지)
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
		bbDao.bbInsertNotice(bb);
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
	@Override
	public List<String> selectOneTags(String bb_id) {
		return bbDao.selectOneTags(bb_id);
	}
	
	
	
	
	
	// 장바구니 담기
	@Override
	public int addToCart(BsnBoard bb) {
		return bbDao.addToCart(bb);
	}

	@Override
	public List<BsnBoard> selectCategory(String m_id) {
		return bbDao.selectCategory(m_id);
	}
	// 게시물 좋아요 체크
	@Override
	public BsnBoard checkBb_like(BsnBoard bb) {
		return bbDao.checkBb_like(bb);
	}
	
	// 팔로우 체크
	@Override
	public BsnBoard checkFollow(BsnBoard bb) {
		return bbDao.checkFollow(bb);
	}

	// 팔로우
	@Override
	public int follow(BsnBoard bb) {
		return bbDao.follow(bb);
	}

	// 언팔로
	@Override
	public int unFollow(BsnBoard bb) {
		return bbDao.unFollow(bb);
	}
	
	// 비즈니스 계정 정보
	@Override
	public BusinessMemberVO bsnInfo(String m_id) {
		return bbDao.bsnInfo(m_id);
	}

	// 팔로우 수
	@Override
	public int bsnInfoFollow(String m_id) {
		return bbDao.bsnInfoFollow(m_id);
	}

	// 팔로워 수
	@Override
	public int bsnInfoFollower(String m_id) {
		return bbDao.bsnInfoFollower(m_id);
	}
	
}
