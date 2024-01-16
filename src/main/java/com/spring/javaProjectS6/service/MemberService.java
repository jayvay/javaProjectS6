package com.spring.javaProjectS6.service;

import com.spring.javaProjectS6.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemberIdSearch(String mid);

	public int setMemberJoin(MemberVO vo);

}
