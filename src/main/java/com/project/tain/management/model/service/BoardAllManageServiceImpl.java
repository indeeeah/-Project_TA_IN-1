package com.project.tain.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.management.model.dao.BoardAllManageDao;
import com.project.tain.management.model.domain.BoardAllManage;

@Service("bAllmService")
public class BoardAllManageServiceImpl implements BoardAllManageService {
	@Autowired
	private BoardAllManageDao bAllmDao;
	
	// 게시물 총 수
	@Override
	public int btotalCount() {
		return bAllmDao.bmListCount();
	}
	
	// 게시물 목록(텍스트)
	@Override
	public List<BoardAllManage> bmSelectList() {
		return bAllmDao.bmSelectList();
	}
	
	// 게시물 검색 
	@Override
	public List<BoardAllManage> bmSearchList(String keyword) {
		return bAllmDao.bmSearchList(keyword);
	}
	
	// 페이지 단위의 게시물
	@Override
	public List<BoardAllManage> bmSelectList(int startPage, int limit) {
		return bAllmDao.bmSelectList(startPage, limit);
	}
	
	// 게시물 삭제(텍스트)
	@Override
	public int deleteBManage(String b_id) {
		return bAllmDao.deleteBManage(b_id);
	}
	
	// 비지니스 게시물 총 수
	@Override
	public int bstotalCount() {
		return bAllmDao.bsbmListCount();
	}
	
	// 비지니스 게시물 목록
	@Override
	public List<BoardAllManage> bsbmSelectList() {
		return bAllmDao.bsbmSelectList();
	}
	
	// 비지니스 게시물 검색
	@Override
	public List<BoardAllManage> bsbmSearchList(String keyword) {
		return bAllmDao.bsbmSearchList(keyword);
	}
	
	// 페이지 단위의 비지니스 게시물
	@Override
	public List<BoardAllManage> bsbmSelectList(int startPage, int limit) {
		return bAllmDao.bsbmSelectList(startPage, limit);
	}
	
	// 비지니스 게시물 삭제(텍스트)
	@Override
	public int deleteBsbManage(String bb_id) {
		return bAllmDao.deleteBsbManage(bb_id);
	}

}
