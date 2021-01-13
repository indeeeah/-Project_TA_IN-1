package com.project.tain.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.management.model.dao.ReportAllManageDao;
import com.project.tain.management.model.domain.ReportAllManage;

@Service("reAllmService")
public class ReportAllManageServiceImpl implements ReportAllManageService {
	@Autowired
	private ReportAllManageDao reAllmDao;
	
	//회원
	@Override
	public int totalCount() {
		return reAllmDao.listCount();
	}

	@Override
	public List<ReportAllManage> selectList(int startPage, int limit) {
		return reAllmDao.selectList(startPage, limit);
	}

	@Override
	public List<ReportAllManage> searchList(String keyword) {
		return reAllmDao.searchList(keyword);
	}
	
	// 게시글
	@Override
	public int rbtotalCount() {
		return reAllmDao.rblistCount();
	}

	@Override
	public List<ReportAllManage> rbselectList(int startPage, int limit) {
		return reAllmDao.rbselectList(startPage, limit);
	}

	@Override
	public List<ReportAllManage> rbsearchList(String keyword) {
		return reAllmDao.rbsearchList(keyword);
	}
	
	//비지니스 게시글
	@Override
	public int rbbtotalCount() {
		return reAllmDao.rbblistCount();
	}

	@Override
	public List<ReportAllManage> rbbselectList(int startPage, int limit) {
		return reAllmDao.rbbselectList(startPage, limit);
	}

	@Override
	public List<ReportAllManage> rbbsearchList(String keyword) {
		return reAllmDao.rbbsearchList(keyword);
	}

}
