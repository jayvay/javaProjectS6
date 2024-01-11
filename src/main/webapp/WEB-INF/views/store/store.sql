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
	majorCatCode char(1) not null,
	middleCatCode char(2) not null,
	subCatCode char(3) not null,
	subCatName varchar(20) not null,
	primary key (subCatCode),
	foreign key (majorCatCode) references majorCategory(majorCatCode),
	foreign key (middleCatCode) references middleCategory(middleCatCode),
);

/* 상품 테이블 */
create table product (
 idx int not null ,
 majorCatCode char(1) not null,
 middleCatCode char(2) not null,
 subCatCode char(3) not null,
 productCode varchar(20) not null,
 productName varchar(50) not null,
 productPrice int not null,
 
 
);