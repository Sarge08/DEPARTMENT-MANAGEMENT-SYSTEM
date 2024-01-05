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
        txtNoticeDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_NoticeMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@NoticeTitle", txtnoticetitle.Text);
            cmd.Parameters.AddWithValue("@NoticeDate", Convert.ToDateTime(txtNoticeDate.Text));
           string filenamepost = Path.GetFileName(NoticeFileUpload.PostedFile.FileName);
           NoticeFileUpload.SaveAs(Server.MapPath("~/img/" + txtnoticetitle.Text + filenamepost));
           cmd.Parameters.AddWithValue("@NoticeFile", "../img/" + txtnoticetitle.Text + filenamepost);
           cmd.Parameters.AddWithValue("@Status", "Active");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
           gvDetails.DataBind();
            Clear();
        }
    private void Clear()
    {
        txtnoticetitle.Text = "";
        txtNoticeDate.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_NoticeMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@NOTuid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txtnoticetitle.Text = reader["NoticeTitle"].ToString();
            txtNoticeDate.Text = Convert.ToDateTime(reader["NoticeDate"]).ToString("dd-MM-yyyy");
            btnSubmit.Visible = false;
            BtnUpdate.Visible = true;
        }
        conn.Close();
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_NoticeMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@NOTuid", lblUid.Text);
        cmd.Parameters.AddWithValue("@NoticeTitle", txtnoticetitle.Text);
        cmd.Parameters.AddWithValue("@NoticeDate", Convert.ToDateTime(txtNoticeDate.Text));
        string filenamepost = Path.GetFileName(NoticeFileUpload.PostedFile.FileName);
        NoticeFileUpload.SaveAs(Server.MapPath("~/img/" + txtnoticetitle.Text + filenamepost));
        cmd.Parameters.AddWithValue("@NoticeFile", "../img/" + txtnoticetitle.Text + filenamepost);
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
        SqlCommand cmd = new SqlCommand("SP_NoticeMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Delete");
        cmd.Parameters.AddWithValue("@NOTuid", lblUniqueID.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}