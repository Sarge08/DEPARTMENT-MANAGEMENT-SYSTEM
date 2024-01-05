using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
public partial class Login:System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        if (!Page.IsPostBack)
        {
            if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
            {
                txtUserName.Text = Request.Cookies["UNAME"].Value;
                txtPassword.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
       // BackUpDatabaseQuery();
    }
    private void BackUpDatabaseQuery()
    {
        string dirPath = "D:\\IMS_Web_Inex_Computer\\Database\\";
        if (Directory.GetFiles(dirPath, "HMS_" + DateTime.Today.ToString("dd-MM-yyyy") + ".bak").Length == 0)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("BACKUP DATABASE [IMS_Web] TO DISK = 'D:\\IMS_Web_Inex_Computer\\Database\\HMS_" + DateTime.Today.ToString("dd-MM-yyyy") + ".bak'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        else
        {
            string file = "D:\\IMS_Web_Inex_Computer\\Database\\HMS_" + DateTime.Today.ToString("dd-MM-yyyy") + ".bak";
            File.Delete(file);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("BACKUP DATABASE [IMS_Web] TO DISK = 'D:\\IMS_Web_Inex_Computer\\Database\\HMS_" + DateTime.Today.ToString("dd-MM-yyyy") + ".bak'", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tbl_adminLoginMaster where Email = @Email and Password=@Password and Status = 'Active'", connn);
        connn.Open();
        cmddd.Parameters.AddWithValue("@Email", txtUserName.Text);
        cmddd.Parameters.AddWithValue("@Password", txtPassword.Text);
        cmddd.Parameters.AddWithValue("@Status", "Active");
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            if (CheckBox1.Checked)
            {
                Response.Cookies["UNAME"].Value = txtUserName.Text;
                Response.Cookies["PWD"].Value = txtPassword.Text;

                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(15);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
            }
            else
            {
                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
            }
            string usertype = readerr["UserType"].ToString();
            if (usertype == "Admin")
            {
                Session["AdminUid"] = readerr["ADMUid"].ToString();
                Response.Redirect("Admin/");
            }

        }
        else
        {
            EmployeLogin();
        }
        connn.Close();
    }
    private void EmployeLogin()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tbl_StudentMaster where SEmail = @SEmail and Password = @Password and Status = @Status", connn);
        connn.Open();
        cmddd.Parameters.AddWithValue("@SEmail", txtUserName.Text);
        cmddd.Parameters.AddWithValue("@Password", txtPassword.Text);
        cmddd.Parameters.AddWithValue("@Status", "Active");

        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            if (CheckBox1.Checked)
            {
                Response.Cookies["UNAME"].Value = txtUserName.Text;
                Response.Cookies["PWD"].Value = txtPassword.Text;

                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(15);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
            }
            else
            {
                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
            }
            Session["SUid"] = readerr["SUid"].ToString();
            Response.Redirect("Student/");
        }
        else
        {
            lblMessage.Text = "Invalid email or password";
            lblMessage.ForeColor = System.Drawing.Color.Yellow;
        }
        connn.Close();
    }
}