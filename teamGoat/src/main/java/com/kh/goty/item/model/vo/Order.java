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
	private int memberNo;
	private int itemNo;
	private String toName;
	private String toContact;
	private String toEmail;
	private String address;
	private String detailAddress;
	private String message;

}
