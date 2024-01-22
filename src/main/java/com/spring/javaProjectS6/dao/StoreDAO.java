package com.spring.javaProjectS6.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.ProductVO;

public interface StoreDAO {

	public ProductVO getProductSearch(@Param("prdIdx") int prdIdx);

	public List<ProductVO> getPrdOptionSearch(@Param("prdIdx") int prdIdx);

	public List<CartVO> getCartList(@Param("mid") String mid);

}
