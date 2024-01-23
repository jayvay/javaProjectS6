package com.spring.javaProjectS6.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

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
	public List<ProductVO> getUnderCatSearch(String majorCatCode, String subCatCode) {
		return adminStoreDAO.getUnderCatSearch(majorCatCode, subCatCode);
	}

	@Override
	public int setProductInput(MultipartFile file, ProductVO vo) {
		int res = 0;
		
		try {
			//메인이미지
			String originalFileName = file.getOriginalFilename();
			if(originalFileName != null && originalFileName != "") {
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
				String serverFileName = sdf.format(date) + "_" + originalFileName;
				
				//이미지를 서버 파일 시스템에 업로드 하는 메소드 호출
				writeFile(file, serverFileName, "product");
				vo.setProdFSName(serverFileName);
			}
			else {
				return res;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//상세이미지
		String prodContent = vo.getProdContent();
		if(prodContent.indexOf("src=\"/") == -1) return 0;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/store/");
		
		int position = 31;
		String nextDetailImgFile = prodContent.substring(prodContent.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String detailImgFileName = nextDetailImgFile.substring(0, nextDetailImgFile.indexOf("\""));
			String copyFilePath = "";
			String originalFilePath = uploadPath + detailImgFileName;
			
			copyFilePath = uploadPath + "product/" + detailImgFileName;
			
			copyFileCheck(originalFilePath, copyFilePath);
			
			if(nextDetailImgFile.indexOf("src=\"/") == -1) sw = false;
			else nextDetailImgFile = nextDetailImgFile.substring(nextDetailImgFile.indexOf("src=\"/") + position);
		}
		
		vo.setProdContent(vo.getProdContent().replace("/data/store/", "/data/store/product/"));
		
		int maxIdx = 1;
		ProductVO maxVO = adminStoreDAO.getProductMaxIdx();
		if(maxVO != null) maxIdx = maxVO.getProdIdx() + 1;
		
		vo.setProdIdx(maxIdx);
		vo.setProdCode(vo.getMajorCatCode() + vo.getSubCatCode() + maxIdx);
		//상품 등록
		res = adminStoreDAO.setProductInput(vo);
		
		return res;
	}
	
	//메인이미지 서버에 저장
	private void writeFile(MultipartFile fileName, String serverFileName, String flag) throws IOException {
		byte[] bytes = fileName.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String serverSavePath = "";
		if(flag.equals("product")) serverSavePath = request.getSession().getServletContext().getRealPath("/resources/data/store/product/");
		
		FileOutputStream fos = new FileOutputStream(serverSavePath + serverFileName);
		fos.write(bytes);
		fos.close();
	}
	
	//서버에 저장된 상세이미지 복사해서 product 서버 폴더에 저장하기 위해서 복사된 이미지가 있는지 확인
	private void copyFileCheck(String originalFilePath, String copyFilePath) {
		File originalFile = new File(originalFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream fis = new FileInputStream(originalFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int cnt = 0;
			while((cnt = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, cnt);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProductVO getProductInfo(String prodName) {
		return adminStoreDAO.getProductInfo(prodName);
	}

	@Override
	public List<ProductVO> getOptionList(int prodIdx) {
		return adminStoreDAO.getOptionList(prodIdx);
	}

	@Override
	public int getOptionSearch(int prodIdx, String opName) {
		return adminStoreDAO.getOptionSearch(prodIdx, opName);
	}

	@Override
	public int setOptionInput(ProductVO vo) {
		return adminStoreDAO.setOptionInput(vo);
	}

	@Override
	public int setOptionDelete(int opIdx) {
		return adminStoreDAO.setOptionDelete(opIdx);
	}
}
