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
	subCatCode char(3) not null,			-- 소분류 코드
	subCatName varchar(20) not null,	-- 소분류명
	primary key	(subCatCode),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	unique key (subCatName)
);

/* 상품 테이블 */
create table product (
	prdIdx int not null,
	majorCatCode char(1) not null,
	subCatCode char(3) not null,
	prdCode varchar(20) not null,
	prdName varchar(50) not null,
	prdBrandName varchar(50) not null,
	prdPrice int not null,
	prdFSName varchar(200) not null,
	prdContent text not null,
	primary key (prdIdx),
	unique key (prdCode, prdName),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	foreign key (subCatCode) references subCategory(subCatCode)
);

/* 상품 옵션 */
create table prdOption (
	opIdx int not null auto_increment,
	prdIdx int not null,
	opName varchar(50) not null,
	opPrice int not null default 0,
	primary key (opIdx),
	foreign key (prdIdx) references product(prdIdx)
);

/* 장바구니 */
create table storeCart(
  cIdx   int not null auto_increment,			/* 장바구니 고유번호 */
  mid    varchar(20) not null,						/* 장바구니를 사용한 회원의 아이디 */
  prdIdx  int not null,										/* 장바구니에 담은 상품의 고유번호 */
  prdName	varchar(50) not null,						/* 장바구니에 담은 구입한 상품명 */
  prdPrice   int not null,								/* 상품의 기본 가격 */
  prdThumbnail	varchar(250) not null,		/* 서버에 저장된 상품의 메인 이미지 */
  opIdx	  int not null,					/* 옵션의 고유번호 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  opName  varchar(100) not null,					/* 옵션명 리스트(배열처리) */
  opPrice int not null,					/* 옵션가격 리스트(배열처리) */
  quantity 	int not null,				/* 구매수량 리스트(배열처리) */
  totalPrice  int not null,								/* 구매한 모든 항목(상품과 옵션포함)에 따른 총 가격 */
  cartDate datetime default now(),				/* 장바구니에 상품을 담은 날짜 */
  primary key(cIdx),
  foreign key(prdIdx) references product(prdIdx) on update cascade on delete cascade,
  foreign key(opIdx) references prdOption(opIdx) on update cascade on delete cascade
);




drop table product;
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
