package com.project.tain.membermanage.model.service;

import java.util.List;

import com.project.tain.membermanage.model.vo.mChatVO;
import com.project.tain.membermanage.model.vo.mMessageVO;

public interface mMessageService {
	public List<mChatVO> showMessageList(String m_id);
	public List<mMessageVO> checkmessage(String m_id);
	public List<mMessageVO> showMessage(String m_id, String m_id2);
	public int sendMessage(mMessageVO mvo);
	public int readmessage(String m_id, String m_id2);
}
