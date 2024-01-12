package com.spring.javaProjectS6.service;

import java.util.List;

import com.spring.javaProjectS6.vo.ProductVO;

public interface StoreService {

	public ProductVO getProductSearch(int prdIdx);

	public List<ProductVO> getPrdOptionSearch(int prdIdx);

}
