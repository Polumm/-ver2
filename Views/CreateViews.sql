/*用于学生信息的管理维护*/
create view 学生信息表(班级,学号,姓名,性别,出生年月,系,学院,专业)
as
select 学生.班级编号,学号,姓名,性别,出生日期,系名,学院,专业 
from 学生,班,系
where 学生.班级编号=班.班级编号 and 系.系编号=班.系编号
go

/*用于教师信息管理维护*/
create view 教师信息表(姓名,教师编号,职称,联系方式,系,系编号, 学院)
as
select 姓名,教师编号,职称,联系方式,系名,系.系编号,学院
from 教师, 系
where 教师.系编号 = 系.系编号
go

/*用于选课和教学任务查询，全校可见，基于排课表*/
create view 学生可选课表(课程教学ID, 课程, 课程号, 课程类型, 学分, 教师编号,授课老师, 空间位置, 教室编号, 上课时间, 计划上限, 当前人数)
as
select 课程教学ID, 课程.课程名, 课程.课程代号, 课程类型 ,学分, 教师.教师编号, 教师.姓名, 空间位置, 排课表.教室编号, 上课时间, 排课表.计划上限, 排课表.已选人数
from 课程, 教师, 教室, 排课表
where 排课表.课程代号 = 课程.课程代号 and 排课表.教师编号 = 教师.教师编号 and 排课表.教室编号 = 教室.教室编号
go

/*用于查看选课记录，部分可见部分隐藏，基于课程学生SC表*/
create view 学生当前选课情况(课程教学ID, 学号, 课程, 课程号, 课程类型, 学分, 授课老师, 空间位置, 教室编号, 上课时间, 计划上限, 当前人数)
as
select 排课表.课程教学ID, 学号, 课程.课程名, 课程.课程代号 ,课程类型, 学分, 教师.姓名, 空间位置, 排课表.教室编号, 上课时间, 排课表.计划上限, 排课表.已选人数
from 课程, 教师, 教室, 排课表, 课程学生SC
where  排课表.课程教学ID = 课程学生SC.课程教学ID and 排课表.课程代号 = 课程.课程代号 and 排课表.教师编号 = 教师.教师编号 and 排课表.教室编号 = 教室.教室编号
go

/*用于学生成绩总表打印*/
create view 学生成绩评价表(学号,姓名,课程号,课程,学分,课程类型,成绩,等级,绩点,权重)
as
select 学生.学号,姓名,排课表.课程代号,课程.课程名,学分,课程类型,成绩,等级,绩点,权重
from 学生,课程,课程学生SC,绩点模型,排课表
where 课程学生SC.学号=学生.学号 and 课程学生SC.课程教学ID = 排课表.课程教学ID and 排课表.课程代号 = 课程.课程代号 and 课程学生SC.学号=绩点模型.学号 and 课程.课程代号 = 绩点模型.课程代号
go


/*平均学分绩点的计算*/
create view 年级排名表(学号,姓名,学院,专业,系,班级,已修学分,平均学分绩点)
as
select 学生.学号,姓名,学院,专业,系名,学生.班级编号,总学分,平均学分绩点 
from
学生, 班, 系,(select 学生.学号,总学分,总绩点/总学分 平均学分绩点 from 学生,(select 学号,Sum(学分) from 学生成绩评价表 group by 学号) as temporary1(学号,总学分),(select 学号,Sum(学分*绩点*权重) from 学生成绩评价表 group by 学号) as temporary2(学号,总绩点) where 学生.学号=temporary1.学号 and 学生.学号=temporary2.学号) as temporary3
where 学生.班级编号=班.班级编号 and 系.系编号=班.系编号 and 学生.学号 = temporary3.学号
go
