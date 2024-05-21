package com.kh.goty.customerService.model.vo;

import java.sql.Date;

public class Answer {

	private int questionNo;
	private int memebrNo;
	private String answerComment;
	private Date createDate;
	private String status;
	
	public Answer() {
		super();
	}
	
	public Answer(int questionNo, int memebrNo, String answerComment, Date createDate, String status) {
		super();
		this.questionNo = questionNo;
		this.memebrNo = memebrNo;
		this.answerComment = answerComment;
		this.createDate = createDate;
		this.status = status;
	}
	
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getMemebrNo() {
		return memebrNo;
	}
	public void setMemebrNo(int memebrNo) {
		this.memebrNo = memebrNo;
	}
	public String getAnswerComment() {
		return answerComment;
	}
	public void setAnswerComment(String answerComment) {
		this.answerComment = answerComment;
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
	
	@Override
	public String toString() {
		return "Answer [questionNo=" + questionNo + ", memebrNo=" + memebrNo + ", answerComment=" + answerComment
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
}
