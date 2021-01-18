package com.project.tain.general.board.model.service;

import com.project.tain.general.board.model.domain.GnWrite;

public interface GnWriteService {

	int chkseq();

	int insertboard(GnWrite gw);

	int insertboardimg(GnWrite gw);

	int insertboardhashtag(GnWrite gw);
}
