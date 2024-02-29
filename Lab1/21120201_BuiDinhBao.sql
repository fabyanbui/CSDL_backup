CREATE DATABASE QLDETAI
GO
USE QLDETAI

CREATE TABLE GIAOVIEN (
	macb char(5) constraint PK_BOMON primary key,
	hoten nvarchar(100) not null,
	phai nchar(3) check (phai in ('Nam',N'Nữ')),
	ngsinh datetime,
	makhoa char(5)
)

ALTER TABLE GIAOVIEN add
	constraint FK_GV_K foreign key(makhoa)
	references KHOA(makhoa)

CREATE TABLE KHOA (
	makhoa char(5) constraint PK_KHOA primary key,
	tenkhoa nchar(20) not null unique,
	trkhoa char(5),
	namtl int default(2000)
)

ALTER TABLE KHOA add
	constraint FK_K_GV foreign key(trkhoa)
	references GIAOVIEN(macb)

CREATE TABLE DEAN (
	mada char(5),
	STT int,
	makhoa char(5),
	truongda char(5),
	kinhphi float check(kinhphi between 100 and 200),
	constraint PK_DEAN primary key (mada, STT, makhoa)
)

ALTER TABLE DEAN add 
	constraint FK_DA_BM foreign key(STT, makhoa)
	references BOMON(STT, makhoa)

CREATE TABLE BOMON (
	STT int,
	makhoa char(5),
	tenbm nvarchar(20),
	trbm char(5),
	primary key (STT, makhoa)
)

ALTER TABLE BOMON add
	constraint FK_BM_GV foreign key(trbm)
	references GIAOVIEN(macb)

INSERT INTO KHOA(makhoa, tenkhoa)
	values('K001','CNTT')

INSERT INTO KHOA
	values('K001','CNTT', null, null)
INSERT INTO GIAOVIEN 
	values('GV001','BUI DINH BAO','Nam',22/3/2003,'K001')
UPDATE KHOA set trkhoa='GV001' where makhoa ='K001'

INSERT INTO BOMON
	values(1, 'K001', 'CSDL', 'GV001')
INSERT INTO DEAN
	values('0001', 1, 'K001', 'GV001', 150)





