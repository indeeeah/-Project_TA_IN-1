package com.project.tain.management.model.service;

import java.util.List;

import com.project.tain.management.model.domain.BsMemberManage;

public interface BsMemberManageService {

	// 전체 회원 수 조회
	int totalCount();

	// 상세 조회
	BsMemberManage selectOne(String m_id);

	// 회원 검색
	List<BsMemberManage> searchList(String keyword);

	// 특정 페이지 단위의 회원 조회
	List<BsMemberManage> selectList(int startPage, int limit);

	// 회원 수정
	BsMemberManage updateBsMmanage(BsMemberManage bsm);

	// 회원 삭제
	void deleteBsMmanage(String m_id);
}
