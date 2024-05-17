package com.kh.goty.customerService.model.vo;

import java.sql.Date;

public class Faq {
	
	private int faqNo;
	private int memberNo;
	private int categoryNo;
	private String faqQuestion;
	private String faqAnswer;
	private Date createDate;
	
	public Faq() {
		super();
	}

	public Faq(int faqNo, int memberNo, int categoryNo, String faqQuestion, String faqAnswer, Date createDate) {
		super();
		this.faqNo = faqNo;
		this.memberNo = memberNo;
		this.categoryNo = categoryNo;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
		this.createDate = createDate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
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

	public String getFaqQuestion() {
		return faqQuestion;
	}

	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}

	public String getFaqAnswer() {
		return faqAnswer;
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", memberNo=" + memberNo + ", categoryNo=" + categoryNo + ", faqQuestion="
				+ faqQuestion + ", faqAnswer=" + faqAnswer + ", createDate=" + createDate + "]";
	}
}
