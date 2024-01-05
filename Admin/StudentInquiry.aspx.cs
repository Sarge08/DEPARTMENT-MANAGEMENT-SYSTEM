using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default2 : System.Web.UI.Page
{
    private object con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindTrainingCentreName();
            txtDateOfInquire.Text = Convert.ToDateTime(DateTime.Now).ToString("dd-MM-yyyy");
        }
    }
    private void BindTrainingCentreName()
    {
        DropDownListTrainingCentre.Items.Clear();
        DropDownListTrainingCentre.Items.Insert(0, new ListItem("Choose Centre Name", "0"));
        DropDownListTrainingCentre.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select CentreName+' ('+TCCode+') ' as CentreName, TCUid FROM tblTrainingCentreMaster where Status = 'Active' and TCStatus = 'Regd. Done' order by CentreName ASC", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListTrainingCentre.DataSource = dt;
        DropDownListTrainingCentre.DataBind();
        DropDownListTrainingCentre.Enabled = true;
    }
    private void BindCourseName()
    {
        DropDownInquireCourse.Items.Clear();
        DropDownInquireCourse.Items.Insert(0, new ListItem("Choose Course Name", "0"));
        DropDownInquireCourse.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM tblSubjectMaster where Status = 'Active' and TCUid = '" + DropDownListTrainingCentre.SelectedValue + "' order by SubjectName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownInquireCourse.DataSource = dt;
        DropDownInquireCourse.DataBind();
        DropDownInquireCourse.Enabled = true;
       

    }

    protected void DropDownListTrainingCentre_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourseName();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_tblInquireMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@StudentName", textstudentName.Text);
        cmd.Parameters.AddWithValue("@FinancialYear", DropDownFinancialYear.SelectedValue);
        cmd.Parameters.AddWithValue("@Adress", txtAdress.Text);
        cmd.Parameters.AddWithValue("@InquireDate", Convert.ToDateTime(txtDateOfInquire.Text));
        cmd.Parameters.AddWithValue("@InquireTime", txtInquireTime.Text);
        cmd.Parameters.AddWithValue("@MobileNo", txtMobileNumber.Text);
        cmd.Parameters.AddWithValue("@WhatsApp", textWNumber.Text);
        cmd.Parameters.AddWithValue("@CounselingBy", textCounselerName.Text);
        cmd.Parameters.AddWithValue("@InquireOn", DropDownInquireOn.SelectedValue);
        cmd.Parameters.AddWithValue("@InquireMode", DropDownEnquireMode.SelectedValue);
        cmd.Parameters.AddWithValue("@SubjectUid", DropDownInquireCourse.SelectedValue);
        cmd.Parameters.AddWithValue("@ReferenceBy", DropDownInquireReference.SelectedValue);
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        lblMessage.Text = "Regd Done sucessfully";
        lblMessage.CssClass = "alert alert-success";
        lblMessage.ForeColor = System.Drawing.Color.White;
        Clear();
    }
    private void Clear()
    {
        txtAdress.Text = "";
        DropDownInquireOn.SelectedValue = "0";
        DropDownFinancialYear.SelectedValue = "0";
        txtMobileNumber.Text = "";
        textWNumber.Text = "";
        txtInquireTime.Text = "";
        textCounselerName.Text = "";
        DropDownInquireReference.SelectedValue = "0";
        DropDownInquireOn.SelectedValue = "0";
        DropDownEnquireMode.SelectedValue = "0";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_tblInquireMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Retrive");
        cmd.Parameters.AddWithValue("@IQUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txtDateOfInquire.Text = Convert.ToDateTime(reader["InquireDate"]).ToString("dd-MM-yyyy");
            DropDownInquireCourse.SelectedValue = reader["SubjectUid"].ToString();
            DropDownInquireReference.SelectedValue = reader["ReferenceBy"].ToString();
            DropDownEnquireMode.SelectedValue = reader["EnquireMode"].ToString();
            DropDownInquireOn.SelectedValue = reader["InquireOn"].ToString();
            textstudentName.Text = reader["StudentName"].ToString();
            txtAdress.Text = reader["Adress"].ToString();
            txtInquireTime.Text = reader["InquireTime"].ToString();
            txtMobileNumber.Text = reader["MobileNo"].ToString();
            textWNumber.Text = reader["WhatsApp"].ToString();
            textCounselerName.Text = reader["CounselingBy"].ToString();
            //textAmount.Text = Convert.ToDouble(reader["Amount"]).ToString("N0");
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
        }
        conn.Close();
    }
}

