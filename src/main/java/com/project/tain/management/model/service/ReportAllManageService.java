package com.project.tain.management.model.service;

import java.util.List;

import com.project.tain.management.model.domain.ReportAllManage;

public interface ReportAllManageService {
	// 전체 신고 수 조회
	int totalCount();
	int rbtotalCount();
	int rbbtotalCount();
	// 페이지 단위의 신고 조회
	List<ReportAllManage> selectList(int startPage, int limit);

	// 신고자 검색
	List<ReportAllManage> searchList(String keyword);

	
	// 페이지 단위의 게시글 신고 조회
	List<ReportAllManage> rbselectList(int startPage, int limit);

	// 게시물 검색
	List<ReportAllManage> rbsearchList(String keyword);


	// 페이지 단위의 비지니스게시글 신고 조회
	List<ReportAllManage> rbbselectList(int startPage, int limit);

	// 게시물 검색
	List<ReportAllManage> rbbsearchList(String keyword);
	
}
