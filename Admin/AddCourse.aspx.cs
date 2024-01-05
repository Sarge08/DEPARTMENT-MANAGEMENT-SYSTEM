using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void GenerateSubjectID()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        con.Open();
        SqlDataAdapter sdaa = new SqlDataAdapter("select * from tblSubjectMaster", con);
        DataTable dtt = new DataTable();
        sdaa.Fill(dtt);
        int i = dtt.Rows.Count;
        string cnt = Convert.ToString(i + 1);
        lblSubjectCode.Text = "IMS/SUB/-00" + cnt;
        con.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GenerateSubjectID();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubjectMasterManagement", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@TCUid", DropDownListTrainingCentre.SelectedValue);
        cmd.Parameters.AddWithValue("@SubjectName", txtSubjectName.Text);
        cmd.Parameters.AddWithValue("@SubjectCode", lblSubjectCode.Text);
        cmd.Parameters.AddWithValue("@Duration", DropDownListCourseDuration.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@DayDuration", DropDownListCourseDuration.SelectedValue);
        cmd.Parameters.AddWithValue("@CourseType", DropDownListSubjectType.SelectedValue);
        cmd.Parameters.AddWithValue("@Fees", Convert.ToDouble(txtCourseFee.Text));
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubjectMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@SubjectUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txtSubjectName.Text = reader["SubjectName"].ToString();
            txtCourseFee.Text = Convert.ToDouble(reader["Fees"]).ToString("N0");
            DropDownListCourseDuration.SelectedValue = reader["DayDuration"].ToString();
            DropDownListSubjectType.SelectedValue = reader["CourseType"].ToString();
            DropDownListTrainingCentre.SelectedValue = reader["TCUid"].ToString();
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        conn.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubjectMasterManagement", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SubjectUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@TCUid", DropDownListTrainingCentre.SelectedValue);
        cmd.Parameters.AddWithValue("@SubjectName", txtSubjectName.Text);
        cmd.Parameters.AddWithValue("@Duration", DropDownListCourseDuration.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@DayDuration", DropDownListCourseDuration.SelectedValue);
        cmd.Parameters.AddWithValue("@CourseType", DropDownListSubjectType.SelectedValue);
        cmd.Parameters.AddWithValue("@Fees", Convert.ToDouble(txtCourseFee.Text));
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();
        btnSubmit.Visible = true;
        btnUpdate.Visible = false;
    }
    private void Clear()
    {
        DropDownListTrainingCentre.SelectedValue = "0"; txtSubjectName.Text = ""; DropDownListCourseDuration.SelectedValue = "0"; DropDownListSubjectType.SelectedValue = "0";txtCourseFee.Text = "";
    }
}