package com.kh.goty.member.model.vo;

public class NaverMember {
	private String naverId;
	private String nickname;
	private String mobile;
	private String name;
	private String birthyear;
	
	private String status;
	private String memLevel;
	
	public NaverMember() {
		super();
	}
	
	public NaverMember(String naverId, String nickname, String mobile, String name, String birthyear, String status,
			String memLevel) {
		super();
		this.naverId = naverId;
		this.nickname = nickname;
		this.mobile = mobile;
		this.name = name;
		this.birthyear = birthyear;
		this.status = status;
		this.memLevel = memLevel;
	}
	
	public String getNaverId() {
		return naverId;
	}
	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}
	
	@Override
	public String toString() {
		return "NaverMember [naverId=" + naverId + ", nickname=" + nickname + ", mobile=" + mobile + ", name=" + name
				+ ", birthyear=" + birthyear + ", status=" + status + ", memLevel=" + memLevel + "]";
	}
	
}
