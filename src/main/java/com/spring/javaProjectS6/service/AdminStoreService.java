package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaProjectS6.vo.ProductVO;

public interface AdminStoreService {

	public List<ProductVO> getMajorCategory();

	public List<ProductVO> getSubCategory();
/*
	public ProductVO getMajorCatSearch(String majorCatCode, String majorCatName);

	public int setMajorCatInput(String majorCatCode, String majorCatName);

	public ProductVO getSubCatSearch(ProductVO vo);

	public int setSubCatInput(ProductVO vo);
*/
	public ProductVO getCategorySearch(String category, ProductVO vo);

	public int setCategoryInput(String category, ProductVO vo);

	public int setCategoryDelete(String category, ProductVO vo);

	public List<ProductVO> getUnderCatSearch(String majorCatCode);

	public int setProductInput(MultipartFile file, ProductVO vo);

}
