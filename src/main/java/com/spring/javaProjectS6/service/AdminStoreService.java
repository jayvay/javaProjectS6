package com.spring.javaProjectS6.service;

import java.util.List;

import com.spring.javaProjectS6.vo.ProductVO;

public interface AdminStoreService {

	public List<ProductVO> getMajorCategory();

	public List<ProductVO> getSubCategory();

}
