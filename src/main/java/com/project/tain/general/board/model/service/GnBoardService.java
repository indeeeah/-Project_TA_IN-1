package com.project.tain.general.board.model.service;

import java.util.List;

import com.project.tain.general.board.model.domain.GnBoard;

public interface GnBoardService {
	public GnBoard showp_one(String m_id);

	public GnBoard showp_two(String m_id);

	public GnBoard showp_three(String m_id);

	public GnBoard showp_four(String m_id);

	public GnBoard storychk(String m_id);

	public List<GnBoard> showpost(String m_id);

	public List<GnBoard> highlight(String m_id);

	public GnBoard followchk(String my_name, String m_id);

	public GnBoard showeachpost(String b_id);
	
	public List<GnBoard> recomFow(String my_name, String m_id);
}
