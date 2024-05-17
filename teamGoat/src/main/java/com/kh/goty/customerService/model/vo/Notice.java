package com.kh.goty.customerService.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private int memberNo;
	private String noticeTitle;
	private String noticeContent;
	private Date createDate;
	private String status;
	private int count;
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, int memberNo, String noticeTitle, String noticeContent, Date createDate, String status,
			int count) {
		super();
		this.noticeNo = noticeNo;
		this.memberNo = memberNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.status = status;
		this.count = count;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", memberNo=" + memberNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", createDate=" + createDate + ", status=" + status + ", count="
				+ count + "]";
	}

	
	
	
	
	
	
}
