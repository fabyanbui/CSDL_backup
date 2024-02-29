-- 21120201_BuiDinhBao
-- Q27
select count(g.magv) as slgv, sum(g.luong) as tongluong
from GIAOVIEN g
-- Q28
select g.MABM, count(g.magv) as slgv, AVG(g.luong) as luongtrungbinh
from GIAOVIEN g join BOMON b on g.MABM=b.MABM
group by g.MABM
-- Q29
select c.MACD, count(d.MADT) as sldt
from CHUDE c join DETAI d on c.MACD=d.MACD
group by c.MACD
-- Q30
select g.MAGV, g.HOTEN, count(distinct t.MADT) as sldt
from GIAOVIEN g join THAMGIADT t on g.MAGV=t.MAGV
group by g.MAGV, g.HOTEN
-- Q31
select g.MAGV, g.HOTEN, isnull(count(d.MADT),0) as sldt
from DETAI d right join GIAOVIEN g on d.GVCNDT=g.MAGV
group by g.MAGV, g.HOTEN
-- Q32
select g.MAGV, g.HOTEN, isnull(count(n.MAGV),0) as slnt
from GIAOVIEN g left join NGUOITHAN n on g.MAGV=n.MAGV
group by g.MAGV, g.HOTEN
-- Q33
select g.MAGV, g.HOTEN, isnull(count(distinct t.MADT),0) as sldt
from GIAOVIEN g join THAMGIADT t on g.MAGV=t.MAGV
group by g.MAGV, g.HOTEN
having count(distinct t.MADT)>=3
-- Q34
select d.MADT,d.TENDT, isnull(count(g.MAGV),0) as slgv
from GIAOVIEN g join THAMGIADT t on t.MAGV=g.MAGV
				right join DETAI d on d.MADT=t.MADT
group by d.MADT, d.TENDT
having d.TENDT = N'Ứng dụng hóa học xanh'

