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
    public partial class 多功能教务平台 : Form
    {
        string Tno = "";
        string Sno = "";
        string Admin = "";
        int role = 0;//1学生 2老师 0管理员
        string classroom;
        public 多功能教务平台()
        {
            InitializeComponent();
            showTable();
            if (role != 0)
            {
                button16.Visible = false;
            }
        }
        public 多功能教务平台(string ID, int roleNo)
        {
            InitializeComponent();
            if (roleNo == 1)
            {//学生
                Sno = ID;
                role = roleNo;
            }
            else if(roleNo == 2)
            {//老师
                Tno = ID;
                role = roleNo;
            }
            else if(roleNo == 0)
            {//管理员
                Admin = ID;
                role = roleNo;
                //只有管理员看不到“我的课程”
                button24.Visible = false;
            }
            //只有管理员能进行排课
            if(role != 0)
            {
                button16.Visible = false;              
            }
            showTable();
        }

        private string Loc = "";//全局变量，用于记录点击button的教室位置

        //楼层号 + 教室索引 生成教室编号
        private string class_room(string floor, string digit)
        {
            classroom = "A-" + floor + digit;
            return classroom;
        }

        //选择楼层信息，如未选择return false
        private bool judge()
        {
            if (comboBox2.Text == "")
            {
                return false;
            }
            return true;
        }

        //搜索课程，跳转至教室所在位置
        //mod0原色复原，mod1指定教室变蓝，mod2已占用教室变红
        private void showPos(string pos, int mod)
        {
            if (mod == 1)
            {
                switch (pos)
                {
                    case "01":
                        button1.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "02":
                        button2.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "03":
                        button3.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "04":
                        button4.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "05":
                        button5.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "06":
                        button6.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "07":
                        button7.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "08":
                        button8.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "09":
                        button9.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "10":
                        button10.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "11":
                        button12.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "12":
                        button13.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "13":
                        button20.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "14":
                        button14.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "15":
                        button19.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "16":
                        button15.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "17":
                        button11.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "18":
                        button21.BackColor = Color.LightSkyBlue;
                        label5.BackColor = Color.Yellow;
                        break;
                }
            }
            if (mod == 2)
            {
                switch (pos)
                {
                    case "01":
                        button1.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "02":
                        button2.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "03":
                        button3.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "04":
                        button4.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "05":
                        button5.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "06":
                        button6.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "07":
                        button7.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "08":
                        button8.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "09":
                        button9.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "10":
                        button10.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "11":
                        button12.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "12":
                        button13.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "13":
                        button20.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "14":
                        button14.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "15":
                        button19.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "16":
                        button15.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "17":
                        button11.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                    case "18":
                        button21.BackColor = Color.Red;
                        label5.BackColor = Color.Yellow;
                        break;
                }
            }
            if (mod == 0)
            {
                label5.BackColor = Color.Transparent;
                label5.Text = "";
                button1.BackColor = Color.Transparent;
                button2.BackColor = Color.Transparent;
                button3.BackColor = Color.Transparent;
                button4.BackColor = Color.Transparent;
                button5.BackColor = Color.Transparent;
                button6.BackColor = Color.Transparent;
                button7.BackColor = Color.Transparent;
                button8.BackColor = Color.Transparent;
                button9.BackColor = Color.Transparent;
                button10.BackColor = Color.Transparent;
                button12.BackColor = Color.Transparent;
                button13.BackColor = Color.Transparent;
                button20.BackColor = Color.Transparent;
                button14.BackColor = Color.Transparent;
                button19.BackColor = Color.Transparent;
                button15.BackColor = Color.Transparent;
                button11.BackColor = Color.Transparent;
                button21.BackColor = Color.Transparent;
                
            }
        }

        private void input_table(string classroom)
        {
            dataGridView1.Rows.Clear();
            string a, b, c, d, e, f, g, h, i, temp1, temp2, temp3, temp4;
            string sql = "select * from 学生可选课表 where 教室编号 ='" + classroom + "'";
            Door Sql = new Door();
            IDataReader dr = Sql.Reader(sql);
            while (dr.Read())
            {
                a = dr["课程"].ToString();
                b = dr["课程号"].ToString();
                c = dr["学分"].ToString();
                d = dr["授课老师"].ToString();
                e = dr["上课时间"].ToString();
                temp1 = dr["空间位置"].ToString();
                temp2 = dr["教室编号"].ToString();
                temp3 = dr["当前人数"].ToString();
                temp4 = dr["计划上限"].ToString();
                f = temp1 + " " + temp2;
                g = temp3 + "/" + temp4;
                h = dr["课程类型"].ToString();
                i = dr["课程教学ID"].ToString();
                string[] str = { a, b, h, c, d, e, f, g, i };
                dataGridView1.Rows.Add(str);
            }
            dr.Close();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        //========================================================================
        private void button1_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button1.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button1.Text;
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button2.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button2.Text;
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button3.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button3.Text;
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button4.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button4.Text;
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button5.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button5.Text;
        }        
        
        private void button6_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button6.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button6.Text;
        }
        
        private void button7_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button7.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button7.Text;
        }

        private void button8_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button8.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button8.Text;
        }

        private void button9_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button9.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button9.Text;
        }

        private void button10_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button10.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button10.Text;
        }

        private void button21_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button21.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button21.Text;
        }

        private void button12_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button12.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button12.Text;
        }

        private void button13_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button13.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button13.Text;
        }

        private void button14_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button14.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button14.Text;
        }

        private void button15_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button15.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button15.Text;
        }

        private void button19_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button19.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button19.Text;
        }

        private void button11_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button11.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button11.Text;
        }

        private void button21_Click_1(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button21.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button21.Text;
        }

        private void button20_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, button20.Text);
                input_table(classroom);
            }
            else
            {
                MessageBox.Show("楼层信息未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            Loc = button20.Text;
        }

        private void button17_Click_1(object sender, EventArgs e)
        {
            textBox1.Text = null;
            comboBox2.Text = null;
            comboBox4.Text = null;
            dataGridView1.Rows.Clear();
            showPos("", 0);
            showTable();

        }

        //先搜索是否已存在，再进行信息添加
        private void button16_Click(object sender, EventArgs e)
        {
            if (judge())
            {
                string classroom = class_room(comboBox2.Text, Loc);
                string sql_1 = "select *from 教学班 where 教室编号 ='" + class_room(comboBox2.Text, Loc) + "'";
                Door Sql = new Door();
                IDataReader dr_1 = Sql.Reader(sql_1);

                if (dr_1.Read())
                {
                    MessageBox.Show("此教室在某个时间段被占用，请注意避免时间冲突！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //排课程
                    Click排课程 insert_course = new Click排课程(classroom);
                    insert_course.ShowDialog();
                }
                dr_1.Close();
            }
            else
            {
                MessageBox.Show("请选择教室所在楼层及位置！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        
  
        private void showTable(string sql = " select* from 学生可选课表")
        {
            if (sql != null)
            {
                string a, b, c, d, e, f, g, h, i, temp1, temp2, temp3, temp4;
                if (role == 0)//如果是管理员
                {
                    dataGridView1.Rows.Clear();
                    Door Course = new Door();
                    IDataReader drAdmin = Course.Reader(sql);
                    while (drAdmin.Read())
                    {
                        a = drAdmin["课程"].ToString();
                        b = drAdmin["课程号"].ToString();
                        c = drAdmin["学分"].ToString();
                        d = drAdmin["授课老师"].ToString();
                        e = drAdmin["上课时间"].ToString();
                        temp1 = drAdmin["空间位置"].ToString();
                        temp2 = drAdmin["教室编号"].ToString();
                        temp3 = drAdmin["当前人数"].ToString();
                        temp4 = drAdmin["计划上限"].ToString();
                        f = temp1 + " " + temp2;
                        g = temp3 + "/" + temp4;
                        h = drAdmin["课程类型"].ToString();
                        i = drAdmin["课程教学ID"].ToString();
                        string[] str = { a, b, h, c, d, e, f, g, i };
                        dataGridView1.Rows.Add(str);
                    }
                    try
                    {
                        dataGridView1.Columns.Remove("MangementButtons");
                    }
                    catch
                    { }
                    //添加buttons列
                    DataGridViewButtonColumn dgv_button_col_M = new DataGridViewButtonColumn();
                    // 设定列的名字
                    dgv_button_col_M.Name = "MangementButtons";
                    // 在所有按钮上表示"查看详情"
                    dgv_button_col_M.UseColumnTextForButtonValue = true;
                    dgv_button_col_M.Text = "管理";
                    // 设置列标题
                    dgv_button_col_M.HeaderText = "管理课程";
                    // 向DataGridView追加
                    dataGridView1.Columns.Insert(dataGridView1.Columns.Count, dgv_button_col_M);
                }

                else
                {
                    //该学生已选的课程教学ID
                    List<string> MyCourseList = new List<string>();
                    string MyCourse_Stu;
                    if (role == 1)
                    {//如果是学生
                        MyCourse_Stu = "select 教学班.课程教学ID 课程教学ID from 课程学生SC, 教学班 where 课程学生SC.课程教学ID = 教学班.课程教学ID and 学号 = '" + Sno + "'";
                    }
                    else
                    {//如果是老师
                        MyCourse_Stu = " select* from 学生可选课表 where 教师编号 = '" + Tno + "'";
                    }
                    Door Check_course = new Door();
                    IDataReader dr0 = Check_course.Reader(MyCourse_Stu);
                    while (dr0.Read())
                    {
                        MyCourseList.Add(dr0["课程教学ID"].ToString());
                    }

                    string sign;
                    dataGridView1.Rows.Clear();
                    Door Choose_course = new Door();
                    IDataReader dr = Choose_course.Reader(sql);
                    while (dr.Read())
                    {
                        a = dr["课程"].ToString();
                        b = dr["课程号"].ToString();
                        c = dr["学分"].ToString();
                        d = dr["授课老师"].ToString();
                        e = dr["上课时间"].ToString();
                        temp1 = dr["空间位置"].ToString();
                        temp2 = dr["教室编号"].ToString();
                        temp3 = dr["当前人数"].ToString();
                        temp4 = dr["计划上限"].ToString();
                        f = temp1 + " " + temp2;
                        g = temp3 + "/" + temp4;
                        h = dr["课程类型"].ToString();
                        i = dr["课程教学ID"].ToString();
                        if (MyCourseList.Contains(i))
                        {//已选课程，不可复选
                            sign = "0";
                        }
                        else
                        {//可选
                            sign = "1";
                        }
                        string[] str = { a, b, h, c, d, e, f, g, i, sign };
                        dataGridView1.Rows.Add(str);
                    }
                    //防止产生重复列
                    try
                    {
                        dataGridView1.Columns.Remove("Choosebuttons");
                    }
                    catch
                    { }
                    if (role == 1)//如果是学生，添加选课按钮
                    {
                        //添加buttons列
                        DataGridViewButtonColumn dgv_button_col = new DataGridViewButtonColumn();
                        // 设定列的名字
                        dgv_button_col.Name = "Choosebuttons";
                        // 在所有按钮上表示"查看详情"
                        dgv_button_col.UseColumnTextForButtonValue = true;
                        dgv_button_col.Text = "选课";
                        // 设置列标题
                        dgv_button_col.HeaderText = "点击选课";
                        // 向DataGridView追加
                        dataGridView1.Columns.Insert(dataGridView1.Columns.Count, dgv_button_col);
                    }
                    foreach (DataGridViewRow dgr in dataGridView1.Rows)
                    {
                        if (dgr.Cells["Column10"].Value == null)
                        {
                            break;
                        }
                        if (dgr.Cells["Column10"].Value.ToString() == "0")
                        {
                            dgr.DefaultCellStyle.BackColor = Color.LightBlue;
                        }
                    }
                }
            }

        }

        private void button18_Click_1(object sender, EventArgs j)
        {

            if (radioButton2.Checked && comboBox2.Text != "")
            {
                showPos("", 0);
                string a, b, c, d, e, f, g, h, i, temp1, temp2, temp3, temp4;
                string sql = "select * from 学生可选课表 where 教室编号 like 'A-"+ comboBox2.Text +"%'";
                Door Sql = new Door();
                IDataReader dr = Sql.Reader(sql);
                dataGridView1.Rows.Clear();
                label5.Text = "当前层数：" + comboBox2.Text + "层";
                label5.BackColor = Color.LightGreen;
                while (dr.Read())
                {
                    a = dr["课程"].ToString();
                    b = dr["课程号"].ToString();
                    c = dr["学分"].ToString();
                    d = dr["授课老师"].ToString();
                    e = dr["上课时间"].ToString();
                    temp1 = dr["空间位置"].ToString();
                    temp2 = dr["教室编号"].ToString();
                    temp3 = dr["当前人数"].ToString();
                    temp4 = dr["计划上限"].ToString();
                    f = temp1 + " " + temp2;
                    g = temp3 + "/" + temp4;
                    h = dr["课程类型"].ToString();
                    i = dr["课程教学ID"].ToString();
                    string[] str = { a, b, h, c, d, e, f, g, i };
                    dataGridView1.Rows.Add(str);
                    f = temp2.Substring(3);//截取教室编号
                    showPos(f, 2);
                }
                 dr.Close();
            }
            else if (radioButton1.Checked && comboBox4.Text != "" && textBox1.Text != "")
            {
                if(comboBox4.Text == "教师")
                {
                    string sql = "select * from 学生可选课表 where 授课老师  = '"+ textBox1.Text + "'";
                    showTable(sql);
                }
                else if(comboBox4.Text == "课程类型")
                {
                    string sql = "select * from 学生可选课表 where 课程类型  = '" + textBox1.Text + "'";
                    showTable(sql);
                }
                else if(comboBox4.Text == "课程号")
                {
                    string sql = "select * from 学生可选课表 where 课程号  = '" + textBox1.Text + "'";
                    showTable(sql);
                }
                else if(comboBox4.Text == "课程")
                {
                    string sql = "select * from 学生可选课表 where 课程  = '" + textBox1.Text + "'";
                    showTable(sql);
                }
            }
            else
            {
                MessageBox.Show("查询条件未输入！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                //如果是学生，跳转选课
                if (dataGridView1.Columns[e.ColumnIndex].Name == "Choosebuttons")
                {
                    //获取课程代号
                    int CnoIndex = dataGridView1.Columns["Column2"].Index;
                    String Cno = dataGridView1.SelectedCells[CnoIndex].Value.ToString();
                    //获取课程代号
                    //检验是否重复选课
                    string check_sql = "select 课程代号 from 课程学生SC, 教学班 where 课程学生SC.课程教学ID = 教学班.课程教学ID and 学号 = '" + Sno + "'";
                    Door Check_course = new Door();
                    IDataReader dr = Check_course.Reader(check_sql);
                    while (dr.Read())
                    {
                        if (Cno == dr["课程代号"].ToString())
                        {
                            MessageBox.Show("请勿重复选课！");
                            return;
                        }
                    }

                    //获取课程教学ID
                    String CTID = dataGridView1.CurrentRow.Cells["Column9"].Value.ToString();
                    string sql = "insert into 课程学生SC values('" + Sno + "','" + CTID + "',NULL)";
                    Door Choose_door = new Door();
                    try
                    {
                        Choose_door.Excute(sql);
                        MessageBox.Show("选课成功！");
                        showTable();
                        Click学生个人课表查询 Choose_course = new Click学生个人课表查询(Sno);
                        Choose_course.Show();
                    }
                    catch
                    {
                    }
                }
                //如果是管理员跳转至课程管理
                else if (dataGridView1.Columns[e.ColumnIndex].Name == "MangementButtons")
                {
                    Click排课程 insert_course = new Click排课程(classroom);
                    insert_course.ShowDialog();
                }

                //只要点击就示意位置
                showPos("", 0);
                //获取空间信息
                String temp = dataGridView1.SelectedCells[6].Value.ToString();
                string level = temp.Substring(6, 1);
                string pos = temp.Substring(7);
                label5.Text = "当前层数：" + level + "层";
                comboBox2.Text = level;
                label5.BackColor = Color.LightGreen;
                showPos(pos, 1);
            }
            catch
            {
            }
        }

        private void button22_Click(object sender, EventArgs e)
        {

        }

        private void button24_Click(object sender, EventArgs e)
        {
             if(role == 1)
            {
                Click学生个人课表查询 Choose_course = new Click学生个人课表查询(Sno);
                Choose_course.Show();
            }
            else if(role == 2)
            {
                教学管理 Choose_course = new 教学管理(Tno);
                Choose_course.Show();
            }
        }
    }
    
}
