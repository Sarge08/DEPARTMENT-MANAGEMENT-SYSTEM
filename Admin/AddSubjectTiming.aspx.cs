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
    private void BindSubSubjectName()
    {
        DropDownListSubSubject.Items.Clear();
        DropDownListSubSubject.Items.Insert(0, new ListItem("Choose Sub Subject Name", "0"));
        DropDownListSubSubject.Enabled = false;
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("SELECT * FROM tblSubSubjectMaster where Status = 'Active' and SubjectUid = '" + DropDownCourseName.SelectedValue + "'", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListSubSubject.DataSource = dt;
        DropDownListSubSubject.DataBind();
        DropDownListSubSubject.Enabled = true;
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

    protected void DropDownCourseName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownCourseName.SelectedValue != "0")
        {
            BindSubSubjectName();
        }
        else
        {
            DropDownListSubSubject.SelectedValue = "0";
            DropDownListSubSubject.Enabled = false;
        }
    }
    private void ClearText()
    {
        DropDownListTrainingCentre.SelectedValue = "0";
        DropDownCourseName.SelectedValue = "0";
        DropDownListSubSubject.SelectedValue = "0";
        txtTotalMark.Text = "";
        txtTotalTime.Text = "";
    }
    protected void btnSubjectName_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubjectMarkInfoManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@SSUid", DropDownListSubSubject.SelectedValue);
        cmd.Parameters.AddWithValue("@TotalMark", Convert.ToInt32(txtTotalMark.Text));
        cmd.Parameters.AddWithValue("@TotalTime", Convert.ToInt32(txtTotalTime.Text));
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
        SqlCommand cmd = new SqlCommand("sp_SubjectMarkInfoManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@MUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            DropDownListTrainingCentre.SelectedValue = reader["TCUid"].ToString();
            BindSubjectName();
            DropDownCourseName.SelectedValue = reader["SubjectUid"].ToString();
            BindSubSubjectName();
            DropDownListSubSubject.SelectedValue = reader["SSUid"].ToString();
            txtTotalMark.Text = Convert.ToDouble(reader["TotalMark"]).ToString("N0");
            txtTotalTime.Text = Convert.ToDouble(reader["TotalTime"]).ToString("N0");
        }
        conn.Close();
        btnUpdateSubject.Visible = true;
        btnSubjectName.Visible = false;
    }

    protected void btnUpdateSubject_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubjectMarkInfoManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@MUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@SSUid", DropDownListSubSubject.SelectedValue);
        cmd.Parameters.AddWithValue("@TotalMark", Convert.ToInt32(txtTotalMark.Text));
        cmd.Parameters.AddWithValue("@TotalTime", Convert.ToInt32(txtTotalTime.Text));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        ClearText();
    }
}