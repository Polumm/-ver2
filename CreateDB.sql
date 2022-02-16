/*CreateTable*/
create table ϵ
(
ϵ��� varchar(30) primary key,
ϵ�� varchar(40),
ϵ�칫�ҵ绰 varchar(50),
ѧԺ varchar(40),
)

create table ��ʦ
(
��ʦ��� varchar(20) primary key,
���� varchar(20),
ְ�� varchar(20),
��ϵ��ʽ varchar(50),
ϵ��� varchar(30),
foreign key(ϵ���) references ϵ(ϵ���)
)

create table ��
(
�༶��� varchar(10) primary key,
ϵ��� varchar(30),
רҵ varchar(40),
foreign key(ϵ���) references ϵ(ϵ���)
)

create table ѧ��
(
ѧ�� varchar(20) primary key,
���� varchar(20),
�Ա� varchar(10),
�������� smalldatetime,
�༶��� varchar(10),
foreign key(�༶���) references ��(�༶���)
)

create table ����
(
���ұ�� varchar(10) primary key,
¥�� varchar(5),
�������� tinyint,
�ռ�λ�� varchar(10)
)

create table �γ�
(
�γ̴��� varchar(20) primary key,
�γ��� varchar(40),
�γ����� varchar(20) check(�γ����� in ('��������','רҵ����','ѡ��')),/*check����Լ�����޶��γ�����*/
ѧ�� tinyint,
)

create table �ſα�
(
�γ̽�ѧID varchar(20) primary key,
�Ͽ�ʱ�� varchar(40),
���ұ�� varchar(10),
��ʦ��� varchar(20),
�ƻ����� tinyint,
��ѡ���� tinyint,
�γ̴��� varchar(20),
/*foreign key(���ұ��) references ����(���ұ��),*/
foreign key(��ʦ���) references ��ʦ(��ʦ���),
foreign key(�γ̴���) references �γ�(�γ̴���)
)

create table �γ�ѧ��SC
(
ѧ�� varchar(20),
�γ̽�ѧID varchar(20),
�ɼ� float,
primary key(ѧ��,�γ̽�ѧID),
foreign key(ѧ��) references ѧ��(ѧ��),
foreign key(�γ̽�ѧID) references �ſα�(�γ̽�ѧID)
)

create table ����Ա�����
(�û��� varchar(20) primary key,
 ����  varchar(max)
)

create table ��ʦ�����
(�û��� varchar(20) primary key,
 ����  varchar(max)
)

create table ѧ�������
(�û��� varchar(20) primary key,
 ����  varchar(max)
)



/*==================================================================================================================================================================*/
/*CreateGPA_Model&Trigger*/
create table ����ģ��
(
ѧ�� varchar(20),
�γ̴��� varchar(20),
�ȼ� varchar(10),
���� float,
Ȩ�� float,
primary key(ѧ��,�γ̴���),
foreign key(ѧ��) references ѧ��(ѧ��),
foreign key(�γ̴���) references �γ�(�γ̴���)
)


go
create trigger insert_����
on �γ�ѧ��SC
after insert
as
begin
    declare @ѧ�� varchar(20), @�γ̽�ѧID varchar(20), @�γ̴��� varchar(20), @�ƻ����� smallint, @��ǰ���� smallint, @�ɼ� smallint, @�γ����� varchar(20);
    select @ѧ��=ѧ��, @�γ̽�ѧID=�γ̽�ѧID, @�ɼ�=�ɼ� from inserted;
	select @�ƻ�����=�ƻ�����, @��ǰ����=��ѡ���� from �ſα� where �γ̽�ѧID=@�γ̽�ѧID;
	select @�γ�����=�γ�����,@�γ̴���=�γ̴��� from �γ� where �γ̴��� = (select �γ̴��� from �ſα� where �γ̽�ѧID=@�γ̽�ѧID);
    if (@�ƻ�����>=@��ǰ����)
	begin
		print 'ѡ�γɹ���';
		update �ſα� set ��ѡ���� = ��ѡ����+1 where �γ̽�ѧID = @�γ̽�ѧID;
		if(@�ɼ�=null)
		begin
			insert into ����ģ��(ѧ��,�γ̴���)
			values(@ѧ��,@�γ̴���)
		end
		else if(@�ɼ�>=90 and @�ɼ�<100)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'A',4.0)
		end
		else if(@�ɼ�>=85 and @�ɼ�<90)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'A-',3.7)
		end
		else if(@�ɼ�>=82 and @�ɼ�<85)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'B+',3.3)
		end
		else if(@�ɼ�>=78 and @�ɼ�<82)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'B',3.0)
		end
		else if(@�ɼ�>=75 and @�ɼ�<78)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'B-',2.7)
		end
		else if(@�ɼ�>=71 and @�ɼ�<75)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'C+',2.3)
		end
		else if(@�ɼ�>=66 and @�ɼ�<71)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'C',2.0)
		end
		else if(@�ɼ�>=62 and @�ɼ�<66)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'C-',1.7)
		end
		else if(@�ɼ�>=60 and @�ɼ�<62)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'D',1.3)
		end
		else if(@�ɼ�<60)
		begin
			insert into ����ģ��(ѧ��,�γ̴���,�ȼ�,����)
			values(@ѧ��,@�γ̴���,'D-',1.0)
		end
		if(@�γ�����='��������')
		begin
			update ����ģ��
			set Ȩ��=1.2
			where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
		end
		else if(@�γ�����='רҵ����')
		begin
			update ����ģ��
			set Ȩ��=1.1
			where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
		end
		else if(@�γ�����='ѡ��')
		begin
			update ����ģ��
			set Ȩ��=1.0
			where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
		end
	end
    else if(@�ƻ�����<@��ǰ����)
	begin
		rollback transaction
		print 'ѡ��ʧ�ܣ��γ�������';
	end
end
go
create trigger update_����
on �γ�ѧ��SC
after update
as
begin
	declare @ѧ�� varchar(20), @�γ̽�ѧID varchar(20), @�γ̴��� varchar(20), @�ɼ�_before float, @�ɼ� float;
    select @ѧ��=ѧ��, @�γ̽�ѧID=�γ̽�ѧID from inserted;
	select @�γ̴��� = �γ̴��� from �ſα� where �γ̽�ѧID=@�γ̽�ѧID;
	select @�ɼ�_before=�ɼ� from deleted;
	select @�ɼ�=�ɼ� from inserted;
	begin
		if (update(�ɼ�))
		begin
			print '����¼��ɹ���';
			if(@�ɼ�=null)
			begin
				update ����ģ��
				set �ȼ�=null,����=null
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=90 and @�ɼ�<100)
			begin
				update ����ģ��
				set �ȼ�='A',����=4.0
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=85 and @�ɼ�<90)
			begin
				update ����ģ��
				set �ȼ�='A-',����=3.7
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=82 and @�ɼ�<85)
			begin
				update ����ģ��
				set �ȼ�='B+',����=3.3
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=78 and @�ɼ�<82)
			begin
				update ����ģ��
				set �ȼ�='B',����=3.0
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=75 and @�ɼ�<78)
			begin
				update ����ģ��
				set �ȼ�='B-',����=2.7
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=71 and @�ɼ�<75)
			begin
				update ����ģ��
				set �ȼ�='C+',����=2.3
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=66 and @�ɼ�<71)
			begin
				update ����ģ��
				set �ȼ�='C',����=2.0
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=62 and @�ɼ�<66)
			begin
				update ����ģ��
				set �ȼ�='C-',����=1.7
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�>=60 and @�ɼ�<62)
			begin
				update ����ģ��
				set �ȼ�='D',����=1.3
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
			else if(@�ɼ�<60)
			begin
				update ����ģ��
				set �ȼ�='D-',����=1.0
				where ѧ��=@ѧ�� and �γ̴���=@�γ̴���
			end
		end
		else if(update(ѧ��) or update(�γ̽�ѧID))
		begin
			rollback transaction
			print '������Ч��';
		end
	end
end
go

create trigger delete_����
on �γ�ѧ��SC
after delete
as
begin
	declare @ѧ�� varchar(20), @�γ̽�ѧID varchar(20),@�γ̴��� varchar(20),@�ɼ� smallint;
    select @ѧ��=ѧ��, @�γ̽�ѧID=�γ̽�ѧID, @�ɼ�=�ɼ� from deleted;
	select @�γ̴��� = �γ̴��� from �ſα� where �γ̽�ѧID=@�γ̽�ѧID;
	if(@�ɼ� between 0 and 100)
	begin
		print '�ɼ���¼�룬������Ч��';
		rollback transaction
	end
	else
	begin
		delete
		from ����ģ��
		where ѧ��=@ѧ�� and �γ̴��� = @�γ̴���
		update �ſα� set ��ѡ���� = ��ѡ����-1 where �γ̽�ѧID = @�γ̽�ѧID;
	end
end
go



/*==================================================================================================================================================================*/
/*AddDataFlow*/
insert into ϵ
values('081201,081202,081205T','���ϵ','027-67883725','��������Ϣ����ѧԺ')
insert into ϵ
values('070501,070504','����ϵ','027-67883725','��������Ϣ����ѧԺ')
insert into ϵ
values('080902','�������ϵ','027-67883725','��������Ϣ����ѧԺ')
insert into ϵ
values('070101','Ӧ����ѧϵ','027-67883091','����ѧԺ')
insert into ϵ
values('030503','˼�����ν���','027-67848620','���˼����ѧԺ')
insert into ϵ
values('070901','����ϵ','027-67883001','�����ѧѧԺ')
insert into ϵ
values('050201','Ӣ��ϵ','027-67883262','�����ѧԺ')
insert into ϵ
values('070201','����ϵ','027-67883091','����ѧԺ')
insert into ϵ
values('020101','����ϵ','027-67883209','����ѧԺ')



insert into ��
values('11C201','081201,081202,081205T','����ѧ�뼼��')
insert into ��
values('11C202','081201,081202,081205T','ң�п�ѧ�뼼��')
insert into ��
values('11C203','081201,081202,081205T','����ռ���Ϣ����')
insert into ��
values('11D201','070501,070504','�����ѧ')
insert into ��
values('11D202','070501,070504','������Ϣ��ѧ')
insert into ��
values('11D203','070501,070504','������Ϣ��ѧ')
insert into ��
values('11J201','080902','�������')
insert into ��
values('11J202','080902','�������')



insert into ����
values('A-104','һ��',60,'����һ')
insert into ����
values('A-105','һ��',60,'����һ')
insert into ����
values('A-109','һ��',80,'����һ')
insert into ����
values('A-111','һ��',120,'����һ')
insert into ����
values('A-201','����',50,'����һ')
insert into ����
values('A-202','����',50,'����һ')
insert into ����
values('A-203','����',50,'����һ')
insert into ����
values('A-212','����',90,'����һ')
insert into ����
values('A-214','����',90,'����һ')
insert into ����
values('A-310','����',150,'����һ')
insert into ����
values('A-406','�Ĳ�',120,'����һ')
insert into ����
values('A-509','���',120,'����һ')



insert into ��ʦ
values('qikunlun0630','������','������','qikunlun@cug.edu.cn','070501,070504')
insert into ��ʦ
values('wanglunche13','���׳�','����','wang@cug.edu.cn','070501,070504')
insert into ��ʦ
values('liuxiuguo225','���޹�','����','liuxg318@163.com','081201,081202,081205T')
insert into ��ʦ
values('chaoyi010701','����','������','chaoyi@cug.edu.cn','070501,070504')
insert into ��ʦ
values('guanqinfeng1','�����','����','guanqf@cug.edu.cn','070501,070504')
insert into ��ʦ
values('liujianyu106','������','������','liujy@cug.edu.cn','070501,070504')
insert into ��ʦ
values('yaoyao180305','ҦҢ','������','yaoy@cug.edu.cn','080902')
insert into ��ʦ
values('songxiaoqing','��С��','������','sonniasxq@163.com','070501,070504')
insert into ��ʦ
values('qinyangmin07','������','������','qinyangmin2005@163.com','070501,070504')
insert into ��ʦ
values('huaweihua601','������','������','huaweihua@cug.edu.cn','080902')
insert into ��ʦ
values('gongjunfang1','������','������','jfgong@cug.edu.cn','080902')
insert into ��ʦ
values('lvjianjun007','������','����',' jjlv@cug.edu.cn','070501,070504')
insert into ��ʦ
values('panxiong0029','����','����','pxjlh@163.com','081201,081202,081205T')
insert into ��ʦ
values('lihui9790314','���','������','leelmars@gmail.com','070501,070504')
insert into ��ʦ
values('guomingqiang','����ǿ','������','8156485@qq.com','070501,070504')
insert into ��ʦ
values('huhuaimin214','������','������','huaimin_hu@cug.edu.cn.com','020101')
insert into ��ʦ
values('liangyueling','���h��','������','liangyueling@gmail.com','020101')
insert into ��ʦ
values('lijiangmin98','���','������','ljm1437@163.com','020101')
insert into ��ʦ
values('wenhui721206','�Ļ�','��ʦ','wenhui@cug.edu.cn.com','030503')
insert into ��ʦ
values('luwenzhong01','¬����','����','luwenzhong@cug.edu.cn.com','030503')
insert into ��ʦ
values('wuguobin7372','�����','������','wuguobin@cug.edu.cn.com','030503')
insert into ��ʦ
values('guoguanyu747','������','������','guoguanyu@cug.edu.cn.com','030503')
insert into ��ʦ
values('zguangyong09','�Ź���','����','zhgyong@163.com','070201')
insert into ��ʦ
values('hekaihua9809','�ο���','����','khhe@cug.edu.cn','070201')
insert into ��ʦ
values('liweifeng101','������','��ʦ','liweifeng@cug.edu.cn','070101')
insert into ��ʦ
values('xiaohaijun65','Ф����','����','xiaohaijun@cug.edu.cn','070101')
insert into ��ʦ
values('hupeng110709','����','������','hupeng@cug.edu.cn','070101')
insert into ��ʦ
values('zhaoyingke97','��Ӣ��','������','zykbox@cug.edu.cn','050201')
insert into ��ʦ
values('zhouliehong9','���Һ�','������','dzhyzhlh@163.com','050201')
insert into ��ʦ
values('wangguonian8','������','������','BobbyWang@cug.edu.cn','050201')
insert into ��ʦ
values('fanruoying11','����ӱ','������','fanruoying@cug.edu.cn','070901')




insert into ѧ��
values('1','tester2','��','2002.06.25','11D203')
insert into ѧ��
values('20201000830','tester','��','2002.06.25','11D203')
insert into ѧ��
values('20201003150','��','Ů','2002.10.14','11C201')
insert into ѧ�� 
values('20201003381','���','Ů','2002.10.6','11C201')
insert into ѧ��
values('20201000193','���Ľ�','��','2001.2.18','11C201')
insert into ѧ��
values('20201000398','��ѩ��','Ů','2001.8.26','11C202')
insert into ѧ��
values('20201000503','������','��','2002.8.19','11C202')
insert into ѧ��
values('20201000746','���','��','2002.2.5','11C202')
insert into ѧ��
values('20201000872','��ΰ��','��','2001.10.15','11C202')
insert into ѧ��
values('20201001016','�����','��','2002.1.23','11C203')
insert into ѧ��
values('20201001143','�ָĺ�','Ů','2002.5.18','11C203')
insert into ѧ��
values('20201001211','������','��','2001.9.22','11C203')
insert into ѧ��
values('20201001219','����Զ','Ů','2002.4.11','11D203')
insert into ѧ��
values('20201001379','����','Ů','2002.8.27','11D203')
insert into ѧ��
values('20201001567','��ٻ','��','2001.11.22','11D203')
insert into ѧ��
values('20201001705','���ٵ�','��','2002.5.15','11D203')
insert into ѧ��
values('20201001735','������','Ů','2002.9.23','11D203')
insert into ѧ��
values('20201001902','������','Ů','2002.3.7','11D203')
insert into ѧ��
values('20201002137','������','��','2001.10.7','11D201')
insert into ѧ��
values('20201002276','������','��','2001.10.10','11D201')
insert into ѧ��
values('20201002743','��ط��','��','2002.11.21','11D201')
insert into ѧ��
values('20201002920','��ƽƽ','Ů','2002.1.23','11D201')
insert into ѧ��
values('20201003024','ʩ����','Ů','2001.6.26','11D201')
insert into ѧ��
values('20201003038','�Է���','��','2002.2.11','11D202')
insert into ѧ��
values('20201003217','������','Ů','2002.9.9','11D202')
insert into ѧ��
values('20201003752','�����','��','2001.12.25','11D202')
insert into ѧ��
values('20201003578','����','��','2002.7.19','11D202')
insert into ѧ��
values('20201003559','�����','Ů','2002.1.24','11D202')
insert into ѧ��
values('20201004101','��ѧ��','��','2002.4.26','11J201')
insert into ѧ��
values('20201004321','����Զ','��','2002.3.14','11J201')
insert into ѧ��
values('20201004492','����','��','2001.3.18','11J202')
insert into ѧ��
values('20201002343','����','��','2001.3.3','11J202')
insert into ѧ��
values('20201000910','Ҧ��','��','2001.7.17','11J202')



insert into �γ�
values('2121271','�ߵ���ѧA','��������',6)
insert into �γ�
values('2121280','���Դ���A','��������',4)
insert into �γ�
values('2121301','��ѧ����C','��������',3)
insert into �γ�
values('2011960','��ͨ����ѧ','��������',3)
insert into �γ�
values('1200520','˼����������뷨�ɻ���','��������',3)
insert into �γ�
values('1170620','���˼�������ԭ�����','��������',3)
insert into �γ�
values('1092341','��ѧӢ��','��������',3)
insert into �γ�
values('8spoc00','�Ļ��Ų�����Ȼ�Ų�','ѡ��',2)
insert into �γ�
values('9spoc00','Ӣ������','ѡ��',2)
insert into �γ�
values('7080060','����ѧ����','ѡ��',2)
insert into �γ�
values('7040060','��̬ѧ����','ѡ��',2)
insert into �γ�
values('2193110','������߼����Գ�����ƣ�C++��','רҵ����',3)
insert into �γ�
values('2113060','��Ȼ����ѧ','רҵ����',2)
insert into �γ�
values('2010560','���ĵ���ѧ','רҵ����',2)
insert into �γ�
values('2171760','����ѧ����','רҵ����',1)
insert into �γ�
values('2113070','������Ϣϵͳԭ��A','רҵ����',3)
insert into �γ�
values('2113040','�����ѧ����','רҵ����',2)



insert into �ſα�
values('21212711', '��һ1-2��','A-406','liweifeng101',120,0, '2121271')
insert into �ſα�
values('21212712', '��һ3-4��','A-509','xiaohaijun65',120,0, '2121271')
insert into �ſα�
values('21212801', '��һ3-4��','A-212','liweifeng101',70,0, '2121280')
insert into �ſα�
values('21212802', '��һ3-4��','A-214','hupeng110709',70,0, '2121280')
insert into �ſα�
values('21213013', '��һ5-6��','A-212','zguangyong09',80,0, '2121301')
insert into �ſα�
values('21213023', '��һ5-6��','A-214','hekaihua9809',80,0, '2121301')
insert into �ſα�
values('20119600', '��һ7-8��','A-104','fanruoying11',30,0, '2011960')
insert into �ſα�
values('12005200', '��һ9-10��','A-111','wuguobin7372',100,0, '1200520')
insert into �ſα�
values('12005201', '��һ9-10��','A-406','guoguanyu747',100,0, '1200520')
insert into �ſα�
values('11706200', '�ܶ�1-2��','A-111','wenhui721206',90,0, '1170620')
insert into �ſα�
values('11706201', '�ܶ�1-2��','A-509','luwenzhong01',90,0, '1170620')
insert into �ſα�
values('10923410', '�ܶ�3-4��','A-310','zhaoyingke97',110,0, '1092341')
insert into �ſα�
values('10923420', '�ܶ�3-4��','A-406','zhouliehong9',110,0, '1092341')
insert into �ſα�
values('10923430', '�ܶ�3-4��','A-509','wangguonian8',110,0, '1092341')
insert into �ſα�
values('8spoc001', '�ܶ�5-6��','A-104','lijiangmin98',60,0, '8spoc00')
insert into �ſα�
values('8spoc002', '�ܶ�5-6��','A-105','liangyueling',60,0, '8spoc00')
insert into �ſα�
values('8spoc005', '�ܶ�7-8��','A-109','wangguonian8',50,0, '9spoc00')
insert into �ſα�
values('70800600', '�ܶ�7-8��','A-310','huhuaimin214',150,0, '7080060')
insert into �ſα�
values('70400600', '�ܶ�9-10��','A-310','qinyangmin07',100,0, '7040060')
insert into �ſα�
values('21931100', '����1-2��','A-104','qikunlun0630',50,0, '2193110')
insert into �ſα�
values('21931110', '����3-4��','A-105','guomingqiang',50,0, '2193110')
insert into �ſα�
values('41931200', '����5-8��','A-201','liuxiuguo225',30,0, '2193110')
insert into �ſα�
values('41931210', '����5-8��','A-202','panxiong0029',30,0, '2193110')
insert into �ſα�
values('41931220', '����5-8��','A-203','yaoyao180305',30,0, '2193110')
insert into �ſα�
values('41931230', '����9-12��','A-104','songxiaoqing',30,0, '2193110')
insert into �ſα�
values('41931240', '����9-12��','A-105','huaweihua601',30,0, '2193110')
insert into �ſα�
values('21130600', '����1-2��','A-109','lihui9790314',60,0, '2113060')
insert into �ſα�
values('21130700', '����1-2��','A-212','liujianyu106',60,0, '2113060')
insert into �ſα�
values('21130800', '����1-2��','A-214','lvjianjun007',60,0, '2113060')
insert into �ſα�
values('20105600', '����3-4��','A-212','songxiaoqing',60,0, '2010560')
insert into �ſα�
values('20105700', '����3-4��','A-214','guanqinfeng1',60,0, '2010560')
insert into �ſα�
values('21717600', '����3-4��','A-310','wanglunche13',150,0, '2171760')
insert into �ſα�
values('21130701', '����5-8��','A-201','gongjunfang1',30,0, '2113070')
insert into �ſα�
values('21130702', '����1-4��','A-202','chaoyi010701',30,0, '2113070')
insert into �ſα�
values('21130703', '����1-4��','A-203','yaoyao180305',30,0, '2113070')
insert into �ſα�
values('21130400', '����5-8��','A-109','qikunlun0630',70,0, '2113040')
insert into �ſα�
values('21130500', '����5-8��','A-111','huaweihua601',90,0, '2113040')



insert into �γ�ѧ��SC
values('1','21212711',null)
insert into �γ�ѧ��SC
values('20201000830','21212712',90)
insert into �γ�ѧ��SC
values('20201003150','21212712',90)
insert into �γ�ѧ��SC
values('20201003150','21212802',89)
insert into �γ�ѧ��SC
values('20201003150','21213023',81)
insert into �γ�ѧ��SC
values('20201003150','20119600',78)
insert into �γ�ѧ��SC
values('20201003150','12005200',77)
insert into �γ�ѧ��SC
values('20201003150','11706201',97)
insert into �γ�ѧ��SC
values('20201003150','10923430',92)
insert into �γ�ѧ��SC
values('20201003150','70400600',91)
insert into �γ�ѧ��SC
values('20201003150','41931240',73)
insert into �γ�ѧ��SC
values('20201003150','21130800',61)
insert into �γ�ѧ��SC
values('20201003150','21717600',69)
insert into �γ�ѧ��SC
values('20201003150','21130500',97)

insert into �γ�ѧ��SC
values('20201003381','21212712',89)
insert into �γ�ѧ��SC
values('20201003381','21212802',93)
insert into �γ�ѧ��SC
values('20201003381','21213023',94)
insert into �γ�ѧ��SC
values('20201003381','20119600',90)
insert into �γ�ѧ��SC
values('20201003381','12005200',90)
insert into �γ�ѧ��SC
values('20201003381','11706201',93)
insert into �γ�ѧ��SC
values('20201003381','10923430',82)
insert into �γ�ѧ��SC
values('20201003381','70400600',81)
insert into �γ�ѧ��SC
values('20201003381','21931100',87)
insert into �γ�ѧ��SC
values('20201003381','21130800',83)
insert into �γ�ѧ��SC
values('20201003381','21717600',90)
insert into �γ�ѧ��SC
values('20201003381','21130500',78)

insert into �γ�ѧ��SC
values('20201000193','21212712',78)
insert into �γ�ѧ��SC
values('20201000193','21212802',77)
insert into �γ�ѧ��SC
values('20201000193','21213023',90)
insert into �γ�ѧ��SC
values('20201000193','20119600',89)
insert into �γ�ѧ��SC
values('20201000193','12005200',76)
insert into �γ�ѧ��SC
values('20201000193','11706201',78)
insert into �γ�ѧ��SC
values('20201000193','10923430',84)
insert into �γ�ѧ��SC
values('20201000193','70400600',69)
insert into �γ�ѧ��SC
values('20201000193','41931240',74)
insert into �γ�ѧ��SC
values('20201000193','21130800',85)
insert into �γ�ѧ��SC
values('20201000193','21717600',87)
insert into �γ�ѧ��SC
values('20201000193','21130500',90)

insert into �γ�ѧ��SC
values('20201000398','21212712',78)
insert into �γ�ѧ��SC
values('20201000398','21212802',72)
insert into �γ�ѧ��SC
values('20201000398','21213023',73)
insert into �γ�ѧ��SC
values('20201000398','20119600',90)
insert into �γ�ѧ��SC
values('20201000398','12005200',80)
insert into �γ�ѧ��SC
values('20201000398','11706201',90)
insert into �γ�ѧ��SC
values('20201000398','10923430',92)
insert into �γ�ѧ��SC
values('20201000398','70400600',85)
insert into �γ�ѧ��SC
values('20201000398','21931100',82)
insert into �γ�ѧ��SC
values('20201000398','21130800',75)
insert into �γ�ѧ��SC
values('20201000398','21717600',81)
insert into �γ�ѧ��SC
values('20201000398','21130500',85)

insert into �γ�ѧ��SC
values('20201000503','21212712',90)
insert into �γ�ѧ��SC
values('20201000503','21212802',78)
insert into �γ�ѧ��SC
values('20201000503','21213023',79)
insert into �γ�ѧ��SC
values('20201000503','20119600',90)
insert into �γ�ѧ��SC
values('20201000503','12005200',99)
insert into �γ�ѧ��SC
values('20201000503','11706201',83)
insert into �γ�ѧ��SC
values('20201000503','10923430',78)
insert into �γ�ѧ��SC
values('20201000503','70400600',76)
insert into �γ�ѧ��SC
values('20201000503','21931100',76)
insert into �γ�ѧ��SC
values('20201000503','21130800',82)
insert into �γ�ѧ��SC
values('20201000503','21717600',81)
insert into �γ�ѧ��SC
values('20201000503','21130500',83)

insert into �γ�ѧ��SC
values('20201000746','21212712',90)
insert into �γ�ѧ��SC
values('20201000746','21212802',92)
insert into �γ�ѧ��SC
values('20201000746','21213023',91)
insert into �γ�ѧ��SC
values('20201000746','20119600',93)
insert into �γ�ѧ��SC
values('20201000746','12005200',83)
insert into �γ�ѧ��SC
values('20201000746','11706201',89)
insert into �γ�ѧ��SC
values('20201000746','10923430',94)
insert into �γ�ѧ��SC
values('20201000746','70400600',91)
insert into �γ�ѧ��SC
values('20201000746','21931100',87)
insert into �γ�ѧ��SC
values('20201000746','21130800',91)
insert into �γ�ѧ��SC
values('20201000746','21717600',77)
insert into �γ�ѧ��SC
values('20201000746','21130500',90)

insert into �γ�ѧ��SC
values('20201000872','21212712',89)
insert into �γ�ѧ��SC
values('20201000872','21212802',88)
insert into �γ�ѧ��SC
values('20201000872','21213023',89)
insert into �γ�ѧ��SC
values('20201000872','20119600',90)
insert into �γ�ѧ��SC
values('20201000872','12005200',90)
insert into �γ�ѧ��SC
values('20201000872','11706201',88)
insert into �γ�ѧ��SC
values('20201000872','10923430',83)
insert into �γ�ѧ��SC
values('20201000872','70400600',85)
insert into �γ�ѧ��SC
values('20201000872','21931100',87)
insert into �γ�ѧ��SC
values('20201000872','21130800',87)
insert into �γ�ѧ��SC
values('20201000872','21717600',90)
insert into �γ�ѧ��SC
values('20201000872','21130500',81)

insert into �γ�ѧ��SC
values('20201001016','21212712',63)
insert into �γ�ѧ��SC
values('20201001016','21212802',78)
insert into �γ�ѧ��SC
values('20201001016','21213023',90)
insert into �γ�ѧ��SC
values('20201001016','20119600',87)
insert into �γ�ѧ��SC
values('20201001016','12005200',83)
insert into �γ�ѧ��SC
values('20201001016','11706201',78)
insert into �γ�ѧ��SC
values('20201001016','10923430',90)
insert into �γ�ѧ��SC
values('20201001016','70400600',76)
insert into �γ�ѧ��SC
values('20201001016','21931100',65)
insert into �γ�ѧ��SC
values('20201001016','21130800',74)
insert into �γ�ѧ��SC
values('20201001016','21717600',69)
insert into �γ�ѧ��SC
values('20201001016','21130500',68)

insert into �γ�ѧ��SC
values('20201001143','21212712',92)
insert into �γ�ѧ��SC
values('20201001143','21212802',87)
insert into �γ�ѧ��SC
values('20201001143','21213023',93)
insert into �γ�ѧ��SC
values('20201001143','20119600',83)
insert into �γ�ѧ��SC
values('20201001143','12005200',84)
insert into �γ�ѧ��SC
values('20201001143','11706201',78)
insert into �γ�ѧ��SC
values('20201001143','10923430',76)
insert into �γ�ѧ��SC
values('20201001143','70400600',78)
insert into �γ�ѧ��SC
values('20201001143','21931100',90)
insert into �γ�ѧ��SC
values('20201001143','21130800',98)
insert into �γ�ѧ��SC
values('20201001143','21717600',93)
insert into �γ�ѧ��SC
values('20201001143','21130500',90)

insert into �γ�ѧ��SC
values('20201001211','21212712',90)
insert into �γ�ѧ��SC
values('20201001211','21212802',89)
insert into �γ�ѧ��SC
values('20201001211','21213023',88)
insert into �γ�ѧ��SC
values('20201001211','20119600',83)
insert into �γ�ѧ��SC
values('20201001211','12005200',85)
insert into �γ�ѧ��SC
values('20201001211','11706201',87)
insert into �γ�ѧ��SC
values('20201001211','10923430',78)
insert into �γ�ѧ��SC
values('20201001211','70400600',79)
insert into �γ�ѧ��SC
values('20201001211','21931100',73)
insert into �γ�ѧ��SC
values('20201001211','21130800',89)
insert into �γ�ѧ��SC
values('20201001211','21717600',90)
insert into �γ�ѧ��SC
values('20201001211','21130500',95)

insert into �γ�ѧ��SC
values('20201001219','21212711',79)
insert into �γ�ѧ��SC
values('20201001219','21212801',89)
insert into �γ�ѧ��SC
values('20201001219','21213013',87)
insert into �γ�ѧ��SC
values('20201001219','20119600',90)
insert into �γ�ѧ��SC
values('20201001219','12005200',79)
insert into �γ�ѧ��SC
values('20201001219','11706200',67)
insert into �γ�ѧ��SC
values('20201001219','10923410',78)
insert into �γ�ѧ��SC
values('20201001219','70400600',79)
insert into �γ�ѧ��SC
values('20201001219','21931100',90)
insert into �γ�ѧ��SC
values('20201001219','21130600',84)
insert into �γ�ѧ��SC
values('20201001219','20105600',83)
insert into �γ�ѧ��SC
values('20201001219','21717600',73)
insert into �γ�ѧ��SC
values('20201001219','21130701',74)
insert into �γ�ѧ��SC
values('20201001219','21130400',78)

insert into �γ�ѧ��SC
values('20201001379','21212711',78)
insert into �γ�ѧ��SC
values('20201001379','21212801',69)
insert into �γ�ѧ��SC
values('20201001379','21213013',60)
insert into �γ�ѧ��SC
values('20201001379','20119600',90)
insert into �γ�ѧ��SC
values('20201001379','12005200',97)
insert into �γ�ѧ��SC
values('20201001379','11706200',90)
insert into �γ�ѧ��SC
values('20201001379','10923410',76)
insert into �γ�ѧ��SC
values('20201001379','70400600',67)
insert into �γ�ѧ��SC
values('20201001379','41931220',64)
insert into �γ�ѧ��SC
values('20201001379','21130600',74)
insert into �γ�ѧ��SC
values('20201001379','20105600',79)
insert into �γ�ѧ��SC
values('20201001379','21717600',78)
insert into �γ�ѧ��SC
values('20201001379','21130701',75)
insert into �γ�ѧ��SC
values('20201001379','21130400',70)

insert into �γ�ѧ��SC
values('20201001567','21212711',90)
insert into �γ�ѧ��SC
values('20201001567','21212801',87)
insert into �γ�ѧ��SC
values('20201001567','21213013',67)
insert into �γ�ѧ��SC
values('20201001567','20119600',76)
insert into �γ�ѧ��SC
values('20201001567','12005200',89)
insert into �γ�ѧ��SC
values('20201001567','11706200',82)
insert into �γ�ѧ��SC
values('20201001567','10923410',87)
insert into �γ�ѧ��SC
values('20201001567','70400600',85)
insert into �γ�ѧ��SC
values('20201001567','41931220',89)
insert into �γ�ѧ��SC
values('20201001567','21130600',77)
insert into �γ�ѧ��SC
values('20201001567','20105600',74)
insert into �γ�ѧ��SC
values('20201001567','21717600',84)
insert into �γ�ѧ��SC
values('20201001567','21130701',83)
insert into �γ�ѧ��SC
values('20201001567','21130400',73)

insert into �γ�ѧ��SC
values('20201001705','21212711',78)
insert into �γ�ѧ��SC
values('20201001705','21212801',90)
insert into �γ�ѧ��SC
values('20201001705','21213013',92)
insert into �γ�ѧ��SC
values('20201001705','20119600',89)
insert into �γ�ѧ��SC
values('20201001705','12005200',90)
insert into �γ�ѧ��SC
values('20201001705','11706200',83)
insert into �γ�ѧ��SC
values('20201001705','10923410',78)
insert into �γ�ѧ��SC
values('20201001705','70400600',62)
insert into �γ�ѧ��SC
values('20201001705','41931220',65)
insert into �γ�ѧ��SC
values('20201001705','21130600',92)
insert into �γ�ѧ��SC
values('20201001705','20105600',88)
insert into �γ�ѧ��SC
values('20201001705','21717600',87)
insert into �γ�ѧ��SC
values('20201001705','21130701',82)
insert into �γ�ѧ��SC
values('20201001705','21130400',79)

insert into �γ�ѧ��SC
values('20201001735','21212711',88)
insert into �γ�ѧ��SC
values('20201001735','21212801',91)
insert into �γ�ѧ��SC
values('20201001735','21213013',65)
insert into �γ�ѧ��SC
values('20201001735','20119600',60)
insert into �γ�ѧ��SC
values('20201001735','12005200',80)
insert into �γ�ѧ��SC
values('20201001735','11706200',88)
insert into �γ�ѧ��SC
values('20201001735','10923410',99)
insert into �γ�ѧ��SC
values('20201001735','70400600',93)
insert into �γ�ѧ��SC
values('20201001735','41931220',93)
insert into �γ�ѧ��SC
values('20201001735','21130600',98)
insert into �γ�ѧ��SC
values('20201001735','20105600',78)
insert into �γ�ѧ��SC
values('20201001735','21717600',72)
insert into �γ�ѧ��SC
values('20201001735','21130701',81)
insert into �γ�ѧ��SC
values('20201001735','21130400',83)

insert into �γ�ѧ��SC
values('20201001902','21212711',85)
insert into �γ�ѧ��SC
values('20201001902','21212801',80)
insert into �γ�ѧ��SC
values('20201001902','21213013',85)
insert into �γ�ѧ��SC
values('20201001902','20119600',78)
insert into �γ�ѧ��SC
values('20201001902','12005200',75)
insert into �γ�ѧ��SC
values('20201001902','11706200',73)
insert into �γ�ѧ��SC
values('20201001902','10923410',71)
insert into �γ�ѧ��SC
values('20201001902','70400600',65)
insert into �γ�ѧ��SC
values('20201001902','41931220',67)
insert into �γ�ѧ��SC
values('20201001902','21130600',69)
insert into �γ�ѧ��SC
values('20201001902','20105600',99)
insert into �γ�ѧ��SC
values('20201001902','21717600',91)
insert into �γ�ѧ��SC
values('20201001902','21130701',89)
insert into �γ�ѧ��SC
values('20201001902','21130400',88)

insert into �γ�ѧ��SC
values('20201002137','21212711',81)
insert into �γ�ѧ��SC
values('20201002137','21212801',78)
insert into �γ�ѧ��SC
values('20201002137','21213013',90)
insert into �γ�ѧ��SC
values('20201002137','20119600',88)
insert into �γ�ѧ��SC
values('20201002137','12005200',79)
insert into �γ�ѧ��SC
values('20201002137','11706200',67)
insert into �γ�ѧ��SC
values('20201002137','10923410',78)
insert into �γ�ѧ��SC
values('20201002137','70400600',90)
insert into �γ�ѧ��SC
values('20201002137','41931220',98)
insert into �γ�ѧ��SC
values('20201002137','21130600',81)
insert into �γ�ѧ��SC
values('20201002137','20105600',85)
insert into �γ�ѧ��SC
values('20201002137','21717600',78)
insert into �γ�ѧ��SC
values('20201002137','21130701',79)
insert into �γ�ѧ��SC
values('20201002137','21130400',75)

insert into �γ�ѧ��SC
values('20201002276','21212711',90)
insert into �γ�ѧ��SC
values('20201002276','21212801',78)
insert into �γ�ѧ��SC
values('20201002276','21213013',99)
insert into �γ�ѧ��SC
values('20201002276','20119600',78)
insert into �γ�ѧ��SC
values('20201002276','12005200',76)
insert into �γ�ѧ��SC
values('20201002276','11706200',69)
insert into �γ�ѧ��SC
values('20201002276','10923410',88)
insert into �γ�ѧ��SC
values('20201002276','70400600',86)
insert into �γ�ѧ��SC
values('20201002276','41931220',82)
insert into �γ�ѧ��SC
values('20201002276','21130600',67)
insert into �γ�ѧ��SC
values('20201002276','20105600',69)
insert into �γ�ѧ��SC
values('20201002276','21717600',72)
insert into �γ�ѧ��SC
values('20201002276','21130701',76)
insert into �γ�ѧ��SC
values('20201002276','21130400',81)

insert into �γ�ѧ��SC
values('20201002743','21212711',88)
insert into �γ�ѧ��SC
values('20201002743','21212801',83)
insert into �γ�ѧ��SC
values('20201002743','21213013',78)
insert into �γ�ѧ��SC
values('20201002743','20119600',90)
insert into �γ�ѧ��SC
values('20201002743','12005200',92)
insert into �γ�ѧ��SC
values('20201002743','11706200',78)
insert into �γ�ѧ��SC
values('20201002743','10923410',77)
insert into �γ�ѧ��SC
values('20201002743','70400600',76)
insert into �γ�ѧ��SC
values('20201002743','41931220',98)
insert into �γ�ѧ��SC
values('20201002743','21130600',69)
insert into �γ�ѧ��SC
values('20201002743','20105600',81)
insert into �γ�ѧ��SC
values('20201002743','21717600',84)
insert into �γ�ѧ��SC
values('20201002743','21130701',89)
insert into �γ�ѧ��SC
values('20201002743','21130400',89)

insert into �γ�ѧ��SC
values('20201002920','21212711',90)
insert into �γ�ѧ��SC
values('20201002920','21212801',88)
insert into �γ�ѧ��SC
values('20201002920','21213013',78)
insert into �γ�ѧ��SC
values('20201002920','20119600',99)
insert into �γ�ѧ��SC
values('20201002920','12005200',73)
insert into �γ�ѧ��SC
values('20201002920','11706200',78)
insert into �γ�ѧ��SC
values('20201002920','10923410',89)
insert into �γ�ѧ��SC
values('20201002920','70400600',67)
insert into �γ�ѧ��SC
values('20201002920','21931100',90)
insert into �γ�ѧ��SC
values('20201002920','21130600',92)
insert into �γ�ѧ��SC
values('20201002920','20105600',87)
insert into �γ�ѧ��SC
values('20201002920','21717600',82)
insert into �γ�ѧ��SC
values('20201002920','21130701',81)
insert into �γ�ѧ��SC
values('20201002920','21130400',87)

insert into �γ�ѧ��SC
values('20201003024','21212711',90)
insert into �γ�ѧ��SC
values('20201003024','21212801',91)
insert into �γ�ѧ��SC
values('20201003024','21213013',90)
insert into �γ�ѧ��SC
values('20201003024','20119600',90)
insert into �γ�ѧ��SC
values('20201003024','12005200',100)
insert into �γ�ѧ��SC
values('20201003024','11706200',99)
insert into �γ�ѧ��SC
values('20201003024','10923410',90)
insert into �γ�ѧ��SC
values('20201003024','70400600',89)
insert into �γ�ѧ��SC
values('20201003024','21931100',90)
insert into �γ�ѧ��SC
values('20201003024','21130600',94)
insert into �γ�ѧ��SC
values('20201003024','20105600',89)
insert into �γ�ѧ��SC
values('20201003024','21717600',88)
insert into �γ�ѧ��SC
values('20201003024','21130701',99)
insert into �γ�ѧ��SC
values('20201003024','21130400',90)

insert into �γ�ѧ��SC
values('20201003038','21212711',67)
insert into �γ�ѧ��SC
values('20201003038','21212801',65)
insert into �γ�ѧ��SC
values('20201003038','21213013',67)
insert into �γ�ѧ��SC
values('20201003038','20119600',78)
insert into �γ�ѧ��SC
values('20201003038','12005200',79)
insert into �γ�ѧ��SC
values('20201003038','11706200',89)
insert into �γ�ѧ��SC
values('20201003038','10923410',90)
insert into �γ�ѧ��SC
values('20201003038','70400600',81)
insert into �γ�ѧ��SC
values('20201003038','41931210',69)
insert into �γ�ѧ��SC
values('20201003038','21130700',90)
insert into �γ�ѧ��SC
values('20201003038','20105700',88)
insert into �γ�ѧ��SC
values('20201003038','21717600',78)
insert into �γ�ѧ��SC
values('20201003038','21130702',67)
insert into �γ�ѧ��SC
values('20201003038','21130400',89)

insert into �γ�ѧ��SC
values('20201003217','21212711',91)
insert into �γ�ѧ��SC
values('20201003217','21212801',90)
insert into �γ�ѧ��SC
values('20201003217','21213013',79)
insert into �γ�ѧ��SC
values('20201003217','20119600',76)
insert into �γ�ѧ��SC
values('20201003217','12005200',87)
insert into �γ�ѧ��SC
values('20201003217','11706200',83)
insert into �γ�ѧ��SC
values('20201003217','10923410',90)
insert into �γ�ѧ��SC
values('20201003217','70400600',71)
insert into �γ�ѧ��SC
values('20201003217','21931110',90)
insert into �γ�ѧ��SC
values('20201003217','21130700',93)
insert into �γ�ѧ��SC
values('20201003217','20105700',96)
insert into �γ�ѧ��SC
values('20201003217','21717600',84)
insert into �γ�ѧ��SC
values('20201003217','21130702',81)
insert into �γ�ѧ��SC
values('20201003217','21130400',83)

insert into �γ�ѧ��SC
values('20201003752','21212711',89)
insert into �γ�ѧ��SC
values('20201003752','21212801',87)
insert into �γ�ѧ��SC
values('20201003752','21213013',93)
insert into �γ�ѧ��SC
values('20201003752','20119600',78)
insert into �γ�ѧ��SC
values('20201003752','12005200',77)
insert into �γ�ѧ��SC
values('20201003752','11706200',80)
insert into �γ�ѧ��SC
values('20201003752','10923410',85)
insert into �γ�ѧ��SC
values('20201003752','70400600',88)
insert into �γ�ѧ��SC
values('20201003752','21931110',91)
insert into �γ�ѧ��SC
values('20201003752','21130700',89)
insert into �γ�ѧ��SC
values('20201003752','20105700',84)
insert into �γ�ѧ��SC
values('20201003752','21717600',90)
insert into �γ�ѧ��SC
values('20201003752','21130702',96)
insert into �γ�ѧ��SC
values('20201003752','21130400',95)

insert into �γ�ѧ��SC
values('20201003578','21212711',98)
insert into �γ�ѧ��SC
values('20201003578','21212801',97)
insert into �γ�ѧ��SC
values('20201003578','21213013',88)
insert into �γ�ѧ��SC
values('20201003578','20119600',83)
insert into �γ�ѧ��SC
values('20201003578','12005200',82)
insert into �γ�ѧ��SC
values('20201003578','11706200',90)
insert into �γ�ѧ��SC
values('20201003578','10923410',90)
insert into �γ�ѧ��SC
values('20201003578','70400600',91)
insert into �γ�ѧ��SC
values('20201003578','21931110',90)
insert into �γ�ѧ��SC
values('20201003578','21130700',89)
insert into �γ�ѧ��SC
values('20201003578','20105700',97)
insert into �γ�ѧ��SC
values('20201003578','21717600',91)
insert into �γ�ѧ��SC
values('20201003578','21130702',89)
insert into �γ�ѧ��SC
values('20201003578','21130400',90)

insert into �γ�ѧ��SC
values('20201003559','21212711',98)
insert into �γ�ѧ��SC
values('20201003559','21212801',87)
insert into �γ�ѧ��SC
values('20201003559','21213013',82)
insert into �γ�ѧ��SC
values('20201003559','20119600',89)
insert into �γ�ѧ��SC
values('20201003559','12005200',90)
insert into �γ�ѧ��SC
values('20201003559','11706200',60)
insert into �γ�ѧ��SC
values('20201003559','10923410',80)
insert into �γ�ѧ��SC
values('20201003559','70400600',87)
insert into �γ�ѧ��SC
values('20201003559','41931210',72)
insert into �γ�ѧ��SC
values('20201003559','21130700',73)
insert into �γ�ѧ��SC
values('20201003559','20105700',74)
insert into �γ�ѧ��SC
values('20201003559','21717600',78)
insert into �γ�ѧ��SC
values('20201003559','21130702',88)
insert into �γ�ѧ��SC
values('20201003559','21130400',90)

insert into �γ�ѧ��SC
values('20201004101','21212712',90)
insert into �γ�ѧ��SC
values('20201004101','21212802',99)
insert into �γ�ѧ��SC
values('20201004101','21213023',76)
insert into �γ�ѧ��SC
values('20201004101','12005201',79)
insert into �γ�ѧ��SC
values('20201004101','11706200',88)
insert into �γ�ѧ��SC
values('20201004101','10923420',89)
insert into �γ�ѧ��SC
values('20201004101','70400600',90)
insert into �γ�ѧ��SC
values('20201004101','41931230',81)
insert into �γ�ѧ��SC
values('20201004101','21717600',73)
insert into �γ�ѧ��SC
values('20201004101','21130703',72)
insert into �γ�ѧ��SC
values('20201004101','21130500',77)

insert into �γ�ѧ��SC
values('20201004321','21212712',87)
insert into �γ�ѧ��SC
values('20201004321','21212802',78)
insert into �γ�ѧ��SC
values('20201004321','21213023',90)
insert into �γ�ѧ��SC
values('20201004321','12005201',84)
insert into �γ�ѧ��SC
values('20201004321','11706200',83)
insert into �γ�ѧ��SC
values('20201004321','10923420',86)
insert into �γ�ѧ��SC
values('20201004321','70400600',97)
insert into �γ�ѧ��SC
values('20201004321','41931230',90)
insert into �γ�ѧ��SC
values('20201004321','21717600',69)
insert into �γ�ѧ��SC
values('20201004321','21130703',75)
insert into �γ�ѧ��SC
values('20201004321','21130500',79)

insert into �γ�ѧ��SC
values('20201004492','21212712',90)
insert into �γ�ѧ��SC
values('20201004492','21212802',89)
insert into �γ�ѧ��SC
values('20201004492','21213023',88)
insert into �γ�ѧ��SC
values('20201004492','12005201',81)
insert into �γ�ѧ��SC
values('20201004492','11706200',95)
insert into �γ�ѧ��SC
values('20201004492','10923420',94)
insert into �γ�ѧ��SC
values('20201004492','70400600',90)
insert into �γ�ѧ��SC
values('20201004492','21931110',92)
insert into �γ�ѧ��SC
values('20201004492','21717600',78)
insert into �γ�ѧ��SC
values('20201004492','21130703',79)
insert into �γ�ѧ��SC
values('20201004492','21130500',85)

insert into �γ�ѧ��SC
values('20201002343','21212712',78)
insert into �γ�ѧ��SC
values('20201002343','21212802',82)
insert into �γ�ѧ��SC
values('20201002343','21213023',85)
insert into �γ�ѧ��SC
values('20201002343','12005201',67)
insert into �γ�ѧ��SC
values('20201002343','11706200',76)
insert into �γ�ѧ��SC
values('20201002343','10923420',92)
insert into �γ�ѧ��SC
values('20201002343','70400600',90)
insert into �γ�ѧ��SC
values('20201002343','41931200',92)
insert into �γ�ѧ��SC
values('20201002343','21717600',97)
insert into �γ�ѧ��SC
values('20201002343','21130703',88)
insert into �γ�ѧ��SC
values('20201002343','21130500',84)

insert into �γ�ѧ��SC
values('20201000910','21212712',65)
insert into �γ�ѧ��SC
values('20201000910','21212802',79)
insert into �γ�ѧ��SC
values('20201000910','21213023',87)
insert into �γ�ѧ��SC
values('20201000910','12005201',92)
insert into �γ�ѧ��SC
values('20201000910','11706200',93)
insert into �γ�ѧ��SC
values('20201000910','10923420',79)
insert into �γ�ѧ��SC
values('20201000910','70400600',89)
insert into �γ�ѧ��SC
values('20201000910','21931110',73)
insert into �γ�ѧ��SC
values('20201000910','21717600',76)
insert into �γ�ѧ��SC
values('20201000910','21130703',79)
insert into �γ�ѧ��SC
values('20201000910','21130500',63)

insert into �γ�ѧ��SC
values('20201002743','8spoc002',91)
insert into �γ�ѧ��SC
values('20201002743','8spoc005',90)
insert into �γ�ѧ��SC
values('20201002743','70800600',93)
insert into �γ�ѧ��SC
values('20201003038','8spoc001',98)
insert into �γ�ѧ��SC
values('20201003038','8spoc005',100)
insert into �γ�ѧ��SC
values('20201003038','70800600',95)
insert into �γ�ѧ��SC
values('20201001016','8spoc001',88)
insert into �γ�ѧ��SC
values('20201001016','8spoc005',97)
insert into �γ�ѧ��SC
values('20201001016','70800600',96)
insert into �γ�ѧ��SC
values('20201001567','8spoc002',90)
insert into �γ�ѧ��SC
values('20201001567','8spoc005',87)
insert into �γ�ѧ��SC
values('20201001567','70800600',82)



/*GRANT*/
insert into ����Ա�����
values('Admin','e10adc3949ba59abbe56e057f20f883e')

insert into ѧ�������
values('20201003150','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ������� 
values('20201003381','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000193','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000398','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000503','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000746','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000872','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001016','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001143','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001211','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001219','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001379','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001567','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001705','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001735','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201001902','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201002137','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201002276','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201002743','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201002920','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201003024','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201003038','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201003217','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201003752','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201003578','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201003559','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201004101','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201004321','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201004492','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201002343','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000910','e10adc3949ba59abbe56e057f20f883e')
insert into ѧ�������
values('20201000830','e10adc3949ba59abbe56e057f20f883e')

insert into ��ʦ�����
values('qikunlun0630','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('wanglunche13','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('liuxiuguo225','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('chaoyi010701','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('guanqinfeng1','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('liujianyu106','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('yaoyao180305','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('songxiaoqing','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('qinyangmin07','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('huaweihua601','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('gongjunfang1','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('lvjianjun007','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('panxiong0029','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('lihui9790314','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('guomingqiang','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('huhuaimin214','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('liangyueling','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('lijiangmin98','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('wenhui721206','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('luwenzhong01','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('wuguobin7372','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('guoguanyu747','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('zguangyong09','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('hekaihua9809','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('liweifeng101','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('xiaohaijun65','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('hupeng110709','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('zhaoyingke97','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('zhouliehong9','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('wangguonian8','e10adc3949ba59abbe56e057f20f883e')
insert into ��ʦ�����
values('fanruoying11','e10adc3949ba59abbe56e057f20f883e')