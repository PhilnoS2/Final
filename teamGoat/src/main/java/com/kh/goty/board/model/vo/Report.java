package com.kh.goty.board.model.vo;

import java.sql.Date;

public class Report {
	private int reviewNo;
	private int reportUser;
	private String reportReason;
	private String etc;
	private Date reportDate;
	
	public Report() {
		super();
	}
	
	public Report(int reviewNo, int reportUser, String reportReason, Date reportDate) {
		super();
		this.reviewNo = reviewNo;
		this.reportUser = reportUser;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
	}
	
	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReportUser() {
		return reportUser;
	}
	public void setReportUser(int reportUser) {
		this.reportUser = reportUser;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reviewNo=" + reviewNo + ", reportUser=" + reportUser + ", reportReason=" + reportReason
				+ ", etc=" + etc + ", reportDate=" + reportDate + "]";
	}
		
}
