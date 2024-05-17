package com.kh.goty.customerService.model.vo;

public class QuestionCategory {

	private int categoryNo;
	private String categoryName;
	
	public QuestionCategory() {
		super();
	}
	
	public QuestionCategory(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "QuestionCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
}
