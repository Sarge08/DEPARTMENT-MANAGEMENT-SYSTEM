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
using System.Web.UI.HtmlControls;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtDateOfRegd.Text = DateTime.Today.ToString("dd-MM-yyyy");
            BindTrainingCentreName();
            BindCourseName();
        }
        if (Request.QueryString["SUid"] != null && Session["AdminUid"] != null)
        {
            if (!Page.IsPostBack)
            {
                RetriveStudentDetails();
            }
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            btnUpdatePhoto.Visible = true;
            RequiredFieldValidatorStudentPhoto.ValidationGroup = "";
        }
        else
        {
            btnSubmit.Visible = true;
            btnUpdate.Visible = false;
            btnUpdatePhoto.Visible = false;
            RequiredFieldValidatorStudentPhoto.ValidationGroup = "Error";
        }
    }
    private void BindCourseName()
    {
        DropDownListCourseName.Items.Clear();
        DropDownListCourseName.Items.Insert(0, new ListItem("Choose Course Name", "0"));
        DropDownListCourseName.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM tblSubjectMaster where Status = 'Active' and TCUid = '"+DropDownListTrainingCentre.SelectedValue+"' order by SubjectName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListCourseName.DataSource = dt;
        DropDownListCourseName.DataBind();
        DropDownListCourseName.Enabled = true;
        BindBatchName();
    }
    private void BindBatchName()
    {
        DropDownListBatchName.Items.Clear();
        DropDownListBatchName.Items.Insert(0, new ListItem("Choose Batch Name", "0"));
        DropDownListBatchName.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT BatchName+' ('+Timing+')' as BatchName, BatchUid FROM tblBatchMaster where Status = 'Active' and TCUid = '"+DropDownListTrainingCentre.SelectedValue+"' order by BatchName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListBatchName.DataSource = dt;
        DropDownListBatchName.DataBind();
        DropDownListBatchName.Enabled = true;
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
    private void RetriveStudentDetails()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("sp_StudentRegdMasterManagement", connn);
        cmddd.CommandType = CommandType.StoredProcedure;
        connn.Open();
        cmddd.Parameters.AddWithValue("@Action", "Select");
        cmddd.Parameters.AddWithValue("@SUid", Request.QueryString["SUid"]);
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            BindTrainingCentreName();
            DropDownListTrainingCentre.SelectedValue = readerr["TCUid"].ToString();
            txtStudentName.Text = readerr["StudentName"].ToString();
            txtGuardianName.Text = readerr["GuardianName"].ToString();
            txtDateOfBirth.Text = Convert.ToDateTime(readerr["DateOfBirth"]).ToString("dd-MM-yyyy");
            txtDateOfRegd.Text = Convert.ToDateTime(readerr["DateOfRegd"]).ToString("dd-MM-yyyy");
            txtEmail.Text = readerr["Email"].ToString();
            txtMobileNumber.Text = readerr["MobileNumber"].ToString();
            DropDownListGender.SelectedValue = readerr["Gender"].ToString();
            DropDownListCaste.SelectedValue = readerr["Category"].ToString();
            DropDownListReligion.SelectedValue = readerr["Religion"].ToString();
            DropDownListMotherTounge.SelectedValue = readerr["MotherTounge"].ToString();
            txtPresentAddress.Text = readerr["PresentAddress"].ToString();
            txtPermanentAddress.Text = readerr["PermanentAddress"].ToString();
            txtAadharNumber.Text = readerr["AadhaarNo"].ToString();
            ImageProfilePhoto.ImageUrl = readerr["Photo"].ToString();
            DropDownListBatchName.SelectedValue = readerr["BatchUid"].ToString();
            DropDownListCourseName.SelectedValue = readerr["SubjectUid"].ToString();
            BindCourseName();
            txtAdmissionFee.Text = Convert.ToDouble(readerr["AdmissionFee"]).ToString();
            RetriveCourseDetails();
        }
        connn.Close();
    }
    private void RetriveCourseDetails()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubjectMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@SubjectUid", DropDownListCourseName.SelectedValue);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txtCourseFee.Text = Convert.ToDouble(reader["Fees"]).ToString("N0");
            DropDownListCourseDuration.SelectedValue = reader["DayDuration"].ToString();
        }
        conn.Close();
    }
    protected void DropDownListCourseName_SelectedIndexChanged(object sender, EventArgs e)
    {
        RetriveCourseDetails();
    }
    private void RetriveMonthName()
    {
        DateTime date = Convert.ToDateTime(DateTime.Today);
        string month_name = date.ToString("MMMM");
        lblMonthName.Text = month_name.ToString();
        int year = date.Year;
        lblYearName.Text = year.ToString();
    }
    private void CreatePassword()
    {
        char[] charArr = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
        string UniquePassword = string.Empty;
        Random random = new Random();
        int lblotp = Convert.ToInt32(7);
        for (int i = 0; i < lblotp; i++)
        {
            int pos = random.Next(1, charArr.Length);
            if (!UniquePassword.Contains(charArr.GetValue(pos).ToString()))
                UniquePassword += charArr.GetValue(pos);
            else
                i--;
        }
        lblPassword.Text = UniquePassword;
    }
    private void CalculateAge()
    {
        DateTime dateofbirth = Convert.ToDateTime(txtDateOfBirth.Text);
        int now = int.Parse(DateTime.Now.ToString("yyyyMMdd"));
        int dob = int.Parse(dateofbirth.ToString("yyyyMMdd"));
        int age = (now - dob) / 10000;
        lblAge.Text = age.ToString();
    }
    public static string GetCurrentFinancialYear(string year)
    {
        int CurrentYear = DateTime.Today.Year;
        int PreviousYear = DateTime.Today.Year - 1;
        int NextYear = DateTime.Today.Year + 1;
        string PreYear = PreviousYear.ToString();
        string NexYear = NextYear.ToString();
        string CurYear = CurrentYear.ToString();
        string FinYear = null;
        if (DateTime.Today.Month > 3)
            FinYear = CurYear.Substring(2) + "-" + NexYear.Substring(2);
        else
            FinYear = PreYear.Substring(2) + "-" + CurYear.Substring(2);
        return FinYear.Trim();
    }
    private void RetriveBranchCodeAndYear()
    {
        string finalcialyear = GetCurrentFinancialYear("yyyy");
        string sMonth = DateTime.Now.ToString("MM");
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from tblTrainingCentreMaster where TCUid ='"+DropDownListTrainingCentre.SelectedValue+"'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblBranchCode.Text = reader["BranchCode"].ToString()+"/"+ finalcialyear+"/"+ sMonth;
        }
        conn.Close();
    }
    private void CreateStudentID()
    {
        RetriveBranchCodeAndYear();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        connn.Open();
        SqlDataAdapter sdaa = new SqlDataAdapter("select * from tblStudentMaster where TCUid ='" + DropDownListTrainingCentre.SelectedValue + "'", connn);
        DataTable dtt = new DataTable();
        sdaa.Fill(dtt);
        int cnt = dtt.Rows.Count;
        string initValue = new String('0', 16) + cnt;
        int newValue = Int32.Parse(initValue) + 1;
        string newValueString = newValue.ToString().PadLeft(2, '0');
        lblStudentID.Text = lblBranchCode.Text +"/"+ newValueString;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1Phtoto.PostedFile.ContentLength < 1 * 2048 * 2048)
        {
            RetriveMonthName();
            CreatePassword();
            CalculateAge();
            CreateStudentID();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("sp_StudentRegdMasterManagement", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@BatchUid", DropDownListBatchName.SelectedValue);
            cmd.Parameters.AddWithValue("@Password", lblPassword.Text);
            cmd.Parameters.AddWithValue("@StudentID", lblStudentID.Text);
            cmd.Parameters.AddWithValue("@StudentName", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtStudentName.Text.ToLower().Trim()));
            cmd.Parameters.AddWithValue("@GuardianName", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtGuardianName.Text.ToLower().Trim()));
            cmd.Parameters.AddWithValue("@DateOfBirth", Convert.ToDateTime(txtDateOfBirth.Text));
            string filenamepost = Path.GetFileName(FileUpload1Phtoto.PostedFile.FileName);
            FileUpload1Phtoto.SaveAs(Server.MapPath("~/Photo/" + txtMobileNumber.Text + filenamepost));
            cmd.Parameters.AddWithValue("@Photo", "../Photo/" + txtMobileNumber.Text + filenamepost);
            cmd.Parameters.AddWithValue("@PresentAddress", txtPresentAddress.Text);
            cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text);
            cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToLower());
            cmd.Parameters.AddWithValue("@Age", lblAge.Text);
            cmd.Parameters.AddWithValue("@Category", DropDownListCaste.SelectedValue);
            cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
            cmd.Parameters.AddWithValue("@AadhaarNo", txtAadharNumber.Text);
            cmd.Parameters.AddWithValue("@Religion", DropDownListReligion.Text);
            cmd.Parameters.AddWithValue("@MotherTounge", DropDownListMotherTounge.Text);
            cmd.Parameters.AddWithValue("@DateOfRegd", Convert.ToDateTime(txtDateOfRegd.Text));
            cmd.Parameters.AddWithValue("@UserType", "Student");
            cmd.Parameters.AddWithValue("@MonthOfRegd",lblMonthName.Text);
            cmd.Parameters.AddWithValue("@YearOfRegd", lblYearName.Text);
            cmd.Parameters.AddWithValue("@SubjectUid", DropDownListCourseName.SelectedValue);
            cmd.Parameters.AddWithValue("@CourseFee", Convert.ToDouble(txtCourseFee.Text));
            cmd.Parameters.AddWithValue("@AdmissionFee", Convert.ToDouble(txtAdmissionFee.Text));
            cmd.Parameters.AddWithValue("@TCUid", DropDownListTrainingCentre.SelectedValue);
            cmd.Parameters.AddWithValue("@Status", "Active");
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            ProgressBar.Visible = false;
            HtmlMeta meta = new HtmlMeta();
            meta.HttpEquiv = "Refresh";
            meta.Content = "2;url=ViewAllStudentDetails.aspx";
            this.Page.Controls.Add(meta);
            lblMessage.Text = "<i class='fa fa-check'></i>" + " Student Registered Successfully...";
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        CalculateAge();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_StudentRegdMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SUid", Request.QueryString["SUid"]);
        cmd.Parameters.AddWithValue("@BatchUid", DropDownListBatchName.SelectedValue);
        cmd.Parameters.AddWithValue("@StudentName", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtStudentName.Text.ToLower().Trim()));
        cmd.Parameters.AddWithValue("@GuardianName", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtGuardianName.Text.ToLower().Trim()));
        cmd.Parameters.AddWithValue("@DateOfBirth", Convert.ToDateTime(txtDateOfBirth.Text));
        cmd.Parameters.AddWithValue("@PresentAddress", txtPresentAddress.Text);
        cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text);
        cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToLower());
        cmd.Parameters.AddWithValue("@Age", lblAge.Text);
        cmd.Parameters.AddWithValue("@Category", DropDownListCaste.SelectedValue);
        cmd.Parameters.AddWithValue("@Gender", DropDownListGender.SelectedValue);
        cmd.Parameters.AddWithValue("@AadhaarNo", txtAadharNumber.Text);
        cmd.Parameters.AddWithValue("@Religion", DropDownListReligion.Text);
        cmd.Parameters.AddWithValue("@MotherTounge", DropDownListMotherTounge.Text);
        cmd.Parameters.AddWithValue("@DateOfRegd", Convert.ToDateTime(txtDateOfRegd.Text));
        cmd.Parameters.AddWithValue("@SubjectUid", DropDownListCourseName.SelectedValue);
        cmd.Parameters.AddWithValue("@CourseFee", Convert.ToDouble(txtCourseFee.Text));
        cmd.Parameters.AddWithValue("@AdmissionFee", Convert.ToDouble(txtAdmissionFee.Text));
        cmd.Parameters.AddWithValue("@TCUid", DropDownListTrainingCentre.SelectedValue);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "2;url=ViewAllStudentDetails.aspx";
        this.Page.Controls.Add(meta);
        lblMessage.Text = "<i class='fa fa-check'></i>" + " Student Updated Successfully...";
        lblMessage.ForeColor = System.Drawing.Color.White;
        lblMessage.CssClass = "alert alert-success";
    }

    protected void DropDownListTrainingCentre_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCourseName();
    }

    protected void btnUpdatePhoto_Click(object sender, EventArgs e)
    {
        if (FileUpload1Phtoto.PostedFile.ContentLength < 1 * 2048 * 2048)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("sp_StudentRegdMasterManagement", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "UpdatePhoto");
            cmd.Parameters.AddWithValue("@SUid", Request.QueryString["SUid"]);
            string filenamepost = Path.GetFileName(FileUpload1Phtoto.PostedFile.FileName);
            FileUpload1Phtoto.SaveAs(Server.MapPath("~/Photo/" + txtMobileNumber.Text + filenamepost));
            cmd.Parameters.AddWithValue("@Photo", "../Photo/" + txtMobileNumber.Text + filenamepost);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            RetriveStudentDetails();
            lblMessage.Text = "<i class='fa fa-check'></i>" + " Photo Updated Successfully...";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.CssClass = "alert alert-success";
        }
        else
        {
            lblMessage.Text = "<i class='fa fa-check'></i>" + " File Size Exceeded...";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.CssClass = "alert alert-danger";
        }
       
    }
}