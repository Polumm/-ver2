/*ѧ��ѡ�α��ǰ����ͼ����������ѧ��ѡ�α���������γ�ѧ��SC��Ĵ������������*/
create view ��ѧ�൱ǰѡ�����(�γ̽�ѧID,�Ͽ�ʱ��,�ƻ�����,��ǰ����)
as
select �γ̽�ѧID,�Ͽ�ʱ��,�ƻ�����,��ѡ����
from �ſα�
/*���ӿγ̱�ȡ�üƻ�����*/

go
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
	select @�ƻ�����=�ƻ�����, @��ǰ����=��ǰ���� from ��ѧ�൱ǰѡ����� where �γ̽�ѧID=@�γ̽�ѧID;
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
	if(@�ɼ�_before is null)
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
	else
	begin
		rollback transaction
		if (update(�ɼ�))
		begin
			print '��¼�뼨�㣬�����޸ģ�'
		end
		else if(update(ѧ��) or update(�γ̽�ѧID))
		begin
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