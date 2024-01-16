show tables;

create table membership (
	mIdx 			int not null auto_increment,	 /* 회원 고유번호 */
	mid 			varchar(20) not null, 				 /* 회원 아이디(중복제외) */
	pwd			  varchar(100) not null, 				 /* 회원 비밀번호(SHA256 암호화 처리) */
	name 			varchar(20) not null,				   /* 회원 성명 */
	address 	varchar(100),								 	 /* 주소(다음 API 활용) */
	tel 			varchar(15),									 /* 전화번호 : 010-1234-5678 */
	email 		varchar(60) not null,					 /* 이메일(아이디/비밀번호 분실시 사용-형식체크필수) */
	level     int default 1,								 /* 회원 등급 (0:관리자 , 1:준회원, 2:정회원, 3:우수회원 */
	point     int default 1000,						 	 /* 회원 포인트(가입시 1000p, 물건 구매시 100원당 1p 증가) */
	startDate datetime default now(), 			 /* 최초 가입일 */
	lastDate  datetime default now(),				 /* 마지막 접속일 */
	agree			int default 1,								 /* 약관 동의 */
	
	primary key(mIdx),
	unique key(mid)
);