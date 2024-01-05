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
    private void BindSubjectName()
    {
        DropDownCourseName.Items.Clear();
        DropDownCourseName.Items.Insert(0, new ListItem("Choose Subject Name", "0"));
        DropDownCourseName.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("SELECT SubjectName+' ('+SubjectCode+')' as SubjectName,SubjectUid FROM tblSubjectMaster where Status = 'Active' and TCUid='"+DropDownListTrainingCentre.SelectedValue+"'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownCourseName.DataSource = dt;
        DropDownCourseName.DataBind();
        DropDownCourseName.Enabled = true;
    }
    protected void DropDownListTrainingCentre_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListTrainingCentre.SelectedValue != "0")
        {
            BindSubjectName();
        }
        else
        {
            DropDownCourseName.SelectedValue = "0";
            DropDownCourseName.Enabled = false;
        }
    }
    private void ClearText()
    {
        DropDownListTrainingCentre.SelectedValue = "0";
        DropDownCourseName.SelectedValue = "0";
        txtSubSubject.Text = "";
    }
    protected void btnAddSubSubject_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubSubjectMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@SubjectUid", DropDownCourseName.SelectedValue);
        cmd.Parameters.AddWithValue("@SubjectName", txtSubSubject.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        ClearText();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubSubjectMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@SSUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            DropDownListTrainingCentre.SelectedValue= reader["TCUid"].ToString();
            BindSubjectName();
            DropDownCourseName.SelectedValue = reader["SubjectUid"].ToString();
            txtSubSubject.Text = reader["SubjectName"].ToString();
        }
        conn.Close();
        btnUpdateSubjectName.Visible = true;
        btnAddSubSubject.Visible = false;
    }

    protected void btnUpdateSubjectName_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubSubjectMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SSUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@SubjectUid", DropDownCourseName.SelectedValue);
        cmd.Parameters.AddWithValue("@SubjectName", txtSubSubject.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        ClearText();
        btnUpdateSubjectName.Visible = false;
        btnAddSubSubject.Visible = true;
    }
}