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
    public partial class 管理员功能区界面 : Form
    {
        string AdminID;
        public 管理员功能区界面()
        {
            //启动时即获取时间
            InitializeComponent();
            toolStripStatusLabel3.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            timer1.Start();
        }
        public 管理员功能区界面(string ID)
        {
            //启动时即获取时间
            AdminID = ID;
            InitializeComponent();
            toolStripStatusLabel3.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            timer1.Start();
        }


        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripStatusLabel1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripStatusLabel2_Click(object sender, EventArgs e)
        {

        }

        private void toolStripStatusLabel3_Click(object sender, EventArgs e)
        {

        }
        private void timer1_Tick(object sender, EventArgs e)
        {//获取当前系统时间,格式输出
            toolStripStatusLabel3.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }

        private void toolStripStatusLabel4_Click(object sender, EventArgs e)
        {
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        //Application.Exit();//分窗口关闭，程序强制退出

        private void Form2_Win_Load(object sender, EventArgs e)
        {

        }


        private void Form2_Win_FormClosed_1(object sender, FormClosedEventArgs e)
        {
            Application.Exit();//分窗口关闭，程序强制退出
        }

        //使用Click事件调用

        private void 学情查询ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click学情查询 study_search = new Click学情查询();
            study_search.ShowDialog();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            多功能教务平台 mapLoad = new 多功能教务平台(AdminID, 0);
            mapLoad.ShowDialog();
        }

        private void 退出系统ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("确认要退出系统吗？", "提示信息", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void 学生信息管理ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click学生信息管理 study_search = new Click学生信息管理();
            study_search.ShowDialog();
        }

        private void 教师信息管理ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click教师信息管理 study_search = new Click教师信息管理();
            study_search.ShowDialog();
        }

        private void 修改密码ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Click修改密码 Update_password = new Click修改密码(AdminID, "管理员");
            Update_password.ShowDialog();
        }

        private void 教学管理ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            教学管理 Choose_course = new 教学管理();
            Choose_course.Show();
        }
    }
    
}
