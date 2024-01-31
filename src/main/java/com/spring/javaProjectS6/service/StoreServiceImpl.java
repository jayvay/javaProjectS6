package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaProjectS6.dao.StoreDAO;
import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.DeliveryVO;
import com.spring.javaProjectS6.vo.OrderVO;
import com.spring.javaProjectS6.vo.PaymentVO;
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
	public void setCartDelete(int cIdx) {
		storeDAO.setCartDelete(cIdx);
	}

	@Override
	public OrderVO getOrderMaxIdx() {
		return storeDAO.getOrderMaxIdx();
	}

	@Override
	public CartVO getCartIdxSearch(int strCIdx) {
		return storeDAO.getCartIdxSearch(strCIdx);
	}

//	@Override
//	public void setOrderInput(OrderVO orderVO) {
//		storeDAO.setOrderInput(orderVO);
//	}
//	
//	@Override
//	public void setCartDelete(int cIdx) {
//		storeDAO.setCartDelete(cIdx);
//	}
//	@Override
//	public void setDeliveryInput(DeliveryVO deliveryVO) {
//		storeDAO.setDeliveryInput(deliveryVO);
//	}
//	
//	@Override
//	public int getDeliveryIdxSearch(String orderIdx) {
//		return storeDAO.getDeliveryIdxSearch(orderIdx);
//	}
//
//	@Override
//	public void setMemberPointPlus(int savePoint, String mid) {
//		storeDAO.setMemberPointPlus(savePoint, mid);
//	}

	@Transactional
	@Override
	public void setOrderTransaction(DeliveryVO deliveryVO, List<OrderVO> orderVOS, PaymentVO paymentVO) {
		try {
			storeDAO.setDeliveryInput(deliveryVO);
			int dIdx = storeDAO.getDeliveryIdxSearch(orderVOS.get(0).getOrderIdx());
			
			for(OrderVO orderVO : orderVOS) {
				orderVO.setDIdx(dIdx);
				orderVO.setPayment(paymentVO.getPayment());
				System.out.println("orderVO: "+ orderVO);
				storeDAO.setOrderInput(orderVO);
				storeDAO.setCartDelete(orderVO.getCIdx());
			}
			
			storeDAO.setMemberPointPlus((int)(orderVOS.get(0).getTotalPrice() * 0.01), orderVOS.get(0).getMid());
			
		} catch (Exception e) {
			throw new RuntimeException("transactionFailed : " + e.getMessage(), e);
		}
		
	}



	

}
