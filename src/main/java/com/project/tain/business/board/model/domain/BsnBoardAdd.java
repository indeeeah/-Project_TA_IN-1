package com.project.tain.business.board.model.domain;

import org.springframework.stereotype.Component;

@Component
public class BsnBoardAdd {
	//이미지첨부파일
	private String bb_id;
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
	
	public BsnBoardAdd() {}

	public BsnBoardAdd(String bb_img1) {
		super();
		this.bb_img1 = bb_img1;
	}
	public BsnBoardAdd(String bb_img1, String bb_img2) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
	}
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
	}
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
	}
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
	}
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
			String bb_img6) {
		super();
		this.bb_img1 = bb_img1;
		this.bb_img2 = bb_img2;
		this.bb_img3 = bb_img3;
		this.bb_img4 = bb_img4;
		this.bb_img5 = bb_img5;
		this.bb_img6 = bb_img6;
	}
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
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
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
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
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
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
	public BsnBoardAdd(String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
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
	public BsnBoardAdd(String bb_id, String bb_img1, String bb_img2, String bb_img3, String bb_img4, String bb_img5,
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

	@Override
	public String toString() {
		return "BsnBoardAdd [bb_id=" + bb_id + ", bb_img1=" + bb_img1 + ", bb_img2=" + bb_img2 + ", bb_img3=" + bb_img3
				+ ", bb_img4=" + bb_img4 + ", bb_img5=" + bb_img5 + ", bb_img6=" + bb_img6 + ", bb_img7=" + bb_img7
				+ ", bb_img8=" + bb_img8 + ", bb_img9=" + bb_img9 + ", bb_img10=" + bb_img10 + "]";
	}

	public String getBb_id() {
		return bb_id;
	}

	public void setBb_id(String bb_id) {
		this.bb_id = bb_id;
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
