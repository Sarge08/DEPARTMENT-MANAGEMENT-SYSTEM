using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCandidateDetailsDefault();
    }
    private void BindCandidateDetailsDefault()
    {
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select tc.CentreName,s.*,b.BatchName,sb.SubjectName from tblTrainingCentreMaster tc, tblStudentMaster s, tblBatchMaster b, tblSubjectMaster sb where s.TCUid = tc.TCUid and s.BatchUid = b.BatchUid and s.SubjectUid = sb.SubjectUid and s.Status = 'Active' and tc.Status = 'Active' and sb.Status = 'Active' order by s.SUid desc", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text != "")
        {
            SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmddd = new SqlCommand("select tc.CentreName,s.*,b.BatchName,sb.SubjectName from tblTrainingCentreMaster tc, tblStudentMaster s, tblBatchMaster b, tblSubjectMaster sb where s.TCUid = tc.TCUid and s.BatchUid = b.BatchUid and s.SubjectUid = sb.SubjectUid and s.Status = 'Active' and tc.Status = 'Active' and sb.Status = 'Active' and (s.StudentName like '%" + txtSearch.Text.Trim() + "%' OR s.MobileNumber like '%" + txtSearch.Text.Trim() + "%' OR s.AadhaarNo like '%" + txtSearch.Text.Trim() + "%') order by s.SUid desc", connnnnn);
            connnnnn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmddd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gvDetails.DataSource = dt;
            gvDetails.DataBind();
            btnRefresh.Visible = true;
        }
        else
        {
            btnRefresh.Visible = false;
        }
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        btnRefresh.Visible = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButton1.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        Response.Redirect(string.Format("StudentRegd.aspx?SUid={0}", lblUid.Text));
    }
}