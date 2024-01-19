package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaProjectS6.dao.AdminStoreDAO;
import com.spring.javaProjectS6.vo.ProductVO;

@Service
public class AdminStoreServiceImpl implements AdminStoreService {
	
	@Autowired
	AdminStoreDAO adminStoreDAO;

	@Override
	public List<ProductVO> getMajorCategory() {
		return adminStoreDAO.getMajorCategory();
	}

	@Override
	public List<ProductVO> getSubCategory() {
		return adminStoreDAO.getSubCategory();
	}
/*
	@Override
	public ProductVO getMajorCatSearch(String majorCatCode, String majorCatName) {
		return adminStoreDAO.getMajorCatSearch(majorCatCode, majorCatName);
	}

	@Override
	public int setMajorCatInput(String majorCatCode, String majorCatName) {
		return adminStoreDAO.setMajorCatInput(majorCatCode, majorCatName);
	}

	@Override
	public ProductVO getSubCatSearch(ProductVO vo) {
		return adminStoreDAO.getSubCatSearch(vo);
	}

	@Override
	public int setSubCatInput(ProductVO vo) {
		return adminStoreDAO.setSubCatInput(vo);
	}
*/

	@Override
	public ProductVO getCategorySearch(String category, ProductVO vo) {
		return adminStoreDAO.getCategorySearch(category, vo);
	}

	@Override
	public int setCategoryInput(String category, ProductVO vo) {
		return adminStoreDAO.setCategoryInput(category, vo);
	}

	@Transactional
	@Override
	public int setCategoryDelete(String category, ProductVO vo) {
		return adminStoreDAO.setCategoryDelete(category, vo);
	}

	@Override
	public List<ProductVO> getUnderCatSearch(String majorCatCode) {
		return adminStoreDAO.getUnderCatSearch(majorCatCode);
	}
	
	
}
