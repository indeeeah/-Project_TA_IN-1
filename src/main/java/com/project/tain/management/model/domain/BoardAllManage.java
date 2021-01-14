package com.project.tain.management.model.domain;

import java.sql.Date;

public class BoardAllManage implements java.io.Serializable {

	private static final long serialVersionUID = 2L;
	
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
	
	private String b_id;
	private String b_content;
	private String b_type;
	private String b_topid;
	private Date b_date;

	public BoardAllManage() {
		
	}

	public BoardAllManage(String m_id, String b_id, String b_content, String b_type, String b_topid, Date b_date) {
		super();
		this.m_id = m_id;
		this.b_id = b_id;
		this.b_content = b_content;
		this.b_type = b_type;
		this.b_topid = b_topid;
		this.b_date = b_date;
	}

	public BoardAllManage(String bb_id, String m_id, String bb_name, Date bb_date) {
		super();
		this.bb_id = bb_id;
		this.m_id = m_id;
		this.bb_name = bb_name;
		this.bb_date = bb_date;
	}

	public BoardAllManage(String bb_id, String m_id, String bb_name, int bb_price, String bb_type, Date bb_date) {
		super();
		this.bb_id = bb_id;
		this.m_id = m_id;
		this.bb_name = bb_name;
		this.bb_price = bb_price;
		this.bb_type = bb_type;
		this.bb_date = bb_date;
	}
	
	public BoardAllManage(String m_id, String bb_name, String bb_info, int bb_price, String bb_type, String bb_topid,
			Date bb_date) {
		super();
		this.m_id = m_id;
		this.bb_name = bb_name;
		this.bb_info = bb_info;
		this.bb_price = bb_price;
		this.bb_type = bb_type;
		this.bb_topid = bb_topid;
		this.bb_date = bb_date;
	}

	public BoardAllManage(String bb_id, String m_id, String bb_name, String bb_info, int bb_price, String bb_option1,
			String bb_option2, String bb_option3, String bb_option4, String bb_type, String bb_topid, Date bb_date) {
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
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getB_topid() {
		return b_topid;
	}

	public void setB_topid(String b_topid) {
		this.b_topid = b_topid;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
