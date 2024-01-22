package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cIdx;
	private String mid;
	private int prdIdx;
	private String prdName;
	private int prdPrice;
	private String prdThumbnail;
	private int opIdx;
	private String opName;
	private int opPrice;
	private int quantity;
	private int totalPrice;
	private String cartDate;
}
