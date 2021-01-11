package com.project.tain.management.model.service;

import java.util.List;

import com.project.tain.management.model.domain.ReportMemberManage;

public interface ReportMemberManageService {
	// 전체 신고 수 조회
	int totalCount();
		
	// 페이지 단위의 신고 조회
	List<ReportMemberManage> selectList(int startPage, int limit);
	
	// 신고자 검색 
	List<ReportMemberManage> searchList(String keyword);
}
