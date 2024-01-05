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
        SqlCommand cmddd = new SqlCommand("SELECT SubjectName+' ('+SubjectCode+')' as SubjectName,SubjectUid FROM tblSubjectMaster where Status = 'Active' and TCUid='" + DropDownListTrainingCentre.SelectedValue + "'", connnnnn);
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

    protected void btnUploadStudyMaterial_Click(object sender, EventArgs e)
    {
        if (FileUpload1Phtoto.PostedFile.ContentLength < 1 * 2048 * 2048)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("sp_StudyMaterialManagement", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@SubjectUid", DropDownCourseName.SelectedValue);
            cmd.Parameters.AddWithValue("@Name", txtStudyMaterialName.Text);
            string filenamepost = Path.GetFileName(FileUpload1Phtoto.PostedFile.FileName);
            FileUpload1Phtoto.SaveAs(Server.MapPath("~/Material/" + filenamepost));
            cmd.Parameters.AddWithValue("@Material", "../Material/" + filenamepost);
            cmd.Parameters.AddWithValue("@Status", "Active");
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            gvDetails.DataBind();
            Clear();
            lblMessage.Text = "<i class='fa fa-check'></i>" + " Material Added Successfully...";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.CssClass = "alert alert-success";
        }
        else
        {
            lblMessage.Text = "File Size Exceeded...";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.CssClass = "alert alert-danger";
        }
    }
    private void Clear()
    {
        DropDownCourseName.SelectedValue = "0";DropDownListTrainingCentre.SelectedValue = "0";txtStudyMaterialName.Text = "";
    }

    protected void btnMaterial_Click(object sender, EventArgs e)
    {
        LinkButton ImageButtonPrint = sender as LinkButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_StudyMaterialManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@SMUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Material"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }
        conn.Close();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_StudyMaterialManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Delete");
        cmd.Parameters.AddWithValue("@SMUid", lblUid.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
    }
}