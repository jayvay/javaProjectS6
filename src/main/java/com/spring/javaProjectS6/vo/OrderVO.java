package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class OrderVO {
  private int oIdx;
  private String orderIdx;
  private String orderDate;
  private String mid;
  private int prodIdx;
  private int opIdx;
  private int quantity;
  private int addrIdx;
  private int opTotalPrice;
  private int totalPrice;
  private int payPrice;
  private int usedPoint;
  private String payment;
  private String orderStatus;
  
  private int cIdx;  // 장바구니 고유번호.
  private int maxIdx;   // 주문번호를 구하기위한 기존 최대 비밀번호필드
  private int baesong;  // 배송비저장필드
}
