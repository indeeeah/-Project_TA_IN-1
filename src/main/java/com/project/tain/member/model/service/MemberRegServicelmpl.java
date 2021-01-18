package com.project.tain.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.dao.MemberRegDao;
import com.project.tain.member.model.vo.BusinessMemberVO;
import com.project.tain.member.model.vo.MemberRegVO;

@Service
public class MemberRegServicelmpl implements MemberRegService {
	@Autowired
	private MemberRegDao dao;

	// 아이디 중복 검사(AJAX) //1: 존재하는 id, 0: 없는 id
	@Override
	public int check_id(String m_id) throws Exception {
		return dao.check_id(m_id);
	}

	// 이메일 중복 검사(AJAX) //1: 존재하는 id, 0: 없는 id
	@Override
	public int check_email(String m_email) throws Exception {
		return dao.check_email(m_email);
	}

	// 일반 회원 가입
	@Override
	public int join(MemberRegVO vo) throws Exception {
		if (dao.check_id(vo.getM_id()) == 1) {
			return -1;   // 일반회원 중 같은 id를 사용하는 회원이 있음.
		} else if (dao.check_email(vo.getM_email()) == 1) {
			return -2;	// 일반회원 중 같은 이메일을 사용하는 회원이 있음.
		} else {
			return dao.join(vo);   // 0: 회원가입실패, 1:회원가입성공
		}
	}

	// 일반 회원 인증
	@Override
	@Transactional
	public int approval_member(MemberRegVO vo) {
		return dao.approval_member(vo);
	}

	// 비즈니스 회원 가입
	@Override
	public int businessJoin(BusinessMemberVO vo) throws Exception {
		if (dao.check_id(vo.getM_id()) == 0) {
			return -1;   // 일반회원 아님
		} else if (!dao.login(vo.getM_id()).getApproval_status().equals("true ")) {
			return -2;   // 일반회원 메일인증 되지 않은 상태
		} else {
			String result = dao.check_businessId(vo);
			if (result == null) {
				return -3;   // 비즈니스 회원임.
			} else if(result.equals("N")) {
				return -4;   // 비즈니스 회원이나 관리자 승인이 되지 않은 상태
			} else {
				return dao.businessJoin(vo);   // 0: 회원가입실패, 1: 회원가입성공
			}
		}		
	}
	
	// 비즈니스 회원 인증
//	@Override
	@Transactional
	public int approval_businessMember(BusinessMemberVO vo) {
//		int result1= dao.approval_member1(vo);
//		int result2= dao.approval_member2(vo);
		return 0;  // result1&result2;
	}
	
	// 로그인
	@Override
	public MemberRegVO login(MemberRegVO vo) throws Exception {
		vo = dao.login(vo.getM_id());
		// dao.update_log(vo.getM_id());
		return vo;
	}

	// 아이디 찾기
	@Override
	public String find_id(String m_email) throws Exception {
		return dao.find_id(m_email);
	}

	// 비밀번호 찾기
	@Override
	public void find_pw(MemberRegVO vo) throws Exception {
		return;
	}

	// 로그인 최종 시간 업데이트
	@Override
	public int update_log(MemberRegVO vo) throws Exception {
		return dao.update_log(vo.getM_id());
	}

	// 패스워드 찾기-패스워드 업데이트
	@Override
	public int update_pw(MemberRegVO vo) throws Exception {
		return dao.update_pw(vo);
	}

}