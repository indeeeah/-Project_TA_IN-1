package com.project.tain.businessmembermanage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.businessmembermanage.model.dao.bMemberDAO;
import com.project.tain.businessmembermanage.model.vo.bMemberVO;

@Service("bmService")
public class bMemberServiceImpl implements bMemberService{
	@Autowired
	bMemberDAO bMemberDao;
	
	@Override
	public bMemberVO showbMember(String m_id) {
		return bMemberDao.showbMember(m_id);
	}

	@Override
	public int updatebMember(bMemberVO bvo) {
		return bMemberDao.updatebMember(bvo);
	}

	@Override
	public int insertbMember(bMemberVO bvo) {
		return bMemberDao.insertbMember(bvo);
	}

	@Override
	public int deletebMember(String m_id) {
		return bMemberDao.deletebMember(m_id);
	}

}
