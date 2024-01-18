package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
