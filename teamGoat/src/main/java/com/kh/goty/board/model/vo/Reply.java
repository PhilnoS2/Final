package com.kh.goty.board.model.vo;

import java.sql.Date;

public class Reply {
	
	private int reviewNo;
	private int freeBoardNo;
	private int memberNo;
	private int reportCount;
	private String nickname;
	private String status;
	private String reviewWriter;
	private String reviewContent;
	private Date createDate;
	
	public Reply() {
		super();
	}
	
	public Reply(int reviewNo, int freeBoardNo, int memberNo, String reviewWriter, String reviewContent,
			Date createDate) {
		super();
		this.reviewNo = reviewNo;
		this.freeBoardNo = freeBoardNo;
		this.memberNo = memberNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getFreeBoardNo() {
		return freeBoardNo;
	}
	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Reply [reviewNo=" + reviewNo + ", freeBoardNo=" + freeBoardNo + ", memberNo=" + memberNo
				+ ", reportCount=" + reportCount + ", nickname=" + nickname + ", status=" + status + ", reviewWriter="
				+ reviewWriter + ", reviewContent=" + reviewContent + ", createDate=" + createDate + "]";
	}
}
