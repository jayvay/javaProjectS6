package com.spring.javaProjectS6.dao;

import java.util.List;

import com.spring.javaProjectS6.vo.ProductVO;

public interface AdminStoreDAO {

	public List<ProductVO> getMajorCategory();

	public List<ProductVO> getSubCategory();

}
