package com.kh.goty.board.model.vo;

import java.sql.Date;

public class Board {
	private int freeBoardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private String MemberId;
	private String platformName;
	
	public Board() {
		super();
	}
	
	public Board(int freeBoardNo, String boardTitle, String boardContent, Date createDate, String memberId,
			String platformName) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		MemberId = memberId;
		this.platformName = platformName;
	}
	
	public int getFreeBoardNo() {
		return freeBoardNo;
	}
	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public String getPlatformName() {
		return platformName;
	}
	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}
	
	@Override
	public String toString() {
		return "Board [freeBoardNo=" + freeBoardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", MemberId=" + MemberId + ", platformName=" + platformName + "]";
	}	

}
