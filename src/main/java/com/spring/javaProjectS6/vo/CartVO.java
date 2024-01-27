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
	private String opTotalPriceArr; //0127추가
	private int opTotalPrice; //0127추가
	private int quantity;
	private String quantityArr;
	//private int totalPrice; 옵션*수량이 필요하지 총 가격은 매번 변하기 때문에 필요X
	private String cartDate;
}
