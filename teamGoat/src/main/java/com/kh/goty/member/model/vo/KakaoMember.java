package com.kh.goty.member.model.vo;

public class KakaoMember {
	private String id;
	private String nickName;
	private String thumbnailImage;
	
	public KakaoMember() {
		super();
	}

	public KakaoMember(String id, String nickName, String thumbnailImage) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.thumbnailImage = thumbnailImage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "KakaoMember [id=" + id + ", nickName=" + nickName + ", thumbnailImage=" + thumbnailImage + "]";
	}


}
