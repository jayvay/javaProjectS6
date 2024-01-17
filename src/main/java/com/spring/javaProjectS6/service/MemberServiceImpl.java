package com.spring.javaProjectS6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS6.dao.MemberDAO;
import com.spring.javaProjectS6.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemberIdSearch(String mid) {
		return memberDAO.getMemberIdSearch(mid);
	}

	@Override
	public int setMemberJoin(MemberVO vo) {
		return memberDAO.setMemberJoin(vo);
	}

	@Override
	public List<String> getMemberIdListSearch(String name, String email) {
		return memberDAO.getMemberIdListSearch(name, email);
	}

	@Override
	public void setMemberPwdFindUpdate(String mid, String tempPwd) {
		memberDAO.setMemberPwdFindUpdate(mid, tempPwd);
		
	}
}
 