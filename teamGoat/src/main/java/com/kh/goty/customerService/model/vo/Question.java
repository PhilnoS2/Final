package com.kh.goty.customerService.model.vo;

import java.sql.Date;

public class Question {

	private int questionNo;
	private int memberNo;
	private int categoryNo;
	private String questionTitle;
	private String questionContent;
	private Date createDate;
	private String status;
	private String questionWriter;
	private String categoryName;
	
	public Question() {
		super();
	}

	public Question(int questionNo, int memberNo, int categoryNo, String questionTitle, String questionContent,
			Date createDate, String status, String questionWriter, String categoryName) {
		super();
		this.questionNo = questionNo;
		this.memberNo = memberNo;
		this.categoryNo = categoryNo;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.createDate = createDate;
		this.status = status;
		this.questionWriter = questionWriter;
		this.categoryName = categoryName;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
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

	public String getQuestionWriter() {
		return questionWriter;
	}

	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", memberNo=" + memberNo + ", categoryNo=" + categoryNo
				+ ", questionTitle=" + questionTitle + ", questionContent=" + questionContent + ", createDate="
				+ createDate + ", status=" + status + ", questionWriter=" + questionWriter + ", categoryName="
				+ categoryName + "]";
	}
}
