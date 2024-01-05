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
            SqlCommand cmd = new SqlCommand("Sp_StudentMaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@SName", txtName.Text);
            cmd.Parameters.AddWithValue("@SEmail", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtClientMobile.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Course", DropDownListCourse.SelectedValue);
            cmd.Parameters.AddWithValue("@Session", txtsession.Text);
            cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
            cmd.Parameters.AddWithValue("@DateOfBirth", Convert.ToDateTime(txtDateOfBirth.Text));
            cmd.Parameters.AddWithValue("@BloodGroup", DropDownListBloodGroup.SelectedValue);
        string filenamepost = Path.GetFileName(ImgfileUpload.PostedFile.FileName);
            ImgfileUpload.SaveAs(Server.MapPath("~/img/" + txtName.Text + filenamepost));
            cmd.Parameters.AddWithValue("@SPhoto", "../img/" + txtName.Text + filenamepost);
            cmd.Parameters.AddWithValue("@Status", "Active");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            gvDetails.DataBind();
            Clear();
        }
    private void Clear()
    {
        txtName.Text = ""; TxtEmail.Text = ""; txtClientMobile.Text = ""; txtPassword.Text = ""; txtRollNo.Text = "";
        txtAddress.Text = ""; DropDownListCourse.SelectedValue = "0"; txtsession.Text = ""; DropDownListGender.SelectedValue = "";
        txtDateOfBirth.Text = ""; DropDownListBloodGroup.SelectedValue = "0";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Sp_StudentMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@SUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
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
            btnSubmit.Visible = false;
            BtnUpdate.Visible = true;
        }
        conn.Close();
    }






    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Sp_StudentMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@SName", txtName.Text);
        cmd.Parameters.AddWithValue("@SEmail", TxtEmail.Text);
        cmd.Parameters.AddWithValue("@Mobile", txtClientMobile.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text);
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@Course", DropDownListCourse.SelectedValue);
        cmd.Parameters.AddWithValue("@Session", txtsession.Text);
        cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
        cmd.Parameters.AddWithValue("@DateOfBirth", Convert.ToDateTime(txtDateOfBirth.Text));
        cmd.Parameters.AddWithValue("@BloodGroup", DropDownListBloodGroup.SelectedValue);
        string filenamepost = Path.GetFileName(ImgfileUpload.PostedFile.FileName);
        ImgfileUpload.SaveAs(Server.MapPath("~/img/" + txtName.Text + filenamepost));
        cmd.Parameters.AddWithValue("@SPhoto", "../img/" + txtName.Text + filenamepost);
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
        SqlCommand cmd = new SqlCommand("Sp_StudentMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Delete");
        cmd.Parameters.AddWithValue("@SUid", lblUniqueID.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
