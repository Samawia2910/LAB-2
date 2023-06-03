using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LB
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        string connectionString = @"Data Source=SAMAWIA_CS29100\MSSQLSERVER01;Initial Catalog = Lab2_Home.; Integrated Security = True;";
        //"Data Source = ; Initial Catalog = UserRegistrationDB; Integrated Security=True;"
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox4.Text == "" || textBox5.Text == "")
                MessageBox.Show("please fill mandatory fields");
            else if (textBox5.Text != textBox6.Text)
                MessageBox.Show("Password do not match");
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlCommand sqlCmd = new SqlCommand("UserAdd", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                  
                    sqlCmd.Parameters.AddWithValue("@Name", textBox1.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Registration No", textBox2.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@CourseCode", textBox3.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Username", textBox4.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Password", textBox5.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    MessageBox.Show("Registration is successfull");
                    Clear();

                }
            }
        }
        void Clear()
        {
             textBox1.Text = textBox2.Text = textBox3.Text = textBox4.Text = textBox5.Text = textBox6.Text = "";

        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}
      