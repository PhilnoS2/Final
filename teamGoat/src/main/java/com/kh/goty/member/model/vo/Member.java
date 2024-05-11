package com.kh.goty.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private String email;
	private String bornDate;
	private String phone;
	private String address;
	private String addrDetail;
	
	private String deleteYN;
	private String memberPoint;
	private Date enrollDate;
	private Date modifyDate;
	private String memLevel;
	private String emptyCodeYn;
	private int totalPrice;
	
	public Member() {
		super();
	}
	
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String nickname, String email,
			String bornDate, String phone, String address, String addrDetail, String deleteYN, String memberPoint,
			Date enrollDate, Date modifyDate, String memLevel, String emptyCodeYn, int totalPrice) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickname = nickname;
		this.email = email;
		this.bornDate = bornDate;
		this.phone = phone;
		this.address = address;
		this.addrDetail = addrDetail;
		this.deleteYN = deleteYN;
		this.memberPoint = memberPoint;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.memLevel = memLevel;
		this.emptyCodeYn = emptyCodeYn;
		this.totalPrice = totalPrice;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBornDate() {
		return bornDate;
	}

	public void setBornDate(String bornDate) {
		this.bornDate = bornDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	public String getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(String memberPoint) {
		this.memberPoint = memberPoint;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}

	public String getEmptyCodeYn() {
		return emptyCodeYn;
	}

	public void setEmptyCodeYn(String emptyCodeYN) {
		this.emptyCodeYn = emptyCodeYN;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", nickname=" + nickname + ", email=" + email + ", bornDate=" + bornDate + ", phone="
				+ phone + ", address=" + address + ", addrDetail=" + addrDetail + ", deleteYN=" + deleteYN
				+ ", memberPoint=" + memberPoint + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", memLevel=" + memLevel + ", emptyCodeYN=" + emptyCodeYn + ", totalPrice=" + totalPrice + "]";
	}
	
}
