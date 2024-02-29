use QLDT

-- Q35
select distinct gv.LUONG as LUONGCAONHAT
from GIAOVIEN gv
where not exists (select* from GIAOVIEN gv1 where gv.LUONG<gv1.LUONG)

-- Q36 
select gv.MAGV, gv.HOTEN, gv.LUONG as LUONGCAONHAT
from GIAOVIEN gv
where not exists (select* from GIAOVIEN gv1 where gv.LUONG<gv1.LUONG)

-- Q37
select distinct gv.LUONG as MAXLUONGHTTT
from GIAOVIEN gv
where gv.MABM='HTTT' and
	gv.LUONG>= ALL(select gv1.LUONG from GIAOVIEN gv1 where gv1.MABM=gv.MABM)

-- Q38
select gv.HOTEN
from GIAOVIEN gv
where gv.MABM='HTTT' and
	year(gv.ngsinh) <= ALL (select year(gv1.ngsinh) from GIAOVIEN gv1 where gv1.MABM=gv.MABM)

-- Q39
select gv.HOTEN
from GIAOVIEN gv join BOMON bm on gv.MABM=bm.MABM
				 join KHOA k on bm.MAKHOA=k.MAKHOA
where k.TENKHOA=N'Công nghệ thông tin' and
	year(gv.ngsinh) >= ALL (select year(gv1.ngsinh) from GIAOVIEN gv1 
							where gv1.MABM=gv.MABM)

-- Q40
select gv.HOTEN, k.TENKHOA
from GIAOVIEN gv join BOMON bm on gv.MABM=bm.MABM
				 join KHOA k on bm.MAKHOA=k.MAKHOA
where not exists (select* from GIAOVIEN gv1 where gv.LUONG<gv1.LUONG)

-- Q41
select gv.HOTEN, gv.MABM
from GIAOVIEN gv 
group by gv.MABM, gv.HOTEN, gv.LUONG
having gv.LUONG >= ALL (select gv1.LUONG from GIAOVIEN gv1 where gv1.MABM=gv.MABM)

-- Q42
select distinct dt.TENDT
from THAMGIADT tg join DETAI dt on dt.MADT=tg.MADT 
where not exists (select * from THAMGIADT tg1 join GIAOVIEN gv on gv.MAGV=tg1.MAGV
					where tg.MAGV<>tg1.MAGV and gv.HOTEN=N'Nguyễn Hoài An')

-- Q43
select distinct dt.TENDT, gv1.HOTEN as GVCNDT
from THAMGIADT tg join DETAI dt on dt.MADT=tg.MADT 
					join GIAOVIEN gv1 on gv1.MAGV=dt.GVCNDT
where not exists (select * from THAMGIADT tg1 join GIAOVIEN gv on gv.MAGV=tg1.MAGV
					where tg.MAGV<>tg1.MAGV and gv.HOTEN=N'Nguyễn Hoài An')

-- Q44
select gv.HOTEN
from GIAOVIEN gv join BOMON bm on bm.MABM=gv.MABM
				 join KHOA k on k.MAKHOA=bm.MAKHOA
where k.TENKHOA=N'Công nghệ thông tin' and
	not exists (select * from THAMGIADT tg1 where tg1.MAGV=gv.MAGV)

-- Q45
select gv.HOTEN
from GIAOVIEN gv
where not exists (select * from THAMGIADT tg1 where tg1.MAGV=gv.MAGV)

-- Q46
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv 
where gv.LUONG>(select gv1.LUONG from GIAOVIEN gv1 where gv1.HOTEN=N'Nguyễn Hoài An')

-- Q47
select bm.TRUONGBM, gv.HOTEN
from BOMON bm join GIAOVIEN gv on gv.MAGV=bm.TRUONGBM
			  join THAMGIADT tg on tg.MAGV=gv.MAGV
group by bm.TRUONGBM, gv.HOTEN
having count(distinct tg.MADT)>=1

-- Q48 
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv 
where gv.HOTEN=ANY(select gv1.HOTEN from GIAOVIEN gv1 where gv1.MABM=gv.MABM and gv1.MAGV<>gv.MAGV) and
	gv.PHAI=ANY(select gv2.PHAI from GIAOVIEN gv2 where gv2.MABM=gv.MABM and gv2.MAGV<> gv.MAGV)

-- Q49
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv
where gv.LUONG > ANY (select gv1.LUONG from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
						where bm1.TENBM=N'Công nghệ phần mềm')
	
-- Q50
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv
where gv.LUONG > ALL (select gv1.LUONG from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
						where bm1.TENBM=N'Hệ thống thông tin')

-- Q51
select k.TENKHOA as KHOADONGGVNHAT
from KHOA k join BOMON bm on bm.MAKHOA=k.MAKHOA
			join GIAOVIEN gv on gv.MABM=bm.MABM
group by k.MAKHOA, k.TENKHOA
having count(gv.MAGV) >= ALL (select count(gv1.MAGV)
							from KHOA k1 join BOMON bm1 on bm1.MAKHOA=k1.MAKHOA
										join GIAOVIEN gv1 on gv1.MABM=bm1.MABM
										group by k1.MAKHOA)

-- Q52
select gv.HOTEN
from GIAOVIEN gv join DETAI dt on gv.MAGV=dt.GVCNDT
group by gv.MAGV, gv.HOTEN
having count(dt.MADT)>=ALL(select count(dt1.MADT)
						from GIAOVIEN gv1 join DETAI dt1 on gv1.MAGV=dt1.GVCNDT
						group by gv1.MAGV)

-- Q53
select bm.MABM
from BOMON bm join GIAOVIEN gv on gv.MABM=bm.MABM
group by bm.MABM
having count(gv.MAGV) >= ALL (select count(gv1.MAGV)
						from BOMON bm1 join GIAOVIEN gv1 on gv1.MABM=bm1.MABM
						group by bm1.MABM)

-- Q54
select gv.HOTEN, bm.TENBM
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				join BOMON bm on gv.MABM=bm.MABM
group by gv.MAGV, gv.HOTEN, bm.TENBM
having count(distinct tg.MADT) >= ALL (select count(distinct tg1.MADT)
						from GIAOVIEN gv1 join THAMGIADT tg1 on tg1.MAGV=gv1.MAGV
						group by gv1.MAGV)

-- Q55
select gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
where gv.MABM=N'HTTT'
group by gv.MAGV, gv.HOTEN
having count(distinct tg.MADT) >= ALL (select count(distinct tg1.MADT)
						from GIAOVIEN gv1 join THAMGIADT tg1 on tg1.MAGV=gv1.MAGV
						where gv1.MABM=N'HTTT'
						group by gv1.MAGV)

-- Q56
select gv.HOTEN, bm.TENBM
from GIAOVIEN gv join BOMON bm on bm.MABM=gv.MABM
				 join NGUOITHAN nt on gv.MAGV=nt.MAGV
group by gv.MAGV, gv.HOTEN, bm.TENBM
having not exists (select * from GIAOVIEN gv1 join NGUOITHAN nt1 on gv1.MAGV=nt1.MAGV
					group by gv1.MAGV having count(nt1.TEN)>count(nt.TEN))

-- Q57 
select gv.HOTEN
from BOMON bm join GIAOVIEN gv on bm.TRUONGBM=gv.MAGV
			  join DETAI dt on dt.GVCNDT=bm.TRUONGBM
group by bm.TRUONGBM, gv.HOTEN
having count(dt.MADT) >=ALL (select count(dt1.MADT)
					from BOMON bm1 join DETAI dt1 on dt1.GVCNDT=bm1.TRUONGBM
					group by bm1.TRUONGBM)






