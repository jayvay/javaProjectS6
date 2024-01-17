package com.spring.javaProjectS6.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS6.vo.MemberVO;

public interface MemberDAO {

	public MemberVO getMemberIdSearch(@Param("mid") String mid);

	public int setMemberJoin(@Param("vo") MemberVO vo);

	public List<String> getMemberIdListSearch(@Param("name") String name, @Param("email") String email);

	public void setMemberPwdFindUpdate(@Param("mid") String mid, @Param("tempPwd") String tempPwd);

}
