show tables;

/* 대분류 */
create table majorCategory (
	majorCatCode char(1) not null,			-- 대분류 코드
	majorCatName varchar(20) not null,	-- 대분류명
	primary key (majorCatCode),
	unique key (majorCatName)
);

/* 중분류 */
create table middleCategory (
	majorCatCode char(1) not null,			-- 대분류 코드 (외래키) 
	middleCatCode char(2) not null,			-- 중분류 코드
	middleCatName varchar(20) not null,	-- 중분류명
	primary key	(middleCatCode),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	unique key (middleCatName)
);

/* 소분류 */
create table subCategory (
	majorCatCode char(1) not null,			-- 대분류 코드 (외래키)
	middleCatCode char(2) not null,			-- 중분류 코드 (외래키)
	subCatCode char(3) not null,				-- 소분류 코드
	subCatName varchar(20) not null,		-- 소분류명
	primary key (subCatCode),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	foreign key (middleCatCode) references middleCategory(middleCatCode)
);

/* 상품 테이블 */
create table product (
 prdIdx int not null auto_increment,
 majorCatCode char(1) not null,
 middleCatCode char(2) not null,
 subCatCode char(3) not null,
 prdCode varchar(20) not null,
 prdName varchar(50) not null,
 prdPrice int not null,
 prdFSName varchar(200) not null,
 prdContent text not null,
 primary key (prdIdx),
 unique key (prdCode, prdName),
 foreign key (majorCatCode) references majorCategory(majorCatCode),
 foreign key (middleCatCode) references middleCategory(middleCatCode),
 foreign key (subCatCode) references subCategory(subCatCode)
);

/* 상품 옵션 */
create table prdOption (
	opIdx int not null auto_increment,
	opPrdIdx int not null,
	opName varchar(50) not null,
	opPrice int not null default 0,
	primary key (opIdx),
	foreign key (opPrdIdx) references product(prdIdx)
);

drop table product;
insert into majorCategory values ("A","스킨케어");
insert into middleCategory values ("A","01","스킨/토너");
insert into subCategory values ("A","01","001","피지오겔");
insert into product values (default,"A","01","001","A01001","상품1",10000,"sample","sample");
insert into prdOption values (default,1,"옵션1",10000);

insert into subCategory values ("A","01","002","바이오힐보");
insert into product values (default,"A","01","002","A01002","상품2",12000,"sample","sample");
insert into product values (default,"A","01","002","A01003","상품3",13000,"sample","sample");

select * from product where prdIdx = 1;
select prd.*, sub.subCatName from product prd, subCategory sub where prdIdx=1 and prd.subCatCode = sub.subCatCode;






