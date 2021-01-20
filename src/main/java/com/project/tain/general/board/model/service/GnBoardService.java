package com.project.tain.general.board.model.service;

import java.util.List;

import com.project.tain.general.board.model.domain.GnBoard;

public interface GnBoardService {
	GnBoard showp_one(String m_id);

	GnBoard showp_two(String m_id);

	GnBoard showp_three(String m_id);

	GnBoard showp_four(String m_id);

	GnBoard storychk(String m_id);

	List<GnBoard> showpost(String m_id);

	List<GnBoard> highlight(String m_id);

	GnBoard followchk(String my_name, String m_id);

	GnBoard showeachpost(String b_id);

	List<GnBoard> recomFow(String my_name, String m_id);

	int chkReportMember(GnBoard gb);

	int insertReportMember(GnBoard gb);

	String userType(String m_id);

	List<GnBoard> selectFollow(String m_id);

	List<GnBoard> selectFollower(String m_id);

	GnBoard selectEachPost(String b_id);

	List<GnBoard> selectEachPostComments(String b_id);

	String selectEachPostPhotos(String b_id);

	int showpostCount(String m_id);

	List<GnBoard> showpostPage(String m_id, int startPage, int limit);
}
