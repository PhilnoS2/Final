package com.kh.goty.member.model.vo;

public class NaverMember {
	private String id;
	private String nickname;
	private String mobile;
	private String name;
	private String birthyear;
	
	public NaverMember() {
		super();
	}

	public NaverMember(String id, String nickname, String mobile, String name, String birthyear) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.mobile = mobile;
		this.name = name;
		this.birthyear = birthyear;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "NaverMember [id=" + id + ", nickname=" + nickname + ", mobile=" + mobile + ", name=" + name
				+ ", birthyear=" + birthyear + "]";
	}
	
}
