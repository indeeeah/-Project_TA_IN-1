package com.project.tain.membermanage.model.vo;

public class mChatVO {
	private String chat;
	private String lastdate;
	
	public mChatVO() {
	}
	public mChatVO(String chat, String lastdate) {
		super();
		this.chat = chat;
		this.lastdate = lastdate;
	}
	@Override
	public String toString() {
		return "mChatVO [chat=" + chat + ", lastdate=" + lastdate + "]";
	}
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	
	
}
