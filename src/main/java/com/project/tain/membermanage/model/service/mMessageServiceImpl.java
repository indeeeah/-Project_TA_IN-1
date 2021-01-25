package com.project.tain.membermanage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.membermanage.model.dao.mMessageDAO;
import com.project.tain.membermanage.model.vo.mChatVO;
import com.project.tain.membermanage.model.vo.mMessageVO;

@Service
public class mMessageServiceImpl implements mMessageService{
	@Autowired
	mMessageDAO mMessageDao;
	@Override
	public List<mChatVO> showMessageList(String m_id) {
		return mMessageDao.showMessageList(m_id);
	}
	
	@Override
	public List<mMessageVO> checkmessage(String m_id) {
		return mMessageDao.checkmessage(m_id);
	}

	@Override
	public List<mMessageVO> showMessage(String m_id, String m_id2) {
		return mMessageDao.showMessage(m_id, m_id2);
	}

	@Override
	public int sendMessage(mMessageVO mvo) {
		return mMessageDao.sendMessage(mvo);
	}
	
	@Override
	public int readmessage(String m_id, String m_id2) {
		return mMessageDao.readmessage(m_id, m_id2);
	}

	@Override
	public int readcheck(String m_id2) {
		return mMessageDao.readcheck(m_id2);
	}

}
