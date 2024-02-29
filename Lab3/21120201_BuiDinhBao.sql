use master
if (DB_ID('QLDT') is not null) 
	drop database QLDT
go
create database QLDT
go
use QLDT
go

create table CONGVIEC
(
	madt char(3),
	sott int,
	tencv nvarchar(50),
	ngaybd date,
	ngaykt date,
	primary key (madt, sott)
)
go
create table THAMGIADT
(
	magv char(3),
	madt char(3),
	stt int,
	phucap real,
	ketqua nvarchar(10)
	primary key (magv, madt, stt)
)
go
create table NGUOITHAN
(
	magv char(3),
	ten nvarchar(10),
	ngaysinh date,
	phai nvarchar(3)
	primary key(magv, ten)
)
go
create table KHOA
(
	makhoa varchar(10),
	tenkhoa nvarchar(50),
	namtl char(4),
	phong char(3),
	dienthoai char(10),
	truongkhoa char(3),
	ngaynhamchuc date
	primary key(makhoa)
)
go
create table GIAOVIEN
(
	magv char(3),
	hoten nvarchar(50),
	luong int,
	phai nvarchar(3),
	ngaysinh date,
	diachi nvarchar(100),
	gvqlcm char(3),
	mabm nvarchar(10)
	primary key(magv)
)
go
create table CHUDE
(
	macd nchar(4),
	tencd nvarchar(50)
	primary key(macd)
)
go
create table DETAI
(
	madt char(3),
	tendt nvarchar(50),
	capql nvarchar(10),
	kinhphi real,
	ngaybd date,
	ngaykt date,
	macd nchar(4),
	gvcndt char (3)
	primary key(madt)
)
go 
create table BOMON
(
	mabm nvarchar(10),
	tenbm nvarchar(50),
	phong char(3),
	dienthoai char(10),
	truongbm char(3),
	makhoa varchar(10),
	ngaynhanchuc date
	primary key(mabm)
)
go
create table GV_DT
(
	magv char(3),
	dienthoai char(10)
	primary key(magv, dienthoai)
)
go

alter table GIAOVIEN add foreign key (gvqlcm) references GIAOVIEN(magv)
alter table GIAOVIEN add foreign key (mabm) references BOMON(mabm)
go
alter table BOMON add foreign key (truongbm) references GIAOVIEN(magv)
alter table BOMON add foreign key (makhoa) references KHOA(makhoa)
go
alter table KHOA add foreign key (truongkhoa) references GIAOVIEN(magv)
go
alter table GV_DT add foreign key (magv) references GIAOVIEN(magv)
go
alter table NGUOITHAN add foreign key (magv) references GIAOVIEN(magv)
go
alter table THAMGIADT add foreign key (magv) references GIAOVIEN(magv)
alter table THAMGIADT add foreign key (madt, stt) references CONGVIEC(madt, sott)
go
alter table CONGVIEC add foreign key (madt) references DETAI(madt)
go
alter table DETAI add foreign key (macd) references CHUDE(macd)
alter table DETAI add foreign key (gvcndt) references GIAOVIEN(magv)

go
insert into GIAOVIEN values('001', N'Nguyễn Hoài An', 2000, N'Nam', '02/15/1973', N'25/3 Lạc Long Quân, Q.10, TP HCM', null, null)
insert into GIAOVIEN values('002', N'Trần Trà Hương', 2500, N'Nữ', '06/20/1960', N'125 Trần Hưng Đạo, Q.1, TP HCM', null, null)
insert into GIAOVIEN values('003', N'Nguyễn Ngọc Ánh', 2200, N'Nữ', '05/11/1975', N'12/21 Võ Văn Ngân, Thủ Đức, TP HCM', null, null)
insert into GIAOVIEN values('004', N'Trương Nam Sơn', 2300, N'Nam', '06/20/1959', N'215 Lý Thường Kiệt, TP Biên Hòa', null, null)
insert into GIAOVIEN values('005', N'Lý Hoàng Hà', 2500, N'Nam', '10/23/1954', N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM', null, null)
insert into GIAOVIEN values('006', N'Trần Bạch Tuyết', 1500, N'Nữ', '05/20/1980', N'127 Hùng Vương, TP Mỹ Tho', null, null)
insert into GIAOVIEN values('007', N'Nguyễn Nam Trung', 2100, N'Nam', '06/05/1976', N'234 3/2, TP Biên Hòa', null, null)
insert into GIAOVIEN values('008', N'Trần Trung Hiếu', 1800, N'Nam', '08/06/1977', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', null, null)
insert into GIAOVIEN values('009', N'Trần Hoàng Nam', 2000, N'Nam', '11/22/1975', N'234 Trấn Mão, An Phú, TP HCM', null, null)
insert into GIAOVIEN values('010', N'Phạm Nam Thanh', 1500, N'Nam', '12/12/1980', N'221 Hùng Vương, Q.5, TP HCM', null, null)
go
insert into BOMON values(N'CNTT', N'Công nghệ tri thức', 'B15', '0838126126', null, null, null)
insert into BOMON values(N'HHC', N'Hóa hữu cơ', 'B44', '0838222222', null, null, null)
insert into BOMON values(N'HL', N'Hóa lý', 'B42', '0838878787', null, null, null)
insert into BOMON values(N'HPT', N'Hóa phân tích', 'B43', '0838777777', '007', null, '10/15/2007')
insert into BOMON values(N'HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', null, '09/20/2004')
insert into BOMON values(N'MMT', N'Mạng máy tính', 'B16', '0838676767', '001', null, '05/15/2005')
insert into BOMON values(N'SH', N'Sinh hóa', 'B33', '0838898989', null, null, null)
insert into BOMON values(N'VLĐT', N'Vật lí điện tử', 'B23', '0838234234', null, null, null)
insert into BOMON values(N'VLƯD', N'Vật lí ứng dụng', 'B24', '0838454545', '005', null, '02/18/2006')
insert into BOMON values(N'VS', N'Vi sinh', 'B32', '083909090', '004', null, '01/01/2007')
go
insert into KHOA values('CNTT', N'Công nghê thông tin', '1995', 'B11', '0838123456', '002', '02/20/2005')
insert into KHOA values('HH', N'Hóa học', '1980', 'B41', '0838456456', '007', '10/15/2001')
insert into KHOA values('SH', N'Sinh học', '1980', 'B31', '0838454545', '004', '10/11/2000')
insert into KHOA values('VL', N'Vật lý', '1976', 'B21', '0838223223', '005', '09/18/2003')
go
insert into CHUDE values(N'NCPT', N'Nghiên cứu phát triển')
insert into CHUDE values(N'QLGD', N'Quản lý giáo dục')
insert into CHUDE values(N'ƯDCN', N'Ứng dụng công nghệ')
go
insert into DETAI values('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20.0, '10/20/2007', '10/20/2008', N'QLGD', '002') 
insert into DETAI values('002', N'HTTT quản lý giáo vụ cho một Khoa', N'Trường', 20.0, '10/12/2000', '10/12/2001', N'QLGD', '002')
insert into DETAI values('003', N'Nghiên cứu chế tạo sợi Nanô Platin', N'ĐHQG', 300.0, '05/15/2008', '05/15/2010', N'NCPT', '005')
insert into DETAI values('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100.0, '01/01/2007', '12/31/2009', N'NCPT', '004')
insert into DETAI values('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '10/10/2003', '12/10/2004', N'ƯDCN', '007')
insert into DETAI values('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '10/20/2006', '10/20/2009', N'NCPT', '004')
insert into DETAI values('007', N'HTTT quản lý thư viện các trường ĐH', N'Trường', 20.0, '05/10/2009', '05/10/2010', N'QLGD', '001')
go
insert into CONGVIEC values('001', 1, N'Khởi tạo và Lập kế hoạch', '10/20/2007', '12/20/2008')
insert into CONGVIEC values('001', 2, N'Xác định yêu cầu', '12/21/2008', '03/21/2008')
insert into CONGVIEC values('001', 3, N'Phân tích hệ thống', '03/22/2008', '05/22/2008')
insert into CONGVIEC values('001', 4, N'Thiết kế hệ thống', '05/23/2008', '06/23/2008')
insert into CONGVIEC values('001', 5, N'Cài đặt thử nghiệm', '06/24/2008', '10/20/2008')
insert into CONGVIEC values('002', 1, N'Khởi tạo và Lập kế hoạch', '05/10/2009', '07/10/2009')
insert into CONGVIEC values('002', 2, N'Xác định yêu cầu', '07/11/2009', '10/11/2009')
insert into CONGVIEC values('002', 3, N'Phân tích hệ thống', '10/12/2009', '12/20/2009')
insert into CONGVIEC values('002', 4, N'Thiết kế hệ thống', '12/21/2009', '03/22/2010')
insert into CONGVIEC values('002', 5, N'Cài đặt thử nghiệm', '03/23/2010', '05/10/2010')
insert into CONGVIEC values('006', 1, N'Lấy mẫu', '10/20/2006', '02/20/2007')
insert into CONGVIEC values('006', 2, N'Nuôi cấy', '02/21/2007', '02/21/2008')
go
insert into THAMGIADT values('001', '002', 1, 0.0, null)
insert into THAMGIADT values('001', '002', 2, 2.0, null)
insert into THAMGIADT values('002', '001', 4, 2.0, N'Đạt')
insert into THAMGIADT values('003', '001', 1, 1.0, N'Đạt')
insert into THAMGIADT values('003', '001', 2, 0.0, N'Đạt')
insert into THAMGIADT values('003', '001', 4, 1.0, N'Đạt')
insert into THAMGIADT values('003', '002', 2, 0.0, null)
insert into THAMGIADT values('004', '006', 1, 0.0, N'Đạt')
insert into THAMGIADT values('004', '006', 2, 1.0, N'Đạt')
insert into THAMGIADT values('006', '006', 2, 1.5, N'Đạt')
insert into THAMGIADT values('009', '002', 3, 0.5, null)
insert into THAMGIADT values('009', '002', 4, 1.5, null)
go
insert into NGUOITHAN values('001', N'Hùng', '01/14/1990', N'Nam')
insert into NGUOITHAN values('001', N'Thủy', '12/08/1994', N'Nữ')
insert into NGUOITHAN values('003', N'Hà', '09/03/1998', N'Nữ')
insert into NGUOITHAN values('003', N'Thu', '09/03/1998', N'Nữ')
insert into NGUOITHAN values('007', N'Mai', '03/26/2003', N'Nữ')
insert into NGUOITHAN values('007', N'Vy', '02/14/2000', N'Nữ')
insert into NGUOITHAN values('008', N'Nam', '05/06/1991', N'Nam')
insert into NGUOITHAN values('009', N'An', '08/19/1996', N'Nam')
insert into NGUOITHAN values('010', N'Nguyệt', '01/14/1996', N'Nữ')
go
insert into GV_DT values('001', '0838912112')
insert into GV_DT values('001', '0903123123')
insert into GV_DT values('002', '0913454545')
insert into GV_DT values('003', '0838121212')
insert into GV_DT values('003', '0903656565')
insert into GV_DT values('003', '0937125125')
insert into GV_DT values('006', '0937888888')
insert into GV_DT values('008', '0653717171')
insert into GV_DT values('008', '0913232323')
go

update BOMON set truongbm = '007' where mabm = N'HPT'
update BOMON set truongbm = '002' where mabm = N'HTTT'
update BOMON set truongbm = '001' where mabm = N'MMT'
update BOMON set truongbm = '005' where mabm = N'VLƯD'
update BOMON set truongbm = '004' where mabm = N'VS'
go
update BOMON set makhoa = 'CNTT' where mabm = N'CNTT' or mabm = N'HTTT' or mabm = N'MMT'
update BOMON set makhoa = 'HH' where mabm = N'HHC' or mabm = N'HL' or mabm = N'HPT'
update BOMON set makhoa = 'SH' where mabm = N'SH' or mabm = N'VS'
update BOMON set makhoa = 'VL' where mabm = N'VLĐT' or mabm = N'VLƯD'
go
update GIAOVIEN set gvqlcm = '002' where magv = '003'
update GIAOVIEN set gvqlcm = '004' where magv = '006'
update GIAOVIEN set gvqlcm = '007' where magv = '008' or magv = '010'
update GIAOVIEN set gvqlcm = '001' where magv = '009'
go
update GIAOVIEN set mabm = N'MMT' where magv = '001' or magv = '009'
update GIAOVIEN set mabm = N'HTTT' where magv = '002' or magv = '003'
update GIAOVIEN set mabm = N'VS' where magv = '004' or magv = '006'
update GIAOVIEN set mabm = N'VLĐT' where magv = '005'
update GIAOVIEN set mabm = N'HPT' where magv = '007' or magv = '008' or magv = '010'

-- Q01
select GV.hoten, GV.luong
from GIAOVIEN GV
where GV.phai = N'Nữ'
-- Q02
select GV.hoten, GV.luong * 1.1 N'+10% LƯƠNG'
from GIAOVIEN GV
-- Q03
select GV.magv
from GIAOVIEN GV left join BOMON BM on GV.magv = BM.truongbm
where (GV.hoten like N'Nguyễn %' and GV.luong > 2000) or (BM.truongbm is not null and year(BM.ngaynhanchuc) > 1995)
-- Q04
select GV.hoten
from GIAOVIEN GV join BOMON BM on GV.mabm = BM.mabm join KHOA K on BM.makhoa = K.makhoa
where K.tenkhoa = N'Công nghệ thông tin'
-- Q05
select *
from GIAOVIEN GV join BOMON BM on GV.magv = BM.truongbm
-- Q06
select GV.magv, GV.hoten, BM.*
from GIAOVIEN GV join BOMON BM on GV.mabm = BM.mabm
-- Q07
select DT.tendt, GV.*
from DETAI DT join GIAOVIEN GV on DT.gvcndt = GV.magv
-- Q08
select GV.*
from KHOA K left join GIAOVIEN GV on GV.magv = K.truongkhoa
order by GV.magv asc
-- Q09
select distinct GV.*
from GIAOVIEN GV join BOMON BM on GV.mabm = BM.mabm join THAMGIADT TGIA on GV.magv = TGIA.magv
where BM.tenbm = N'Vi sinh' and TGIA.madt = '006'
-- Q10
select DT.madt, CD.tencd, GV.hoten, GV.NGAYSINH, GV.DIACHI
from DETAI DT join CHUDE CD on DT.macd = CD.macd join GIAOVIEN GV on DT.gvcndt = GV.magv
where DT.capql = N'Thành phố'
-- Q11
select GV1.hoten 'HO TEN GIAO VIEN', GV2.hoten 'HO TEN GVQLCM'
from GIAOVIEN GV1 left join GIAOVIEN GV2 on GV1.gvqlcm = GV2.magv
-- Q12
select GV1.hoten
from GIAOVIEN GV1 join GIAOVIEN GV2 on GV1.gvqlcm = GV2.magv
where GV2.hoten = N'Nguyễn Thanh Tùng'
-- Q13
select GV.hoten
from GIAOVIEN GV join BOMON BM on GV.magv = BM.truongbm
where BM.tenbm = N'Hệ thống thông tin'
-- Q14
select distinct GV.hoten
from GIAOVIEN GV join DETAI DT on GV.magv = DT.gvcndt join CHUDE CD on DT.macd = CD.macd
where CD.tencd = N'Quản lý giáo dục'
-- Q15
select CV.tencv
from DETAI DT join CONGVIEC CV on DT.madt = CV.madt
where DT.tendt = N'HTTT quản lý các trường ĐH' and (month(CV.ngaybd) = 3 and year(CV.ngaybd) = 2008)
-- Q16
select GV1.hoten, GV2.hoten N'Người QLCM'
from GIAOVIEN GV1 left join GIAOVIEN GV2 on GV1.gvqlcm = GV2.magv
-- Q17
select CV.*
from CONGVIEC CV
where CV.ngaybd between '1/1/2007' and '1/8/2007'
-- Q18
select GV1.hoten
from GIAOVIEN GV1 join GIAOVIEN GV2 on GV1.mabm = GV2.mabm
where GV2.hoten = N'Trần Trà Hương'
-- Q19
select distinct GV.*	/* Do 1 GV có thể chủ nhiệm nhiều đề tài */
from GIAOVIEN GV join BOMON BM on GV.magv = BM.truongbm join DETAI DT on GV.magv = DT.gvcndt
-- Q20
select GV.hoten
from GIAOVIEN GV join BOMON BM on GV.magv = BM.truongbm join KHOA K on GV.magv = K.truongkhoa
-- Q21
select distinct GV.hoten
from GIAOVIEN GV join BOMON BM on GV.magv = BM.truongbm join DETAI DT on GV.magv = DT.gvcndt 
-- Q22
select distinct K.truongkhoa
from KHOA K join DETAI DT on K.truongkhoa = DT.gvcndt
-- Q23
select distinct GV.magv /* Do 1 GV có thể tham gia nhiều công việc trong cùng đề tài */
from GIAOVIEN GV join THAMGIADT TGIA on GV.magv = TGIA.magv
where GV.mabm = N'HTTT' or TGIA.madt = '001'
-- Q24
select GV1.*
from GIAOVIEN GV1 join GIAOVIEN GV2 on GV1.mabm = GV2.mabm
where GV2.magv = '002'
-- Q25
select GV.*
from GIAOVIEN GV join BOMON BM on GV.magv = BM.truongbm
order by GV.magv asc
-- Q26
select GV.hoten, GV.luong
from GIAOVIEN GV










