select * into ƽ��ѧ�ּ��� FROM
(
select top 100 percent ѧ��.ѧ��,��ѧ��,�ܼ���/��ѧ�� ƽ��ѧ�ּ��� 
from ѧ��,(select ѧ��,Sum(ѧ��) from ѧ���ɼ����۱� group by ѧ��) as temporary1(ѧ��,��ѧ��),(select ѧ��,Sum(ѧ��*����*Ȩ��) from ѧ���ɼ����۱� group by ѧ��) as temporary2(ѧ��,�ܼ���) 
where ѧ��.ѧ��=temporary1.ѧ�� and ѧ��.ѧ��=temporary2.ѧ�� 
order by ƽ��ѧ�ּ��� desc
)as temp