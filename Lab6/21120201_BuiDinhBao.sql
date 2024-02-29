-- Q58
-- Count
select gv.HOTEN
from GIAOVIEN gv left join THAMGIADT tg on tg.MAGV=gv.MAGV
				 left join DETAI dt on dt.MADT=tg.MADT
				 left join CHUDE cd on cd.MACD=dt.MACD
group by gv.MAGV, gv.HOTEN
having count(distinct cd.MACD)=(select count(cd1.MACD) from CHUDE cd1)
-- Except
select gv.HOTEN
from GIAOVIEN gv 
where exists(select* from CHUDE cd) and
	not exists (select cd1.MACD
				from CHUDE cd1
				except
				select cd2.MACD
				from GIAOVIEN gv2 left join THAMGIADT tg2 on tg2.MAGV=gv2.MAGV
								 left join DETAI dt2 on dt2.MADT=tg2.MADT
								 left join CHUDE cd2 on cd2.MACD=dt2.MACD
				where gv2.MAGV=gv.MAGV)

-- Q59
-- Count
select distinct dt.TENDT
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join DETAI dt on dt.MADT=tg.MADT
where gv.MABM='HTTT'
group by tg.MADT, dt.TENDT
having count(distinct tg.MAGV)=(select count(gv1.MAGV) from GIAOVIEN gv1 
								where gv1.MABM='HTTT')
-- Except
select distinct dt.TENDT
from THAMGIADT tg join DETAI dt on dt.MADT=tg.MADT
where exists(select* from GIAOVIEN gv where gv.MABM='HTTT') and
	not exists (select gv1.MAGV
				from GIAOVIEN gv1
				where gv1.MABM='HTTT'
				except
				select gv2.MAGV
				from GIAOVIEN gv2 left join THAMGIADT tg2 on tg2.MAGV=gv2.MAGV
				where gv2.MABM='HTTT' and tg2.MADT=tg.MADT)

-- Q60
-- Count
select distinct dt.TENDT
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join DETAI dt on dt.MADT=tg.MADT
where gv.MABM='HTTT'
group by tg.MADT, dt.TENDT
having count(distinct tg.MAGV)=(select count(gv1.MAGV) from GIAOVIEN gv1 
								where gv1.MABM='HTTT')
-- Except
select distinct dt.TENDT
from THAMGIADT tg join DETAI dt on dt.MADT=tg.MADT
where exists(select* from GIAOVIEN gv where gv.MABM='HTTT') and
	not exists (select gv1.MAGV
				from GIAOVIEN gv1
				where gv1.MABM='HTTT'
				except
				select gv2.MAGV
				from GIAOVIEN gv2 left join THAMGIADT tg2 on tg2.MAGV=gv2.MAGV
				where gv2.MABM='HTTT' and tg2.MADT=tg.MADT)

-- Q61
-- Count
select tg.MAGV, gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join DETAI dt on dt.MADT=tg.MADT
where dt.MACD='QLGD'
group by tg.MAGV, gv.HOTEN
having count(distinct dt.MADT)=(select count(dt1.MADT)
							from DETAI dt1 
							where dt1.MACD='QLGD')
-- Except
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv 
where exists (select dt.MADT from DETAI dt where dt.MACD='QLGD') and
not exists (select dt1.MADT
				from DETAI dt1
				where dt1.MACD='QLGD'
				except 
				select dt2.MADT
				from DETAI dt2 join THAMGIADT tg2 on tg2.MADT=dt2.MADT
				where dt2.MACD='QLGD' and tg2.MAGV=gv.MAGV)

-- Q62 
-- Count
select gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
where tg.MADT in (select dt1.MADT
				from DETAI dt1 join THAMGIADT tg1 on tg1.MADT=dt1.MADT
							  join GIAOVIEN gv1 on gv1.MAGV=tg1.MAGV
				where gv1.HOTEN=N'Trần Trà Hương') and
	gv.HOTEN!=N'Trần Trà Hương'
group by gv.MAGV, gv.HOTEN
having count(distinct tg.MADT)= (select count(dt2.MADT)
							from DETAI dt2 join THAMGIADT tg2 on tg2.MADT=dt2.MADT
											join GIAOVIEN gv2 on gv2.MAGV=tg2.MAGV
							where gv2.HOTEN=N'Trần Trà Hương')
-- Except
select gv.HOTEN
from GIAOVIEN gv
where gv.HOTEN!=N'Trần Trà Hương' and
exists (select dt.MADT from DETAI dt join THAMGIADT tg on tg.MADT=dt.MADT
									   join GIAOVIEN gv on gv.MAGV=tg.MAGV
		where gv.HOTEN=N'Trần Trà Hương') and
not exists (select dt1.MADT
				from DETAI dt1 join THAMGIADT tg1 on tg1.MADT=dt1.MADT
							   join GIAOVIEN gv1 on gv1.MAGV=tg1.MAGV
				where gv1.HOTEN=N'Trần Trà Hương'
				except
				select tg2.MADT
				from THAMGIADT tg2
				where tg2.MAGV=gv.MAGV)

-- Q63
-- Count
select dt.TENDT
from DETAI dt join THAMGIADT tg on tg.MADT=dt.MADT
			  join GIAOVIEN gv on gv.MAGV=tg.MAGV
			  join BOMON bm on bm.MABM=gv.MABM
where bm.TENBM=N'Hóa hữu cơ'
group by dt.MADT, dt.TENDT
having count(distinct tg.MAGV)=(select count(gv1.MAGV)
							from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
							where bm1.TENBM=N'Hóa hữu cơ')
-- Except
select dt.TENDT
from DETAI dt
where exists(select gv.MAGV from GIAOVIEN gv join BOMON bm on bm.MABM=gv.MABM
				where bm.TENBM=N'Hóa hữu cơ') and
	not exists (select gv1.MAGV
				from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
				where bm1.TENBM=N'Hóa hữu cơ'
				except
				select gv2.MAGV
				from GIAOVIEN gv2 join THAMGIADT tg2 on tg2.MAGV=gv2.MAGV
				where tg2.MADT=dt.MADT)

-- Q64
-- Count
select gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join CONGVIEC cv on cv.SOTT=tg.STT and cv.MADT=tg.MADT
where tg.MADT='006'
group by gv.MAGV, gv.HOTEN
having count(tg.STT)=(select count(cv1.SOTT)
					from CONGVIEC cv1
					where cv1.MADT='006')
-- Except
select gv.HOTEN
from GIAOVIEN gv
where not exists (select cv1.SOTT, cv1.MADT
				from CONGVIEC cv1
				where cv1.MADT='006'
				except 
				select cv2.SOTT, cv2.MADT
				from CONGVIEC cv2 join THAMGIADT tg2 on tg2.MADT=cv2.MADT and tg2.STT=cv2.SOTT
				where gv.MAGV=tg2.MAGV)

-- Q65
-- Count 
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join DETAI dt on dt.MADT=tg.MADT
				 join CHUDE cd on cd.MACD=dt.MACD
where cd.TENCD=N'Ứng dụng công nghệ'
group by gv.MAGV, gv.HOTEN
having count(distinct dt.MADT)=(select count(dt1.MADT)
							from DETAI dt1 join CHUDE cd1 on cd1.MACD=dt1.MACD
							where cd1.TENCD=N'Ứng dụng công nghệ')
-- Except
select gv.HOTEN
from GIAOVIEN gv
where exists (select dt.MADT from DETAI dt join CHUDE cd on cd.MACD=dt.MACD
				where cd.TENCD=N'Ứng dụng công nghệ') and
not exists (select dt1.MADT
				from DETAI dt1 join CHUDE cd1 on cd1.MACD=dt1.MACD
				where cd1.TENCD=N'Ứng dụng công nghệ'
				except
				select dt2.MADT
				from DETAI dt2 join THAMGIADT tg2 on tg2.MADT=dt2.MADT
				where tg2.MAGV=gv.MAGV)

-- Q66
-- Count
select gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
where tg.MADT in (select dt1.MADT
				from DETAI dt1 join GIAOVIEN gv1 on gv1.MAGV=dt1.GVCNDT
				where gv1.HOTEN=N'Trần Trà Hương')
group by gv.MAGV, gv.HOTEN
having count(distinct tg.MADT)= (select count(dt1.MADT)
							from DETAI dt1 join GIAOVIEN gv1 on gv1.MAGV=dt1.GVCNDT
							where gv1.HOTEN=N'Trần Trà Hương')
-- Except
select gv.HOTEN
from GIAOVIEN gv
where exists (select dt.MADT from DETAI dt join GIAOVIEN gv on gv.MAGV=dt.GVCNDT
				where gv.HOTEN=N'Trần Trà Hương') and
	not exists (select dt1.MADT
				from DETAI dt1 join GIAOVIEN gv1 on gv1.MAGV=dt1.GVCNDT
				where gv1.HOTEN=N'Trần Trà Hương'
				except
				select dt2.MADT
				from DETAI dt2 join THAMGIADT tg2 on tg2.MADT=dt2.MADT
				where tg2.MAGV=gv.MAGV)

-- Q67
-- Count
select dt.TENDT
from DETAI dt join THAMGIADT tg on tg.MADT=dt.MADT 
			  join GIAOVIEN gv on gv.MAGV=tg.MAGV
			  join BOMON bm on bm.MABM=gv.MABM
			  join KHOA k on k.MAKHOA=bm.MAKHOA
where bm.MAKHOA='CNTT'
group by dt.MADT, dt.TENDT
having count(distinct tg.MAGV)=(select count(gv1.MAGV)
							from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
							where bm1.MAKHOA='CNTT')
-- Except
select dt.TENDT
from DETAI dt
where exists(select gv.MAGV from GIAOVIEN gv join BOMON bm on gv.MABM=bm.MABM
				where bm.MAKHOA='CNTT') and
	not exists (select gv1.MAGV
				from GIAOVIEN gv1 join BOMON bm1 on gv1.MABM=bm1.MABM
				where bm1.MAKHOA='CNTT'
				except 
				select gv2.MAGV
				from GIAOVIEN gv2 join THAMGIADT tg2 on tg2.MAGV=gv2.MAGV
				where tg2.MADT=dt.MADT)

-- Q68
-- Count
select gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join CONGVIEC cv on cv.MADT=tg.MADT and cv.SOTT=tg.STT
				 join DETAI dt on dt.MADT=cv.MADT
where dt.TENDT=N'Nghiên cứu tế bào gốc'
group by gv.MAGV, gv.HOTEN
having count(cv.SOTT)= (select count(*)
						from CONGVIEC cv1 join DETAI dt1 on dt1.MADT=cv1.MADT
						where dt1.TENDT=N'Nghiên cứu tế bào gốc')
-- Except
select gv.HOTEN
from GIAOVIEN gv
where exists(select cv.SOTT, cv.MADT
			from CONGVIEC cv join DETAI dt on dt.MADT=cv.MADT
			where dt.TENDT=N'Nghiên cứu tế bào gốc') and 
not exists (select cv1.SOTT, cv1.MADT
			from CONGVIEC cv1 join DETAI dt1 on dt1.MADT=cv1.MADT
			where dt1.TENDT=N'Nghiên cứu tế bào gốc' 
			except
			select cv2.SOTT, cv2.MADT
			from CONGVIEC cv2 join THAMGIADT tg2 on tg2.STT=cv2.SOTT and tg2.MADT=cv2.MADT
			where tg2.MAGV=gv.MAGV)
				
-- Q69
-- Count
select gv.HOTEN
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join DETAI dt on dt.MADT=tg.MADT
where dt.KINHPHI>100
group by gv.MAGV, gv.HOTEN
having count(distinct dt.MADT)=(select count(dt1.MADT)
							from DETAI dt1 
							where dt1.KINHPHI>100)
-- Except
select gv.HOTEN
from GIAOVIEN gv
where exists (select dt.MADT from DETAI dt where dt.KINHPHI>100) and
not exists (select dt1.MADT
			from DETAI dt1
			where dt1.KINHPHI>100
			except
			select dt2.MADT
			from DETAI dt2 join THAMGIADT tg2 on tg2.MADT=dt2.MADT
			where tg2.MAGV=gv.MAGV)

-- Q70
-- Count
select dt.TENDT
from DETAI dt join THAMGIADT tg on tg.MADT=dt.MADT
			  join GIAOVIEN gv on gv.MAGV=tg.MAGV
			  join BOMON bm on bm.MABM=gv.MABM
			  join KHOA k on k.MAKHOA=bm.MAKHOA
where k.TENKHOA=N'Sinh học'
group by dt.MADT, dt.TENDT
having count(distinct tg.MAGV)=(select count(gv1.MAGV)
							from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
											  join KHOA k1 on k1.MAKHOA=bm1.MAKHOA
							where k1.TENKHOA=N'Sinh học')
-- Except
select dt.TENDT
from DETAI dt 
where exists (select gv.MAGV from GIAOVIEN gv join BOMON bm on bm.MABM=gv.MABM
												join KHOA k on k.MAKHOA=bm.MAKHOA
			where k.TENKHOA=N'Sinh học') and
not exists (select gv1.MAGV
			from GIAOVIEN gv1 join BOMON bm1 on bm1.MABM=gv1.MABM
							  join KHOA k1 on k1.MAKHOA=bm1.MAKHOA
			where k1.TENKHOA=N'Sinh học'
			except
			select gv2.MAGV
			from GIAOVIEN gv2 join THAMGIADT tg2 on tg2.MAGV=gv2.MAGV
			where tg2.MADT=dt.MADT)

-- Q71
-- Count
select gv.MAGV, gv.HOTEN, gv.NGSINH
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join CONGVIEC cv on cv.MADT=tg.MADT and cv.SOTT=tg.STT
				 join DETAI dt on dt.MADT=cv.MADT
where dt.TENDT=N'Ứng dụng hóa học xanh'
group by gv.MAGV, gv.HOTEN, gv.NGSINH
having count(cv.SOTT)= (select count(*)
							from CONGVIEC cv1 join DETAI dt1 on dt1.MADT=cv1.MADT
							where dt1.TENDT=N'Ứng dụng hóa học xanh')
-- Except
select gv.MAGV, gv.HOTEN, gv.NGSINH
from GIAOVIEN gv
where exists (select cv.SOTT, cv.MADT
			from CONGVIEC cv join DETAI dt on dt.MADT=cv.MADT
			where dt.TENDT=N'Ứng dụng hóa học xanh') and
not exists (select cv1.SOTT, cv1.MADT
			from CONGVIEC cv1 join DETAI dt1 on dt1.MADT=cv1.MADT
			where dt1.TENDT=N'Ứng dụng hóa học xanh' 
			except
			select cv2.SOTT, cv2.MADT
			from CONGVIEC cv2 join THAMGIADT tg2 on tg2.STT=cv2.SOTT and tg2.MADT=cv2.MADT
			where tg2.MAGV=gv.MAGV)

-- Q72
-- Count 
select gv.MAGV, bm.TENBM, ql.HOTEN as QLCM
from GIAOVIEN gv join THAMGIADT tg on tg.MAGV=gv.MAGV
				 join DETAI dt on dt.MADT=tg.MADT
				 join CHUDE cd on cd.MACD=dt.MACD
				 join BOMON bm on bm.MABM=gv.MABM
				 join GIAOVIEN ql on ql.MAGV=gv.GVQLCM
where cd.TENCD=N'Nghiên cứu phát triển'
group by gv.MAGV, gv.HOTEN, bm.TENBM, ql.HOTEN
having count(distinct dt.MADT)=(select count(dt1.MADT)
							from DETAI dt1 join CHUDE cd1 on cd1.MACD=dt1.MACD
							where cd1.TENCD=N'Nghiên cứu phát triển')
-- Except
select gv.HOTEN, bm.TENBM, ql.HOTEN as QLCM
from GIAOVIEN gv join BOMON bm on bm.MABM=gv.MABM
				 join GIAOVIEN ql on ql.MAGV=gv.GVQLCM
where exists (select dt.MADT from DETAI dt join CHUDE cd on cd.MACD=dt.MACD
				where cd.TENCD=N'Nghiên cứu phát triển') and
not exists (select dt1.MADT
			from DETAI dt1 join CHUDE cd1 on cd1.MACD=dt1.MACD
			where cd1.TENCD=N'Nghiên cứu phát triển'
			except
			select dt2.MADT
			from DETAI dt2 join THAMGIADT tg2 on tg2.MADT=dt2.MADT
			where tg2.MAGV=gv.MAGV)








							









