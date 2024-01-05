using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_SubjectMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
        cmd.Parameters.AddWithValue("@PapaerCode", txtpapercode.Text);
        string filenamepost = Path.GetFileName(syllabusupload.PostedFile.FileName);
        syllabusupload.SaveAs(Server.MapPath("~/img/" + txtSubject.Text + filenamepost));
        cmd.Parameters.AddWithValue("@Syllabus", "../img/" + txtSubject.Text + filenamepost);
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();

    }
     private void Clear()
    {
        txtSubject.Text = "";
        txtpapercode.Text = "";


    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid1.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_SubjectMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@SYUid", lblUid1.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txtSubject.Text = reader["Subject"].ToString();
            txtpapercode.Text = reader["PapaerCode"].ToString();
            btnSubmit.Visible = false;
            BtnUpdate.Visible = true;
        }
        conn.Close();
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_SubjectMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SYUid", lblUid1.Text);
        cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
        cmd.Parameters.AddWithValue("@PapaerCode", txtpapercode.Text);
        string filenamepost = Path.GetFileName(syllabusupload.PostedFile.FileName);
        syllabusupload.SaveAs(Server.MapPath("~/img/" + txtSubject.Text + filenamepost));
        cmd.Parameters.AddWithValue("@Syllabus", "../img/" + txtSubject.Text + filenamepost);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();
        btnSubmit.Visible = true;
        BtnUpdate.Visible = false;
    }

    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButton.NamingContainer;
        lblUniqueID.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
    }

    protected void btnYes_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_SubjectMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Delete");
        cmd.Parameters.AddWithValue("@SYUid", lblUniqueID.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}