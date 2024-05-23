package com.kh.goty.board.model.vo;

import java.sql.Date;
import java.util.List;

public class Board {
	
	private int freeBoardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private String memberName;
	private String nickname;
	private int memberNo;
	private String platformName;
	private String platformNo;
	private String originName;
	private String changeName;
	private String imagePath;
	private List<Reply> replies;
	
	private int count;
	private int reviewCount;
	
	public Board() {
		super();
	}

	public Board(int freeBoardNo, String boardTitle, String boardContent, Date createDate, String memberName,
			String nickname, int memberNo, String platformName, String platformNo, String originName, String changeName,
			String imagePath, List<Reply> replies, int count, int reviewCount) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.memberName = memberName;
		this.nickname = nickname;
		this.memberNo = memberNo;
		this.platformName = platformName;
		this.platformNo = platformNo;
		this.originName = originName;
		this.changeName = changeName;
		this.imagePath = imagePath;
		this.replies = replies;
		this.count = count;
		this.reviewCount = reviewCount;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	public String getPlatformNo() {
		return platformNo;
	}

	public void setPlatformNo(String platformNo) {
		this.platformNo = platformNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public int getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public String getPlatformName() {
		return platformName;
	}

	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChageName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "Board [freeBoardNo=" + freeBoardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", memberName=" + memberName + ", nickname=" + nickname + ", memberNo="
				+ memberNo + ", platformName=" + platformName + ", platformNo=" + platformNo + ", originName="
				+ originName + ", changeName=" + changeName + ", imagePath=" + imagePath + ", replies=" + replies
				+ ", count=" + count + ", reviewCount=" + reviewCount + "]";
	}

}
