package com.kh.goty.item.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class Purchase {

	private int purchaseNo;
	private int usePoint;
	private int addPoint;
	private int totalPrice;
	
	private int memberNo;
	private String memberName;
	
	private String status;
	private Date purchaseDate;

}
