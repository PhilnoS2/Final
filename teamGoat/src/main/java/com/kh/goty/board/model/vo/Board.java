package com.kh.goty.board.model.vo;

import java.sql.Date;

public class Board {
	private int freeBoardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private String memberName;
	private int count;
	private String platformName;
	private int reviewCount;
	
	public Board() {
		super();
	}

	public Board(int freeBoardNo, String boardTitle, String boardContent, Date createDate, String memberName, int count,
			String platformName, int reviewCount) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.memberName = memberName;
		this.count = count;
		this.platformName = platformName;
		this.reviewCount = reviewCount;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPlatformName() {
		return platformName;
	}

	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Board [freeBoardNo=" + freeBoardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", memberName=" + memberName + ", count=" + count + ", platformName="
				+ platformName + ", reviewCount=" + reviewCount + "]";
	}
	
}
