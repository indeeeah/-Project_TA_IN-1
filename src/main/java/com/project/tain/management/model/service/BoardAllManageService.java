package com.project.tain.management.model.service;

import java.util.List;

import com.project.tain.management.model.domain.BoardAllManage;

public interface BoardAllManageService {
	// 게시물 총 수
	int btotalCount();

	// 게시물 목록(텍스트)
	List<BoardAllManage> bmSelectList();

	// 회원 검색
	List<BoardAllManage> bmSearchList(String keyword);

	// 특정 페이지 단위의 회원 조회
	List<BoardAllManage> bmSelectList(int startPage, int limit);

	// 게시물 삭제(텍스트)
	int deleteBManage(String b_id);

	// 비지니스 게시물 총 수
	int bstotalCount();

	// 비지니스 게시물 목록(텍스트)
	List<BoardAllManage> bsbmSelectList();

	// 회원 검색
	List<BoardAllManage> bsbmSearchList(String keyword);

	// 특정 페이지 단위의 회원 조회
	List<BoardAllManage> bsbmSelectList(int startPage, int limit);

	// 비지니스 게시물 삭제(텍스트)
	int deleteBsbManage(String bb_id);
}
