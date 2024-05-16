package com.kh.goty.member.model.vo;

public class KakaoMember {
	private int memberNo;
	private String kakaoId;
	private String nickName;
	private String thumbnailImage;
	private String accessToken;
	
	private String status;
	private String memLevel;
	
	public KakaoMember() {
		super();
	}
	
	public KakaoMember(int memberNo, String kakaoId, String nickName, String thumbnailImage, String accessToken,
			String status, String memLevel) {
		super();
		this.memberNo = memberNo;
		this.kakaoId = kakaoId;
		this.nickName = nickName;
		this.thumbnailImage = thumbnailImage;
		this.accessToken = accessToken;
		this.status = status;
		this.memLevel = memLevel;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getThumbnailImage() {
		return thumbnailImage;
	}
	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
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
		return "KakaoMember [memberNo=" + memberNo + ", kakaoId=" + kakaoId + ", nickName=" + nickName
				+ ", thumbnailImage=" + thumbnailImage + ", accessToken=" + accessToken + ", status=" + status
				+ ", memLevel=" + memLevel + "]";
	}
	
}
