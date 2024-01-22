package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class ProductVO {
	private String majorCatCode;
	private String majorCatName;
	private String subCatCode;
	private String subCatName;
	
	private int prdIdx;
	private String prdCode;
	private String prdName;
	private String prdBrandName;
	private String prdPrice;
	private String prdFSName;
	private String prdContent;

	private int opIdx;
	private int opPrdIdx;
	private String opName;
	private String opPrice;

}
