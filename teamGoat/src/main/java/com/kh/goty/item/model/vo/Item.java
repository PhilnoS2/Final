package com.kh.goty.item.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Item {

	private int imgNo;
	private String imgName;
	private String imgPath;
	
	private int itemNo;
	private int itemCategory;
	private int price;
	private String itemName;
	private String developer;
	private String publisher;
	
	private String rating;
	private String genre;

}
