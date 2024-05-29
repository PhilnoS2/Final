package com.kh.goty.item.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Order {

	private int orderNo;
	private String toName;
	private String toContact;
	private String toEmail;
	private String address;
	private String detailAddress;
	private String message;
	
	private int memberNo;
	private String memberName;
	
	private int itemNo;
	private String itemName;
	private String platformName;
	private String imgPath;
	private String imgName;
	private int price;
}
