package com.kh.goty.review.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Review {

	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private Date createDate;
	private String Status;
	private int img_no;
	private String imgName;
	private String imgPath;
	
}
