using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Employee_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SUid"] != null)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from tbl_StudentMaster where Status='Active' and SUid=@SUid", conn);
            conn.Open();
            cmd.Parameters.AddWithValue("@SUid", Session["SUid"].ToString());
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lbluId.Text = reader["SUid"].ToString();
                txtName.Text = reader["SName"].ToString();
                TxtEmail.Text = reader["SEmail"].ToString();
                txtClientMobile.Text = reader["Mobile"].ToString();
                txtPassword.Text = reader["Password"].ToString();
                txtRollNo.Text = reader["RollNo"].ToString();
                txtAddress.Text = reader["Address"].ToString();
                DropDownListCourse.SelectedValue = reader["Course"].ToString();
                txtsession.Text = reader["Session"].ToString();
                DropDownListGender.SelectedValue = reader["Gender"].ToString();
                txtDateOfBirth.Text = Convert.ToDateTime(reader["DateOfBirth"]).ToString("dd-MM-yyyy");
                DropDownListBloodGroup.SelectedValue = reader["BloodGroup"].ToString();
                imagePreview.ImageUrl = reader["SPhoto"].ToString();
            }

        }
        else
        {
            Session["SUid"] = null;
            Response.Redirect("../");
        }
       
    }




    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Sp_PlacementMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@SUid", lbluId.Text);
        cmd.Parameters.AddWithValue("@PStatus", DropDownListplaced.SelectedValue);
        cmd.Parameters.AddWithValue("@Company1", DropDownListcomany1.SelectedValue);
        cmd.Parameters.AddWithValue("@Company2", DropDownListcomp2.SelectedValue);
        cmd.Parameters.AddWithValue("@Company3", DropDownListcomp3.SelectedValue);
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    //    gvDetails.DataBind();
        Clear();
        ShowBillAvailbility();
    }
    private void Clear()
    {
        DropDownListplaced.SelectedValue = "0"; DropDownListcomany1.SelectedValue = "0"; DropDownListcomp2.SelectedValue = "0"; DropDownListcomp3.SelectedValue = "0";
    }

    private void ShowBillAvailbility()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select count(*) as Total from tbl_PlacementMaster where SUid ='" + lbluId.Text + "'", connn);
        connn.Open();
        cmddd.Parameters.AddWithValue("@SUid", Session["SUid"].ToString());
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            int a = Convert.ToInt32(readerr["Total"].ToString());
            if (a == 1)
            {

                retriveData();
                btnSubmit.Visible = false;
                BtnUpdate.Visible = true;
            }
            else
            {
                btnSubmit.Visible = true;
                BtnUpdate.Visible = false;
            }
        }
        connn.Close();
    }

    private void retriveData()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select * from tbl_PlacementMaster where SUid ='" + lbluId.Text + "'", connn);
        connn.Open();
        cmddd.Parameters.AddWithValue("@PLUid", lbluId.Text);
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            DropDownListplaced.SelectedValue = readerr["PStatus"].ToString();
            DropDownListcomany1.SelectedValue = readerr["Company1"].ToString();
            DropDownListcomp2.SelectedValue = readerr["Company2"].ToString();
            DropDownListcomp3.SelectedValue = readerr["Company3"].ToString();
        }
        connn.Close();
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Sp_PlacementMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SUid", lbluId.Text);
        cmd.Parameters.AddWithValue("@PStatus", DropDownListplaced.SelectedValue);
        cmd.Parameters.AddWithValue("@Company1", DropDownListcomany1.SelectedValue);
        cmd.Parameters.AddWithValue("@Company2", DropDownListcomp2.SelectedValue);
        cmd.Parameters.AddWithValue("@Company3", DropDownListcomp3.SelectedValue);
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    protected void DropDownListStudentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowBillAvailbility();

    }
}

