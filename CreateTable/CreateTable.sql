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

create table ��ѧ��
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
foreign key(�γ̽�ѧID) references ��ѧ��(�γ̽�ѧID)
)

create table �û���ȫ��Ϣ          
(	
�û��� varchar(20) PRIMARY KEY,                          
���� varchar(max), 
��� varchar(20),
�ֻ����� varchar(11),
�û���Ƭ image
); 
