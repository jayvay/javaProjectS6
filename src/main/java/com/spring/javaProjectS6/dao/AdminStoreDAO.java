package com.spring.javaProjectS6.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS6.vo.ProductVO;

public interface AdminStoreDAO {

	public List<ProductVO> getMajorCategory();

	public List<ProductVO> getSubCategory();
/*
	public ProductVO getMajorCatSearch(@Param("majorCatCode") String majorCatCode, @Param("majorCatName") String majorCatName);

	public int setMajorCatInput(@Param("majorCatCode") String majorCatCode, @Param("majorCatName") String majorCatName);

	public ProductVO getSubCatSearch(@Param("vo") ProductVO vo);

	public int setSubCatInput(@Param("vo") ProductVO vo);
*/
	public ProductVO getCategorySearch(@Param("category") String category, @Param("vo") ProductVO vo);

	public int setCategoryInput(@Param("category") String category, @Param("vo") ProductVO vo);

	public int setCategoryDelete(@Param("category") String category, @Param("vo") ProductVO vo);

	public List<ProductVO> getUnderCatSearch(@Param("majorCatCode") String majorCatCode, @Param("subCatCode") String subCatCode);

	public ProductVO getProductMaxIdx();

	public int setProductInput(@Param("vo") ProductVO vo);

	public ProductVO getProductInfo(@Param("prodName") String prodName);

	public List<ProductVO> getOptionList(@Param("prodIdx") int prodIdx);

	public int getOptionSearch(@Param("prodIdx") int prodIdx, @Param("opName") String opName);

	public int setOptionInput(@Param("vo") ProductVO vo);

	public int setOptionDelete(@Param("opIdx") int opIdx);


}
