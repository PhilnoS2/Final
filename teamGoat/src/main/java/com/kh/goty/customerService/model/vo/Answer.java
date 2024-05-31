package com.kh.goty.customerService.model.vo;

import java.sql.Date;

public class Answer {

	private int questionNo;
	private int memberNo;
	private String answerComment;
	private Date createDate;
	private String status;
	private String answerWriter;
	
	public Answer() {
		super();
	}

	public Answer(int questionNo, int memberNo, String answerComment, Date createDate, String status,
			String answerWriter) {
		super();
		this.questionNo = questionNo;
		this.memberNo = memberNo;
		this.answerComment = answerComment;
		this.createDate = createDate;
		this.status = status;
		this.answerWriter = answerWriter;
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

	public String getAnswerWriter() {
		return answerWriter;
	}

	public void setAnswerWriter(String answerWriter) {
		this.answerWriter = answerWriter;
	}

	@Override
	public String toString() {
		return "Answer [questionNo=" + questionNo + ", memberNo=" + memberNo + ", answerComment=" + answerComment
				+ ", createDate=" + createDate + ", status=" + status + ", answerWriter=" + answerWriter + "]";
	}

	
}
