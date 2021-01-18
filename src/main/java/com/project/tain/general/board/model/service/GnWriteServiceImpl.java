package com.project.tain.general.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.general.board.model.dao.GnWriteDao;
import com.project.tain.general.board.model.domain.GnWrite;

@Service("gwService")
public class GnWriteServiceImpl implements GnWriteService {
	
	@Autowired
	private GnWriteDao gwDao;

	@Override
	public int chkseq() {
		return gwDao.chkseq();
	}

	@Override
	public int insertboard(GnWrite gw) {
		return gwDao.insertboard(gw);
	}
	@Override
	public int insertboardimg(GnWrite gw) {
		return gwDao.insertboardimg(gw);
	}

	@Override
	public int insertboardhashtag(GnWrite gw) {
		return gwDao.insertboardhashtag(gw);
	}

}
