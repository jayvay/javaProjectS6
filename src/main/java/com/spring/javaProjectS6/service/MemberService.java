package com.spring.javaProjectS6.service;

import java.util.List;

import com.spring.javaProjectS6.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemberIdSearch(String mid);

	public int setMemberJoin(MemberVO vo);

	public List<String> getMemberIdListSearch(String name, String email);

	public void setMemberPwdFindUpdate(String mid, String tempPwd);

}
