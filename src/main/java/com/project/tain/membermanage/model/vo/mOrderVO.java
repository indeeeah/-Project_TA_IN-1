package com.project.tain.membermanage.model.vo;

import java.sql.Date;

public class mOrderVO {
	private String od_id;
	private String bb_id;
	private String m_id;
	private Date od_date;
	private String od_size;
	private int od_amount;
	private String od_options;
	private int od_price;
	private String od_name;
	private String od_phone;
	private int od_addr1;
	private String od_addr2;
	private String od_addr3;
	private String od_status;
	
	
	
	public mOrderVO() {
	}



	public mOrderVO(String od_id, String bb_id, String m_id, Date od_date, String od_size, int od_amount,
			String od_options, int od_price, String od_name, String od_phone, int od_addr1, String od_addr2,
			String od_addr3, String od_status) {
		super();
		this.od_id = od_id;
		this.bb_id = bb_id;
		this.m_id = m_id;
		this.od_date = od_date;
		this.od_size = od_size;
		this.od_amount = od_amount;
		this.od_options = od_options;
		this.od_price = od_price;
		this.od_name = od_name;
		this.od_phone = od_phone;
		this.od_addr1 = od_addr1;
		this.od_addr2 = od_addr2;
		this.od_addr3 = od_addr3;
		this.od_status = od_status;
	}



	@Override
	public String toString() {
		return "mOrderVO [od_id=" + od_id + ", bb_id=" + bb_id + ", m_id=" + m_id + ", od_date=" + od_date
				+ ", od_size=" + od_size + ", od_amount=" + od_amount + ", od_options=" + od_options + ", od_price="
				+ od_price + ", od_name=" + od_name + ", od_phone=" + od_phone + ", od_addr1=" + od_addr1
				+ ", od_addr2=" + od_addr2 + ", od_addr3=" + od_addr3 + ", od_status=" + od_status + "]";
	}



	public String getOd_id() {
		return od_id;
	}



	public void setOd_id(String od_id) {
		this.od_id = od_id;
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



	public Date getOd_date() {
		return od_date;
	}



	public void setOd_date(Date od_date) {
		this.od_date = od_date;
	}



	public String getOd_size() {
		return od_size;
	}



	public void setOd_size(String od_size) {
		this.od_size = od_size;
	}



	public int getOd_amount() {
		return od_amount;
	}



	public void setOd_amount(int od_amount) {
		this.od_amount = od_amount;
	}



	public String getOd_options() {
		return od_options;
	}



	public void setOd_options(String od_options) {
		this.od_options = od_options;
	}



	public int getOd_price() {
		return od_price;
	}



	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}



	public String getOd_name() {
		return od_name;
	}



	public void setOd_name(String od_name) {
		this.od_name = od_name;
	}



	public String getOd_phone() {
		return od_phone;
	}



	public void setOd_phone(String od_phone) {
		this.od_phone = od_phone;
	}



	public int getOd_addr1() {
		return od_addr1;
	}



	public void setOd_addr1(int od_addr1) {
		this.od_addr1 = od_addr1;
	}



	public String getOd_addr2() {
		return od_addr2;
	}



	public void setOd_addr2(String od_addr2) {
		this.od_addr2 = od_addr2;
	}



	public String getOd_addr3() {
		return od_addr3;
	}



	public void setOd_addr3(String od_addr3) {
		this.od_addr3 = od_addr3;
	}



	public String getOd_status() {
		return od_status;
	}



	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}

	
}
