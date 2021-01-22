package com.project.tain.membermanage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.membermanage.model.vo.mChatVO;
import com.project.tain.membermanage.model.vo.mMessageVO;

@Repository("mMessageDAO")
public class mMessageDAO {
	@Autowired
	private SqlSession sqlSession;
	
//	내 채팅방 리스트 불러오기
	public List<mChatVO> showMessageList(String m_id){
		return sqlSession.selectList("mMessageVO.showMessageList", m_id);
	}
	
//	채팅내용 불러오기
	public List<mMessageVO> showMessage(String m_id, String m_id2){
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id); //내 아이디
		map.put("m_id2", m_id2); //상대아이디
		return sqlSession.selectList("mMessageVO.showMessage", map);
	}
	
//	메세지보내기
	public int sendMessage(mMessageVO mvo) {
		return sqlSession.insert("mMessageVO.sendMessage", mvo);
	}

}
