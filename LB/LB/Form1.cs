using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Windows.Forms;

namespace LB
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=SAMAWIA_CS29100\MSSQLSERVER01;Initial Catalog=Lab2_Home.;Integrated Security=True;Connect Timeout=30");

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {


            con.Open();
            SqlCommand command = new SqlCommand("insert into Student values('" + int.Parse(textBox1.Text) + "','" + (textBox2.Text) + "','" + (textBox3.Text) + "','" + int.Parse(textBox4.Text) + "','" + int.Parse(textBox5.Text) + "',)", con);
            command.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Inserted Successfully");
            BindData();

        }
        void BindData()
        {
            SqlCommand command = new SqlCommand("Select * from Lab2_Home", con);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand command = new SqlCommand("update Student set Registration No = '" + textBox1.Text + "', Name = '" + textBox2.Text + "'Department= '" + textBox3.Text + "'Session = '" + textBox4.Text + "'Address = '" + textBox5.Text + "',", con);
            command.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("Updated Successfully");
            BindData();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "")
            {
                if (MessageBox.Show("Are you sure to delete?", "Delete Record", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    con.Open();
                    SqlCommand command = new SqlCommand("Delete Student where Registration No= '" + int.Parse(textBox1.Text) + "'", con);
                    command.ExecuteNonQuery();
                    con.Close();
                    MessageBox.Show("Deleted Successfully");
                    BindData();
                }
            }
            else
            {
                MessageBox.Show("Put Registration No");

            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand("Select * from Lab2_Home where Registration No = '" + int.Parse(textBox1.Text) + "'", con);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            dataGridView1.DataSource = dt;
        }
    }
    }

