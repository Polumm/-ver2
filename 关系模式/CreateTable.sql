create table ϵ
(
ϵ��� varchar(30) primary key,
ϵ�� varchar(40),
ϵ�칫�ҵ绰 varchar(50)
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
�γ̺� varchar(20) primary key,
�γ��� varchar(40),
�γ����� varchar(20) check(�γ����� in ('��������','רҵ����','ѡ��')),/*check����Լ�����޶��γ�����*/
ѧ�� tinyint,
)

create table �γ�ѧ��SC
(
ѧ�� varchar(20),
�γ̺� varchar(20),
�ɼ� float,
primary key(ѧ��,�γ̺�),
foreign key(ѧ��) references ѧ��(ѧ��),
foreign key(�γ̺�) references �γ�(�γ̺�)
)

create table �γ̽�ʦTC
(
�γ̺� varchar(20),
��ʦ��� varchar(20),
�Ͽ�ʱ�� varchar(40),
�ƻ����� tinyint,
primary key(��ʦ���,�γ̺�,�Ͽ�ʱ��),
foreign key(��ʦ���) references ��ʦ(��ʦ���),
foreign key(�γ̺�) references �γ�(�γ̺�)
)

create table �γ̽���CC
(
�γ̺� varchar(20),
���ұ�� varchar(10),
�Ͽ�ʱ�� varchar(40),
primary key(���ұ��,�γ̺�,�Ͽ�ʱ��),
foreign key(���ұ��) references ����(���ұ��),
foreign key(�γ̺�) references �γ�(�γ̺�)
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