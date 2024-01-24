package com.spring.javaProjectS6.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS6.vo.CartVO;
import com.spring.javaProjectS6.vo.ProductVO;

public interface StoreDAO {

	public ProductVO getMajorCategorySearch(@Param("majorCatCode") String majorCatCode);

	public List<ProductVO> getSubCategorySearch();

	public List<ProductVO> getProductList(@Param("part") String part);

	public ProductVO getProductSearch(@Param("prodIdx") int prodIdx);

	public List<ProductVO> getProdOptionSearch(@Param("prodIdx") int prodIdx);

	public List<CartVO> getCartList(@Param("mid") String mid);




}
