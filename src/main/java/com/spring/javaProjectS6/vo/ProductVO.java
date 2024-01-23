package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class ProductVO {
	private String majorCatCode;
	private String majorCatName;
	private String subCatCode;
	private String subCatName;
	
	private int prodIdx;
	private String prodCode;
	private String prodName;
	private String prodBrandName;
	private String prodPrice;
	private String prodFSName;
	private String prodContent;

	private int opIdx;
	private int opProdIdx;
	private String opName;
	private int opPrice;

}
