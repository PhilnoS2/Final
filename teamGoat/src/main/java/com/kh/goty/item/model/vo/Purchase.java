package com.kh.goty.item.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Purchase {

	private int purchaseNo;
	private int memberNo;
	private int itemNo;
	private String address;
	private String toName;
	private int toContact;
	private String toEmail;
	private String message;
	private int totalPrice;
	private int usedPoint;
	private int addPoint;
	private String refund;
	private Date purchaseDate;
	
}
