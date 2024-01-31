package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class DeliveryVO {
  private int dIdx;
  private String mid;
  private int oIdx;
  private String orderIdx;
  private String name;
  private String tel;
  private String postcode;
  private String address;
  
  private String delivMsg;
  private String delivCode;
  private String delivStatus;
  private String delivDate;
  
  // 아래는 주문테이블에서 사용된 필드리스트이다.
	private int prodIdx;
	private String orderDate;
	private String prodName;
	private int prodPrice;
	private String prodFSName;
	private String opName;
	private String opPrice;
	private String quantity;
	private int totalPrice;
	private int payPrice;
}
