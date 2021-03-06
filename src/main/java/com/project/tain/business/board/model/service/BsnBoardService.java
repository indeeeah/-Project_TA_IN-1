package com.project.tain.business.board.model.service;

import java.util.List;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.member.model.vo.BusinessMemberVO;

public interface BsnBoardService {
	// 게시물 수
	int listCount(String m_id);
	
	// 게시물 목록(전체) 
	List<BsnBoard> selectListAll(String m_id);
	// 게시물 목록(페이징) 
	List<BsnBoard> selectListPage(String m_id, int startPage, int limit);
	// 게시물 목록(텍스트) 
	List<BsnBoard> selectList();
	// 게시물 목록(이미지)
	List<BsnBoard> selectListImg();
	
	// 게시물 상세(전체)
	BsnBoard selectOne(String bb_id);
	// 게시물 상세(텍스트)
	BsnBoard selectOneText(String bb_id);
	// 게시물 상세(이미지)
	BsnBoard selectOneImg(String bb_id);
	// 게시물 상세(해시태그)
	List<String> selectOneTags(String bb_id);
	
	// 게시물 등록
	int insertBsnBoard(BsnBoard bb);
	
	// 게시물 수정
	BsnBoard updateBsnBoard(BsnBoard bb);
	
	// 게시물 삭제
	int deleteBsnBoard(String bb_id);

	// hashtag
	int saveBsnTag(BsnBoard bb);
	
	// 장바구니 담기
	public int addToCart(BsnBoard bb);
	
	// 카테고리 목록
	public List<BsnBoard> selectCategory(String m_id);
	
	// 게시물 좋아요 체크
	public BsnBoard checkBb_like(BsnBoard bb);
	
	// 팔로우 체크
	public BsnBoard checkFollow(BsnBoard bb);
	
	// 계정 팔로우
	public int follow(BsnBoard bb);
	
	// 계정 언팔로
	public int unFollow(BsnBoard bb);
	
	// 비즈니스 계정 정보
	public BusinessMemberVO bsnInfo(String m_id);
	
	// 팔로우 수
	public int bsnInfoFollow(String m_id);
	
	// 팔로워 수
	public int bsnInfoFollower(String m_id);
}
