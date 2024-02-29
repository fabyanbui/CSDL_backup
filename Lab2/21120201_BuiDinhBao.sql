-- 
use master
create database DiemThamQuan
go
use DiemThamQuan

-- Cau 1

create table TINH_THANH (
	QuocGia varchar(10),
	MaTinhThanh varchar(10),
	TenTT nvarchar(50),
	DanSo int,
	DienTich float,
	Stt int,
	primary key(QuocGia, MaTinhThanh)
)

create table DIEM_THAM_QUAN (
	Stt int,
	TenDTQ nvarchar(50),
	TinhThanh varchar(10),
	QuocGia varchar(10),
	DacDiem nvarchar(50),
	primary key(QuocGia, TinhThanh, Stt)
)

create table QUOC_GIA (
	MaQG varchar(10),
	TenQG nvarchar(50),
	ThuDo varchar(10),
	DanSo int,
	DienTich float,
	primary key(MaQG)
)

-- Cau 2

alter table QUOC_GIA add
	foreign key (MaQG, ThuDo) references TINH_THANH(QuocGia, MaTinhThanh)

alter table TINH_THANH add
	foreign key (QuocGia) references QUOC_GIA(MaQG),
	foreign key (QuocGia, MaTinhThanh, Stt) references DIEM_THAM_QUAN(QuocGia, TinhThanh, Stt)

alter table DIEM_THAM_QUAN add
	foreign key (QuocGia, TinhThanh) references TINH_THANH(QuocGia, MaTinhThanh)

-- Cau 3

insert into QUOC_GIA values
	('QG002', N'Nhật Bản', NULL, 129500000, 337834.00),
	('QG003', N'Thái Lan', NULL, 300500000, 207834.00),
	('QG001', N'Việt Nam', NULL, 115000000, 331688.00)

insert into TINH_THANH values 
	('QG001', 'TT001', N'Hà Nội', 2500000, 927.39, NULL),
	('QG001', 'TT002', N'Huế', 5344000, 5009.00, NULL),
	('QG002', 'TT003', N'Tokyo', 12084000, 2187.00, NULL)

update QUOC_GIA set ThuDo='TT003' where MaQG='QG002'
update QUOC_GIA set ThuDo='TT001' where MaQG='QG001'

insert into DIEM_THAM_QUAN values
	(1, N'Văn Miếu', 'TT001', 'QG001', N'Di tích cổ'),
	(2, N'Hoàng lăng', 'TT002', 'QG001', N'Di tích cổ'),
	(3, N'Tháp Tokyo', 'TT003', 'QG002', N'Công trình hiện đại')

update TINH_THANH set Stt=1 where QuocGia='QG001' and MaTinhThanh='TT001'
update TINH_THANH set Stt=2 where QuocGia='QG001' and MaTinhThanh='TT002'
update TINH_THANH set Stt=3 where QuocGia='QG002' and MaTinhThanh='TT003'

select * from QUOC_GIA
select * from TINH_THANH
select * from DIEM_THAM_QUAN

---
use master
drop database DiemThamQuan
