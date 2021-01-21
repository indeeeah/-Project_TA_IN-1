package com.project.tain.business.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.business.board.model.dao.BsnBoardReplyDao;
import com.project.tain.business.board.model.domain.BsnBoardReply;

@Service("bbrService")
public class BsnBoardReplyServiceImpl implements BsnBoardReplyService{
	
	@Autowired
	private BsnBoardReplyDao bbrDao;
	
	@Override
	public int bbrLike() {
		return bbrDao.bbrLike();
	}

	@Override
	public List<BsnBoardReply> bbrList(BsnBoardReply bbr) {
		return bbrDao.bbrList(bbr);
	}

	@Override
	public int insertBbr(BsnBoardReply bbr) {
		return bbrDao.insertBbr(bbr);
	}

	@Override
	public int deleteBbr(String bb_id) {
		return bbrDao.deleteBbr(bb_id);
	}
	
	@Override
	public int bbrrLike() {
		return bbrDao.bbrrLike();
	}

	@Override
	public List<BsnBoardReply> bbrrList(BsnBoardReply bbr) {
		return bbrDao.bbrrList(bbr);
	}

	@Override
	public int insertBbrr(BsnBoardReply bbr) {
		return bbrDao.insertBbrr(bbr);
	}

	@Override
	public int deleteBbrr(String bb_id) {
		return bbrDao.deleteBbrr(bb_id);
	}

}
