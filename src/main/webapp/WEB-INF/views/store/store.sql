show tables;

/* 대분류 */
create table majorCategory (
	majorCatCode char(2) not null,			-- 대분류 코드
	majorCatName varchar(20) not null,	-- 대분류명
	primary key (majorCatCode),
	unique key (majorCatName)
);

/* 소분류 */
create table subCategory (
	majorCatCode char(1) not null,			-- 대분류 코드 (외래키) 
	subCatCode 	 char(3) not null,			-- 소분류 코드
	subCatName 	 varchar(20) not null,	-- 소분류명
	primary key	(subCatCode),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	unique key (subCatName)
);

/* 상품 테이블 */
create table product (
	prdIdx 				int not null,
	majorCatCode 	char(1) not null,
	subCatCode 		char(3) not null,
	prdCode 			varchar(20) not null,
	prdName 			varchar(50) not null,
	prdBrandName 	varchar(50) not null,
	prdPrice 			int not null,
	prdFSName 		varchar(200) not null,
	prdContent 		text not null,
	primary key (prdIdx),
	unique key (prdCode, prdName),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	foreign key (subCatCode) references subCategory(subCatCode)
);

/* 상품 옵션 */
create table prdOption (
	opIdx 	int not null auto_increment,
	prdIdx 	int not null,
	opName 	varchar(50) not null,
	opPrice int not null default 0,
	primary key (opIdx),
	foreign key (prdIdx) references product(prdIdx)
);

/* 장바구니 */
create table storeCart(
  cIdx   			 int not null auto_increment,			/* 장바구니 고유번호 */
  mid    			 varchar(20) not null,						/* 장바구니를 사용한 회원의 아이디 */
  prodIdx  		 int not null,										/* 장바구니에 담은 상품의 고유번호 */
  opIdx	  	 	 int not null,										/* 옵션의 고유번호 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  quantity 	   int not null,										/* 구매수량 리스트(배열처리) */
  opTotalPrice int not null,										/* 구매한 모든 항목(상품과 옵션포함)에 따른 총 가격 */
  cartDate 		 datetime default now(),					/* 장바구니에 상품을 담은 날짜 */
  primary key(cIdx),
  foreign key(prodIdx) references product(prodIdx) on update cascade on delete cascade,
  foreign key(opIdx) references prodOption(opIdx) on update cascade on delete cascade
);

/* 주문하기 */
create table storeOrder (
  oIdx   				int not null auto_increment,			/* 고유번호 */
  orderIdx   		varchar(15) not null,							/* 주문 고유번호(새로 만들어준다.) */
  orderDate  	  datetime default now(),						/* 실제 주문을 한 날짜 */
  mid   				varchar(20) not null,							/* 주문자 아이디 */
  dIdx					int not null,											/* 배송 고유번호 */
  prodIdx  			int not null,											/* 주문하는 상품의 고유번호 */
  opIdx  				int not null,											/* 주문하는 상품의 옵션의 고유번호 */
  quantity 			int not null,											/* 주문 수량 */
  opTotalPrice	int not null,											/* 주문 수량을 반영한 옵션의 가격 */
  totalPrice 	  int not null,											/* 주문하는 상품들의 총 가격 */
	payPrice			int not null,											/* 실제 지불한 금액 */
	usedPoint			int not null default 0,						/* 사용한 포인트 */
  payment				varchar(10) not null,							/* 결제 방법 */
	orderStatus		varchar(20) not null default '결제완료',		/* 주문 진행 상태 */
  primary key(oIdx),
  foreign key(mid) references membership(mid),
  foreign key(prodIdx) references product(prodIdx) on update cascade on delete restrict
);
drop table delivery;

/* 배송테이블 */
create table delivery (
  dIdx     			int not null auto_increment,
  orderIdx    	varchar(15) not null,   							/* 주문 고유번호 */
  mid        	  varchar(20) not null,   							/* 주문자 회원 아이디 */
  name					varchar(20) not null,   							/* 받는사람 이름 */
  tel						varchar(15) not null,									/* 받는사람 전화번호 */
  postcode			varchar(10) not null,									/* 받는사람 전화번호 */
  address    	 	varchar(100) not null,  							/* 배송지 (우편번호)주소 */
  delivMsg     	varchar(100),													/* 배송시 요청사항 */
  delivStatus 	varchar(10) not null default '배송전', /* 배송순서(배송전->배송중->배송완료) */
  delivCode     varchar(20) not null default '없음',		/* 운송번호 */
  delivDate 		varchar(10) default '배송미완료', 				/* 배송날짜(배송미완료->배송완료일) */
  primary key(dIdx)
);

--create table storeCart(
--  cIdx   int not null auto_increment,			/* 장바구니 고유번호 */
--  mid    varchar(20) not null,						/* 장바구니를 사용한 회원의 아이디 */
--  prodIdx  int not null,									/* 장바구니에 담은 상품의 고유번호 */
--  prodName	varchar(50) not null,					/* 장바구니에 담은 구입한 상품명 */
--  prodPrice   int not null,								/* 상품의 기본 가격 */
--  prodThumbnail	varchar(250) not null,		/* 서버에 저장된 상품의 메인 이미지 */
--  opIdx	  int not null,										/* 옵션의 고유번호 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
--  opName  varchar(100) not null,					/* 옵션명 리스트(배열처리) */
--  opPrice int not null,										/* 옵션가격 리스트(배열처리) */
--  quantity 	int not null,									/* 구매수량 리스트(배열처리) */
--  totalPrice  int not null,								/* 구매한 모든 항목(상품과 옵션포함)에 따른 총 가격 */
--  cartDate datetime default now(),				/* 장바구니에 상품을 담은 날짜 */
--  primary key(cIdx),
--  foreign key(prodIdx) references product(prodIdx) on update cascade on delete cascade,
--  foreign key(opIdx) references prodOption(opIdx) on update cascade on delete cascade
--);


drop table storeCartt;
insert into majorCategory values ("A1","스킨/토너");
insert into subCategory values ("A1","A01","바이오힐보");
insert into product values (default,"A","A01","A1A011","상품1",10000,"sample","sample");
insert into prdOption values (default,1,"옵션1",10000);

insert into majorCategory values ("B1","클렌징폼");
insert into subCategory values ("B1","B01","바이오힐보");
insert into product values (default,"A","002","A0022","상품2",12000,"sample","sample");
insert into product values (default,"A","002","A0033","상품3",13000,"sample","sample");

select * from product where prdIdx = 1;
select prd.*, sub.subCatName from product prd, subCategory sub where prdIdx=1 and prd.subCatCode = sub.subCatCode;

DELETE FROM prdOption JOIN product p ON p.pIdx = prdOption.pIdx WHERE p.majorCatCode = #{vo.majorCatCode} and p.subCatCode = #{vo.subCatCode};

DELETE prdOption FROM prdOption JOIN product p ON p.prdIdx = prdOption.prdIdx WHERE p.majorCatCode = "A" and p.subCatCode = "001";
SELECT * FROM prdOption JOIN product AS p ON p.prdIdx = prdOption.prdIdx WHERE p.majorCatCode = "A" and p.subCatCode = "001";

delete from product where majorCatCode = #{vo.majorCatCode} and subCatCode = #{vo.subCatCode};
delete from subCategory where majorCatCode = #{vo.majorCatCode} and subCatCode = #{vo.subCatCode} and subCatName = #{vo.subCatName};
delete from majorCategory where majorCatCode = #{vo.majorCatCode} and majorCatName = #{vo.majorCatName};

alter table product add column brandName varchar(50) not null;

drop table majorCategory;
drop table middleCategory;
drop table subCategory;
drop table product;
drop table prdOption;

/* 중분류를.. 안 해
create table subCategory (
	majorCatCode char(1) not null,			-- 대분류 코드 (외래키)
	middleCatCode char(2) not null,			-- 중분류 코드 (외래키)
	subCatCode char(3) not null,				-- 소분류 코드
	subCatName varchar(20) not null,		-- 소분류명
	primary key (subCatCode),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	foreign key (middleCatCode) references middleCategory(middleCatCode)
);
*/

