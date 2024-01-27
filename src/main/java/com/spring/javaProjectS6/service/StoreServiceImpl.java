package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS6.dao.StoreDAO;
import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.OrderVO;
import com.spring.javaProjectS6.vo.ProductVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;
	
	@Override
	public ProductVO getMajorCategorySearch(String majorCatCode) {
		return storeDAO.getMajorCategorySearch(majorCatCode);
	}
	
	@Override
	public List<ProductVO> getSubCategorySearch() {
		return storeDAO.getSubCategorySearch();
	}

	@Override
	public List<ProductVO> getProductList(String part) {
		return storeDAO.getProductList(part);
	}
	
	@Override
	public ProductVO getProductSearch(int prodIdx) {
		return storeDAO.getProductSearch(prodIdx);
	}

	@Override
	public List<ProductVO> getProdOptionSearch(int prodIdx) {
		return storeDAO.getProdOptionSearch(prodIdx);
	}

	@Override
	public List<CartVO> getCartList(String mid) {
		return storeDAO.getCartList(mid);
	}

	@Override
	public List<CartVO> getCartSearch(int prodIdx, int opIdx, String mid) {
		return storeDAO.getCartSearch(prodIdx, opIdx, mid);
	}

	@Override
	public int setCartUpdate(CartVO cartVO) {
		return storeDAO.setCartUpdate(cartVO);
	}

	@Override
	public int setCartInput(CartVO cartVO) {
		return storeDAO.setCartInput(cartVO);
	}

	@Override
	public OrderVO getOrderMaxIdx() {
		return storeDAO.getOrderMaxIdx();
	}

	

}
