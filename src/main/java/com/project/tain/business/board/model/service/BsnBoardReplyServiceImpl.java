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
	public int likeCount() {
		return bbrDao.likeCount();
	}

	@Override
	public List<BsnBoardReply> bbrList(String bb_id) {
		return bbrDao.bbrList(bb_id);
	}

	@Override
	public int insertBbr(BsnBoardReply bbr) {
		return bbrDao.insertBbr(bbr);
	}

	@Override
	public int deleteBbr(String bb_id) {
		return bbrDao.deleteBbr(bb_id);
	}

}
