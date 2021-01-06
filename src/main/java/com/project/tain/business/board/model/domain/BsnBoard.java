package com.project.tain.business.board.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BsnBoard implements java.io.Serializable{
	
	private static final long serialVersionUID = 20001L;
	
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
	
//	비즈니스 첨부파일
	private String bb_img1;
	private String bb_img2;
	private String bb_img3;
	private String bb_img4;
	private String bb_img5;
	private String bb_img6;
	private String bb_img7;
	private String bb_img8;
	private String bb_img9;
	private String bb_img10;
//	비즈니스정보
//	private String b_cate;
//	private String bm_name;
//	private String bm_addr;
//	private String bm_url;
//	private String bm_account;
//	private String bm_qr;
//	private String bm_intro;
//	private String bm_phone;
//	private String bm_approval;
//	회원정보
//	private String m_intro;
//	private String m_img;
//	private String m_usage;
//	private String m_activity;
//	private String m_lastact;
//	private String m_language;
//	회원 게시판, 댓글, 대댓글
//	private String b_id;
//	private String b_title;
//	private String b_content;
//	private String b_type;
//	private String b_topid;
//	private String b_date;
//	회원 게시물 첨부파일
//	private String b_img1;
//	private String b_img2;
//	private String b_img3;
//	private String b_img4;
//	private String b_img5;
//	private String b_img6;
//	private String b_img7;
//	private String b_img8;
//	private String b_img9;
//	private String b_img10;
	
	
	
	
	public BsnBoard() {}
	
	//t_num없는거
	public BsnBoard(String m_id, String bb_name, String bb_info, int bb_price, String bb_option1, String bb_option2,
			String bb_option3, String bb_option4, String bb_type, String bb_topid) {
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
		this.bb_topid = bb_topid;
	}
	
	//t_num있는거
	public BsnBoard(String m_id, String bb_name, String bb_info, int bb_price, String bb_option1, String bb_option2,
			String bb_option3, String bb_option4, String bb_type, String bb_topid, int t_num) {
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
		this.bb_topid = bb_topid;
	}
	
	//bb전체
	public BsnBoard(String bb_id, String m_id, String bb_name, String bb_info, int bb_price, String bb_option1,
			String bb_option2, String bb_option3, String bb_option4, String bb_type, String bb_topid, Date bb_date, int t_num) {
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
	}

	public BsnBoard(String bb_img1) {
		super();
		this.bb_img1 = bb_img1;
	}
	public BsnBoard(String bb_img1, String bb_img2) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6, String bb_img7) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
		this.bb_img7 = bb_img7;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6, String bb_img7, String bb_img8) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
		this.bb_img7 = bb_img7;
		this.bb_img8 = bb_img8;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6, String bb_img7, String bb_img8, String bb_img9) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
		this.bb_img7 = bb_img7;
		this.bb_img8 = bb_img8;
		this.bb_img9 = bb_img9;
	}
	public BsnBoard(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6, String bb_img7, String bb_img8, String bb_img9, String bb_img10) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
		this.bb_img7 = bb_img7;
		this.bb_img8 = bb_img8;
		this.bb_img9 = bb_img9;
		this.bb_img10 = bb_img10;
	}
	public BsnBoard(String bb_id, String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6, String bb_img7, String bb_img8, String bb_img9, String bb_img10) {
		super();
		this.bb_id = bb_id;
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
		this.bb_img7 = bb_img7;
		this.bb_img8 = bb_img8;
		this.bb_img9 = bb_img9;
		this.bb_img10 = bb_img10;
	}


	public BsnBoard(String bb_id, String m_id, String bb_name, String bb_info, int bb_price, String bb_option1,
			String bb_option2, String bb_option3, String bb_option4, String bb_type, String bb_topid, Date bb_date,
			String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5, String bb_img6,
			String bb_img7, String bb_img8, String bb_img9, String bb_img10) {
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
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
		this.bb_img7 = bb_img7;
		this.bb_img8 = bb_img8;
		this.bb_img9 = bb_img9;
		this.bb_img10 = bb_img10;
	}

//	@Override
//	public String toString() {
//		return "BsnBoard [bb_id=" + bb_id + ", m_id=" + m_id + ", bb_name=" + bb_name + ", bb_info=" + bb_info
//				+ ", bb_price=" + bb_price + ", bb_option1=" + bb_option1 + ", bb_option2=" + bb_option2
//				+ ", bb_option3=" + bb_option3 + ", bb_option4=" + bb_option4 + ", bb_type=" + bb_type + ", bb_topid="
//				+ bb_topid + ", bb_date=" + bb_date + "]";
//	}

	@Override
	public String toString() {
		return "BsnBoard [bb_id=" + bb_id + ", m_id=" + m_id + ", bb_name=" + bb_name + ", bb_info=" + bb_info
				+ ", bb_price=" + bb_price + ", bb_option1=" + bb_option1 + ", bb_option2=" + bb_option2
				+ ", bb_option3=" + bb_option3 + ", bb_option4=" + bb_option4 + ", bb_type=" + bb_type + ", bb_topid="
				+ bb_topid + ", bb_date=" + bb_date + ", t_num=" + t_num + ", bb_img1=" + bb_img1 + ", bb_img2=" + bb_img2 + ", bb_img3="
				+ bb_img3 + ", bb_img4=" + bb_img4 + ", bb_img5=" + bb_img5 + ", bb_img6=" + bb_img6 + ", bb_img7="
				+ bb_img7 + ", bb_img8=" + bb_img8 + ", bb_img9=" + bb_img9 + ", bb_img10=" + bb_img10 + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
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


	public String getBb_img1() {
		return bb_img1;
	}


	public void setBb_img1(String bb_img1) {
		this.bb_img1 = bb_img1;
	}


	public String getBb_img2() {
		return bb_img2;
	}


	public void setBb_img2(String bb_img2) {
		this.bb_img2 = bb_img2;
	}


	public String getBb_img3() {
		return bb_img3;
	}


	public void setBb_img3(String bb_img3) {
		this.bb_img3 = bb_img3;
	}


	public String getBb_img4() {
		return bb_img4;
	}


	public void setBb_img4(String bb_img4) {
		this.bb_img4 = bb_img4;
	}


	public String getBb_img5() {
		return bb_img5;
	}


	public void setBb_img5(String bb_img5) {
		this.bb_img5 = bb_img5;
	}


	public String getBb_img6() {
		return bb_img6;
	}


	public void setBb_img6(String bb_img6) {
		this.bb_img6 = bb_img6;
	}


	public String getBb_img7() {
		return bb_img7;
	}


	public void setBb_img7(String bb_img7) {
		this.bb_img7 = bb_img7;
	}


	public String getBb_img8() {
		return bb_img8;
	}


	public void setBb_img8(String bb_img8) {
		this.bb_img8 = bb_img8;
	}


	public String getBb_img9() {
		return bb_img9;
	}


	public void setBb_img9(String bb_img9) {
		this.bb_img9 = bb_img9;
	}


	public String getBb_img10() {
		return bb_img10;
	}


	public void setBb_img10(String bb_img10) {
		this.bb_img10 = bb_img10;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getT_num() {
		return t_num;
	}

	public void setT_num(int t_num) {
		this.t_num = t_num;
	}

		

	
	
}
