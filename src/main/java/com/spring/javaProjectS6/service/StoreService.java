package com.spring.javaProjectS6.service;

import java.util.List;

import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.ProductVO;

public interface StoreService {

	public ProductVO getMajorCategorySearch(String majorCatCode);

	public List<ProductVO> getSubCategorySearch();

	public List<ProductVO> getProductList(String part);

	public ProductVO getProductSearch(int prodIdx);

	public List<ProductVO> getProdOptionSearch(int prodIdx);

	public List<CartVO> getCartList(String mid);




}
