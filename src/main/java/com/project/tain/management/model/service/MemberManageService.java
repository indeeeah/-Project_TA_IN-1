package com.project.tain.management.model.service;

import java.util.List;

import com.project.tain.management.model.domain.MemberManage;

public interface MemberManageService {
		// 전체 회원 수 조회
		int totalCount();
		
		// 회원 조회
		MemberManage selectOne(String m_id);
		
		// 회원 검색
		List<MemberManage> searchList(String keyword);
		
		// 특정 페이지 단위 회원 조회
		List<MemberManage> selectList(int startPage, int limit);	
		
		// 회원 수정
		MemberManage updateMmanage(MemberManage m);

		// 회원 삭제
		void deleteMmanage(String m_id);
		
		void insertOutManage(String m_id);
}
