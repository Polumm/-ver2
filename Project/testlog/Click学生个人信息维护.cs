﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace testlog
{
    public partial class Click学生个人信息维护 : Form
    {
        string Sno = "20201000830";
        public Click学生个人信息维护()
        {
            InitializeComponent();
        }
        
        public Click学生个人信息维护(string id)
        {
            Sno = id;
            InitializeComponent();
            show_info();
        }

        private void button_save_Click(object sender, EventArgs e)
        {
            string sql1 = "update 用户安全信息 set 手机号码 = '" + textBox_mobile.Text + "' where 用户名 = '" + Sno + "'";
            Door update1 = new Door();
            try
            {
                update1.Excute(sql1);
            }
            catch
            {
                MessageBox.Show("手机号输入违法！");
                return;
            }

            string sql2 = "update 学生 set 姓名 = '" + textBox_sname.Text + "' ,性别 = '" + comboBox_sex.Text + "' ,出生日期 = '" + dateTimePicker1.Value.ToString() + "' where 学号 = '" + Sno + "'";
            Door update2 = new Door();
            try
            {
                update2.Excute(sql2);
            }
            catch
            {
                MessageBox.Show("学生信息输入违法！");
                return;
            }
            MessageBox.Show("修改成功！");
            show_info();
        }
        
        private void show_info()
        {
            string sql1 = "select * from 学生信息表 where 学号 = '"+ Sno + "'";
            Door load1 = new Door();
            IDataReader dr1 = load1.Reader(sql1);//Reader是Door封装的读入方法
            while (dr1.Read())
            {
                textBox_sname.Text = dr1["姓名"].ToString();
                comboBox_sex.Text = dr1["性别"].ToString();
                label_sdept.Text = dr1["系"].ToString();
                label19.Text = dr1["学院"].ToString();
                label16.Text = dr1["专业"].ToString();
                dateTimePicker1.Text = dr1["出生年月"].ToString();
            }
            string sql2 = "select * from 用户安全信息 where 用户名 = '" + Sno + "'";
            Door load2 = new Door();
            IDataReader dr2 = load2.Reader(sql2);//Reader是Door封装的读入方法
            while (dr2.Read())
            {
                label_Sno.Text = dr2["用户名"].ToString();
                textBox_mobile.Text = dr2["手机号码"].ToString();
            }
        }

        private void button_back_Click(object sender, EventArgs e)
        {
            show_info();
        }
    }
}
