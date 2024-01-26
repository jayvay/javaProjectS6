package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cIdx;
	private String mid;
	private int prodIdx;
	private String prodName;
	private int prodPrice;
	private String prodFSName;
	private String opIdxArr;
	private int opIdx;
	private String opName;
	private int opPrice;
	private int quantity;
	private String quantityArr;
	private int totalPrice;
	private String totalPriceArr;
	private String cartDate;
}
