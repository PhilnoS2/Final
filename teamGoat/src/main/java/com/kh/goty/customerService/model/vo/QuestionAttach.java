package com.kh.goty.customerService.model.vo;

public class QuestionAttach {

	
	private int questionAttachNo;
	private int questionNo;
	private String questionAttachPath;
	
	public QuestionAttach() {
		super();
	}
	
	public QuestionAttach(int questionAttachNo, int questionNo, String questionAttachPath) {
		super();
		this.questionAttachNo = questionAttachNo;
		this.questionNo = questionNo;
		this.questionAttachPath = questionAttachPath;
	}
	public int getQuestionAttachNo() {
		return questionAttachNo;
	}
	public void setQuestionAttachNo(int questionAttachNo) {
		this.questionAttachNo = questionAttachNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionAttachPath() {
		return questionAttachPath;
	}
	public void setQuestionAttachPath(String questionAttachPath) {
		this.questionAttachPath = questionAttachPath;
	}
	
	@Override
	public String toString() {
		return "QuestionAttach [questionAttachNo=" + questionAttachNo + ", questionNo=" + questionNo
				+ ", questionAttachPath=" + questionAttachPath + "]";
	}
}
