package com.project.tain.membermanage.model.vo;

import java.sql.Date;

public class mCartVO {
	private String m_id;
	private String bb_id;
	private String sb_date;
	private char sb_buy;
	private String bb_id_1;
	private String m_id_1;
	private String bb_name;
	private String bb_info;
	private int bb_price;
	private String bb_option1;
	private String bb_option2;
	private String bb_option3;
	private String bb_option4;
	private char bb_type;
	private String bb_topid;
	private Date bb_date;
	private String bb_id_2;
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
	
	public mCartVO() {
	}


	public mCartVO(String m_id, String bb_id, String sb_date, char sb_buy, String bb_id_1, String m_id_1, String bb_name,
			String bb_info, int bb_price, String bb_option1, String bb_option2, String bb_option3, String bb_option4,
			char bb_type, String bb_topid, Date bb_date, String bb_id_2, String bb_img1, String bb_img2, String bb_img3,
			String bb_img4, String bb_img5, String bb_img6, String bb_img7, String bb_img8, String bb_img9,
			String bb_img10) {
		super();
		this.m_id = m_id;
		this.bb_id = bb_id;
		this.sb_date = sb_date;
		this.sb_buy = sb_buy;
		this.bb_id_1 = bb_id_1;
		this.m_id_1 = m_id_1;
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
		this.bb_id_2 = bb_id_2;
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
	
	@Override
	public String toString() {
		return "mCartVO [m_id=" + m_id + ", bb_id=" + bb_id + ", sb_date=" + sb_date + ", sb_buy=" + sb_buy
				+ ", bb_id_1=" + bb_id_1 + ", m_id_1=" + m_id_1 + ", bb_name=" + bb_name + ", bb_info=" + bb_info
				+ ", bb_price=" + bb_price + ", bb_option1=" + bb_option1 + ", bb_option2=" + bb_option2
				+ ", bb_option3=" + bb_option3 + ", bb_option4=" + bb_option4 + ", bb_type=" + bb_type + ", bb_topid="
				+ bb_topid + ", bb_date=" + bb_date + ", bb_id_2=" + bb_id_2 + ", bb_img1=" + bb_img1 + ", bb_img2="
				+ bb_img2 + ", bb_img3=" + bb_img3 + ", bb_img4=" + bb_img4 + ", bb_img5=" + bb_img5 + ", bb_img6="
				+ bb_img6 + ", bb_img7=" + bb_img7 + ", bb_img8=" + bb_img8 + ", bb_img9=" + bb_img9 + ", bb_img10="
				+ bb_img10 + "]";
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getBb_id() {
		return bb_id;
	}
	public void setBb_id(String bb_id) {
		this.bb_id = bb_id;
	}
	public String getSb_date() {
		return sb_date;
	}
	public void setSb_date(String sb_date) {
		this.sb_date = sb_date;
	}
	public char getSb_buy() {
		return sb_buy;
	}
	public void setSb_buy(char sb_buy) {
		this.sb_buy = sb_buy;
	}
	public String getBb_id_1() {
		return bb_id_1;
	}
	public void setBb_id_1(String bb_id_1) {
		this.bb_id_1 = bb_id_1;
	}
	public String getM_id_1() {
		return m_id_1;
	}
	public void setM_id_1(String m_id_1) {
		this.m_id_1 = m_id_1;
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
	public char getBb_type() {
		return bb_type;
	}
	public void setBb_type(char bb_type) {
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
	public String getBb_id_2() {
		return bb_id_2;
	}
	public void setBb_id_2(String bb_id_2) {
		this.bb_id_2 = bb_id_2;
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
}
