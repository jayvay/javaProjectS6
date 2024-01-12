package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS6.dao.StoreDAO;
import com.spring.javaProjectS6.vo.ProductVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;

	@Override
	public ProductVO getProductSearch(int prdIdx) {
		return storeDAO.getProductSearch(prdIdx);
	}

	@Override
	public List<ProductVO> getPrdOptionSearch(int prdIdx) {
		return storeDAO.getPrdOptionSearch(prdIdx);
	}
}
