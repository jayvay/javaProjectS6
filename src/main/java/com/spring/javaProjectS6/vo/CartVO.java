package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cIdx;
	private String mid;
	private int prodIdx;
	private String prodName;
	private int prodPrice;
	private String prodThumbnail;
	private int opIdx;
	private String opName;
	private int opPrice;
	private int quantity;
	private int totalPrice;
	private String cartDate;
}
