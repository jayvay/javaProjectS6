package com.spring.javaProjectS.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS6.dao.MemberDAO;
import com.spring.javaProjectS6.dao.StoreDAO;


@Service
public class PageProcess {

	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	StoreDAO storeDAO;
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		String search = "";
		
//		if(section.equals("board")) {
//			if(part.equals(""))	totRecCnt = boardDao.totRecCnt();
//			else {
//				search = part;
//				totRecCnt = boardDao.totRecCntSearch(search, searchString);
//			}
//		}
//		else if(section.equals("pds")) totRecCnt = pdsDAO.totRecCnt(part);
//		else if(section.equals("member"))	totRecCnt = memberDAO.totRecCnt(searchString);
		if(section.equals("myOrder")) {
			String mid = part;
			totRecCnt = storeDAO.totRecCnt(mid);
		}
		else if(section.equals("myOrderStatus")) {
			String mid = part;
			String[] searchStringArr = searchString.split("@");
			//totRecCnt = storeDAO.totRecCntMyOrderStatus(mid,searchStringArr[0],searchStringArr[1],searchStringArr[2]);
		}
//		else if(section.equals("adminDbOrderProcess")) {
//			String[] searchStringArr = searchString.split("@");
//			totRecCnt = storeDAO.totRecCntAdminStatus(searchStringArr[0],searchStringArr[1],searchStringArr[2]);
//		}
//		else if(section.equals("qna")) totRecCnt = qnaDAO.totRecCnt();
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1 ;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setCurBlock(curBlock);
		pageVO.setLastBlock(lastBlock);
		pageVO.setPart(part);
		pageVO.setSearch(search);
		pageVO.setSearchString(searchString);
		
		return pageVO;
	}
}
