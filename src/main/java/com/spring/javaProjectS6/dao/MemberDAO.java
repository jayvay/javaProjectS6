package com.spring.javaProjectS6.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS6.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemberIdSearch(@Param("mid") String mid);

	public int setMemberJoin(@Param("vo") MemberVO vo);

}
