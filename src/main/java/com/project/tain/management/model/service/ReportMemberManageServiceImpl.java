package com.project.tain.management.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.management.model.dao.ReportMemberManageDao;
import com.project.tain.management.model.domain.ReportMemberManage;

@Service("repmmService")
public class ReportMemberManageServiceImpl implements ReportMemberManageService {
	@Autowired
	private ReportMemberManageDao repmmDao;
	
	@Override
	public int totalCount() {
		return repmmDao.listCount();
	}

	@Override
	public List<ReportMemberManage> selectList(int startPage, int limit) {
		return repmmDao.selectList(startPage, limit);
	}

	@Override
	public List<ReportMemberManage> searchList(String keyword) {
		return repmmDao.searchList(keyword);
	}

	
	
}
