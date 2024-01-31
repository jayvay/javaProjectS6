package com.spring.javaProjectS6.service;

import java.util.List;

import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.DeliveryVO;
import com.spring.javaProjectS6.vo.OrderVO;
import com.spring.javaProjectS6.vo.PaymentVO;
import com.spring.javaProjectS6.vo.ProductVO;

public interface StoreService {

	public ProductVO getMajorCategorySearch(String majorCatCode);

	public List<ProductVO> getSubCategorySearch();

	public List<ProductVO> getProductList(String part);

	public ProductVO getProductSearch(int prodIdx);

	public List<ProductVO> getProdOptionSearch(int prodIdx);

	public List<CartVO> getCartList(String mid);

	public List<CartVO> getCartSearch(int prodIdx, int opIdx, String mid);

	public int setCartUpdate(CartVO cartVO);

	public int setCartInput(CartVO cartVO);

	public void setCartDelete(int cIdx);

	public OrderVO getOrderMaxIdx();

	public CartVO getCartIdxSearch(int strCIdx);

	public void setOrderTransaction(DeliveryVO deliveryVO, List<OrderVO> orderVOS, PaymentVO paymentVO);


//	public void setOrderInput(OrderVO orderVO);
//
//	public void setCartDelete(int cIdx);
//
//	public void setDeliveryInput(DeliveryVO deliveryVO);
//
//	public int getDeliveryIdxSearch(String orderIdx);
//
//	public void setMemberPointPlus(int savePoint, String mid);




}
