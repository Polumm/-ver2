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
    public partial class 学生功能区界面 : Form
    {
        String SID1;
        public 学生功能区界面()
        {
            InitializeComponent();
            toolStripStatusLabel3.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            timer1.Start();
        }
        
        public 学生功能区界面(String SID)
        {
            SID1 = SID;
            InitializeComponent();
            toolStripStatusLabel3.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            timer1.Start();
        }



        private void 个人课表查询ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click学生个人课表查询 Choose_course = new Click学生个人课表查询();
            Choose_course.ShowDialog();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            toolStripStatusLabel3.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }

        private void 个人课表查询ToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Click学生个人课表查询 Choose_course = new Click学生个人课表查询(SID1);
            Choose_course.ShowDialog();
        }

        private void 成绩总表打印ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click学生成绩总表打印 Choose_course = new Click学生成绩总表打印(SID1);
            Choose_course.ShowDialog();
        }

        private void 修改密码ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click修改密码 Update_password = new Click修改密码(SID1, "学生");
            Update_password.ShowDialog();
        }


        private void 信息查询ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click学生成绩总表打印 Choose_course = new Click学生成绩总表打印(SID1);
            Choose_course.ShowDialog();
        }

        private void toolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            多功能教务平台 mapLoad = new 多功能教务平台(SID1, 1);
            mapLoad.ShowDialog();
        }

        private void 用户信息维护ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click学生个人信息维护 change = new Click学生个人信息维护(SID1);
            change.ShowDialog();
        }

        private void 退出系统ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("确认要退出系统吗？", "提示信息", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}

