package com.spring.javaProjectS6.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int mIdx;
	private String mid;
	private String pwd;
	private String name;
	private String address;
	private String tel;
	private String email;
	private int level;
	private int point;
	private String startDate;
	private String lastDate;
	private int agree;
	
	private int deleteDiff; //(오늘날짜 - 최종접속일)
}
