package com.project.tain.business.board.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BsnBoardReply implements java.io.Serializable{
	
	private static final long serialVersionUID = 30001L;
	
	//	비즈니스게시판
	private String bb_id;
	private String m_id;
	private String bb_name;
	private String bb_info;
	private int bb_price;
	private String bb_option1;
	private String bb_option2;
	private String bb_option3;
	private String bb_option4;
	private String bb_type;
	private String bb_topid;
	private Date bb_date;
	private int t_num;
	
	// 좋아요 수
	private Date l_date;
	private int bbrlike;
	
	// 멤버게시판 - 프로필사진
	private String m_img;
	
	// 신고
	private String rb_reason;
	private Date rb_date;
	
	// 기본 생성자
	public BsnBoardReply() {}
	
	// 등록 및 수정
	public BsnBoardReply(String m_id, String bb_name, String bb_info, int bb_price, String bb_option1,
			String bb_option2, String bb_option3, String bb_option4, String bb_type,
			int t_num, String rb_reason) {
		super();
		this.m_id = m_id;
		this.bb_name = bb_name;
		this.bb_info = bb_info;
		this.bb_price = bb_price;
		this.bb_option1 = bb_option1;
		this.bb_option2 = bb_option2;
		this.bb_option3 = bb_option3;
		this.bb_option4 = bb_option4;
		this.bb_type = bb_type;
		this.t_num = t_num;
		this.rb_reason = rb_reason;
	}
	
	// 삭제
	public BsnBoardReply(String bb_id, String m_id) {
		super();
		this.bb_id = bb_id;
		this.m_id = m_id;
	}
	// test1
	public BsnBoardReply(String bb_id) {
		super();
		this.bb_id = bb_id;
	}
	
	// 조회
	public BsnBoardReply(String bb_id, String m_id, String bb_name, String bb_info, int bb_price, String bb_option1,
			String bb_option2, String bb_option3, String bb_option4, String bb_type, String bb_topid, Date bb_date,
			int t_num, String m_img) {
		super();
		this.bb_id = bb_id;
		this.m_id = m_id;
		this.bb_name = bb_name;
		this.bb_info = bb_info;
		this.bb_price = bb_price;
		this.bb_option1 = bb_option1;
		this.bb_option2 = bb_option2;
		this.bb_option3 = bb_option3;
		this.bb_option4 = bb_option4;
		this.bb_type = bb_type;
		this.bb_topid = bb_topid;
		this.bb_date = bb_date;
		this.t_num = t_num;
		this.m_img = m_img;
	}

	// 전체
	public BsnBoardReply(String bb_id, String m_id, String bb_name, String bb_info, int bb_price, String bb_option1,
			String bb_option2, String bb_option3, String bb_option4, String bb_type, String bb_topid, Date bb_date,
			int t_num, Date l_date, String m_img, String rb_reason, Date rb_date, int bbrlike) {
		super();
		this.bb_id = bb_id;
		this.m_id = m_id;
		this.bb_name = bb_name;
		this.bb_info = bb_info;
		this.bb_price = bb_price;
		this.bb_option1 = bb_option1;
		this.bb_option2 = bb_option2;
		this.bb_option3 = bb_option3;
		this.bb_option4 = bb_option4;
		this.bb_type = bb_type;
		this.bb_topid = bb_topid;
		this.bb_date = bb_date;
		this.t_num = t_num;
		this.m_img = m_img;
		this.bbrlike = bbrlike;
	}
	@Override
	public String toString() {
		return "BsnBoardReply [bb_id=" + bb_id + ", m_id=" + m_id + ", bb_name=" + bb_name + ", bb_info=" + bb_info
				+ ", bb_price=" + bb_price + ", bb_option1=" + bb_option1 + ", bb_option2=" + bb_option2
				+ ", bb_option3=" + bb_option3 + ", bb_option4=" + bb_option4 + ", bb_type=" + bb_type + ", bb_topid="
				+ bb_topid + ", bb_date=" + bb_date + ", t_num=" + t_num + ", l_date=" + l_date + ", m_img=" + m_img
				+ ", rb_reason=" + rb_reason + ", rb_date=" + rb_date + ", bbrlike=" + bbrlike + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	public String getBb_id() {
		return bb_id;
	}

	public void setBb_id(String bb_id) {
		this.bb_id = bb_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getBb_name() {
		return bb_name;
	}

	public void setBb_name(String bb_name) {
		this.bb_name = bb_name;
	}

	public String getBb_info() {
		return bb_info;
	}

	public void setBb_info(String bb_info) {
		this.bb_info = bb_info;
	}

	public int getBb_price() {
		return bb_price;
	}

	public void setBb_price(int bb_price) {
		this.bb_price = bb_price;
	}

	public String getBb_option1() {
		return bb_option1;
	}

	public void setBb_option1(String bb_option1) {
		this.bb_option1 = bb_option1;
	}

	public String getBb_option2() {
		return bb_option2;
	}

	public void setBb_option2(String bb_option2) {
		this.bb_option2 = bb_option2;
	}

	public String getBb_option3() {
		return bb_option3;
	}

	public void setBb_option3(String bb_option3) {
		this.bb_option3 = bb_option3;
	}

	public String getBb_option4() {
		return bb_option4;
	}

	public void setBb_option4(String bb_option4) {
		this.bb_option4 = bb_option4;
	}

	public String getBb_type() {
		return bb_type;
	}

	public void setBb_type(String bb_type) {
		this.bb_type = bb_type;
	}

	public String getBb_topid() {
		return bb_topid;
	}

	public void setBb_topid(String bb_topid) {
		this.bb_topid = bb_topid;
	}

	public Date getBb_date() {
		return bb_date;
	}

	public void setBb_date(Date bb_date) {
		this.bb_date = bb_date;
	}

	public int getT_num() {
		return t_num;
	}

	public void setT_num(int t_num) {
		this.t_num = t_num;
	}

	public Date getL_date() {
		return l_date;
	}

	public void setL_date(Date l_date) {
		this.l_date = l_date;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	public String getRb_reason() {
		return rb_reason;
	}

	public void setRb_reason(String rb_reason) {
		this.rb_reason = rb_reason;
	}

	public Date getRb_date() {
		return rb_date;
	}

	public void setRb_date(Date rb_date) {
		this.rb_date = rb_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getBbrlike() {
		return bbrlike;
	}

	public void setBbrlike(int bbrlike) {
		this.bbrlike = bbrlike;
	}
	
}
