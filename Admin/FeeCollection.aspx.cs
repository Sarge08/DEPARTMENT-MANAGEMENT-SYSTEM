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
        if (!Page.IsPostBack)
        {
            BindCandidateDetailsDefault();
            txtDateOfPayment.Text = DateTime.Today.ToString("dd-MM-yyyy");
        }
    }
    private void BindBatchNameFromTC()
    {
        DropDownListBatchName.Items.Clear();
        DropDownListBatchName.Items.Insert(0, new ListItem("Choose Batch Name", "0"));
        DropDownListBatchName.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select BatchName+' ('+Timing+')' as BatchName, BatchUid from tblBatchMaster WHERE Status = 'Active' and TCUid = '" + DropDownListTrainingCentre.SelectedValue+"' order by BatchName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListBatchName.DataSource = dt;
        DropDownListBatchName.DataBind();
        DropDownListBatchName.Enabled = true;
    }
    protected void DropDownListTrainingCentre_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListTrainingCentre.SelectedValue != "0")
        {
            BindBatchNameFromTC();
            BindCandidateDetailsTCWise();
        }
        else
        {
            DropDownListBatchName.Items.Clear();
            DropDownListBatchName.Items.Insert(0, new ListItem("Choose Batch Name", "0"));
            DropDownListBatchName.Enabled = false;
            BindCandidateDetailsDefault();
        }
    }
    private void BindStudentNameFromBatch()
    {
        DropDownListStudentName.Items.Clear();
        DropDownListStudentName.Items.Insert(0, new ListItem("Choose Student Name", "0"));
        DropDownListStudentName.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT s.StudentName+' ('+s.MobileNumber+')' AS StudentName, s.SUid FROM tblStudentMaster S, tblBatchMaster b, tblTrainingCentreMaster tc where s.Status ='Active' and b.TCUid =tc.TCUid and s.TCUid=tc.TCUid and b.BatchUid = '"+DropDownListBatchName.SelectedValue+"' order by s.StudentName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListStudentName.DataSource = dt;
        DropDownListStudentName.DataBind();
        DropDownListStudentName.Enabled = true;
    }
    private void BindStudentNameFromTC()
    {
        DropDownListStudentName.Items.Clear();
        DropDownListStudentName.Items.Insert(0, new ListItem("Choose Student Name", "0"));
        DropDownListStudentName.Enabled = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT s.StudentName+' ('+s.MobileNumber+')' AS StudentName, s.SUid FROM tblStudentMaster S, tblBatchMaster b, tblTrainingCentreMaster tc where s.Status ='Active' and b.TCUid =tc.TCUid and s.TCUid=tc.TCUid and tc.TCUid = '" + DropDownListTrainingCentre.SelectedValue + "' order by s.StudentName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListStudentName.DataSource = dt;
        DropDownListStudentName.DataBind();
        DropDownListStudentName.Enabled = true;
    }
    protected void DropDownListBatchName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListBatchName.SelectedValue != "0")
        {
            BindStudentNameFromBatch();
        }
        else
        {
            BindStudentNameFromTC();
        }
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
    private void BindCandidateDetailsTCWise()
    {
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select tc.CentreName,s.*,b.BatchName,sb.SubjectName from tblTrainingCentreMaster tc, tblStudentMaster s, tblBatchMaster b, tblSubjectMaster sb where s.TCUid = tc.TCUid and s.BatchUid = b.BatchUid and s.SubjectUid = sb.SubjectUid and s.Status = 'Active' and tc.Status = 'Active' and sb.Status = 'Active' and tc.TCUid = '"+DropDownListTrainingCentre.SelectedValue+"' order by s.SUid desc", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
    private void BindCandidateDetailsBatchWise()
    {
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select tc.CentreName,s.*,b.BatchName,sb.SubjectName from tblTrainingCentreMaster tc, tblStudentMaster s, tblBatchMaster b, tblSubjectMaster sb where s.TCUid = tc.TCUid and s.BatchUid = b.BatchUid and s.SubjectUid = sb.SubjectUid and s.Status = 'Active' and tc.Status = 'Active' and sb.Status = 'Active' and tc.TCUid = '" + DropDownListTrainingCentre.SelectedValue + "' order by s.SUid desc", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
    private void BindCandidateDetailsStudentWise()
    {
        SqlConnection connnnnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select tc.CentreName,s.*,b.BatchName,sb.SubjectName from tblTrainingCentreMaster tc, tblStudentMaster s, tblBatchMaster b, tblSubjectMaster sb where s.TCUid = tc.TCUid and s.BatchUid = b.BatchUid and s.SubjectUid = sb.SubjectUid and s.Status = 'Active' and tc.Status = 'Active' and sb.Status = 'Active' and s.SUid = '" + DropDownListStudentName.SelectedValue+"' order by s.SUid desc", connnnnn);
        connnnnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmddd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvDetails.DataSource = dt;
        gvDetails.DataBind();
    }
    protected void DropDownListStudentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListStudentName.SelectedValue != "0")
        {
            BindCandidateDetailsStudentWise();
        }
        else
        {
            BindCandidateDetailsBatchWise();
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("sp_StudentRegdMasterManagement", connn);
        cmddd.CommandType = CommandType.StoredProcedure;
        connn.Open();
        cmddd.Parameters.AddWithValue("@Action", "Select");
        cmddd.Parameters.AddWithValue("@SUid", lblUid.Text);
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
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
            ImageProfilePhoto.ImageUrl = readerr["Photo"].ToString();
            lblTCUid.Text = readerr["TCUid"].ToString();
            BindCourseName();
            DropDownListCourseName.SelectedValue= readerr["SubjectUid"].ToString();
            txtCourseFee.Text = Convert.ToDouble(readerr["CourseFee"]).ToString("N0");
            ValidateAmount();
            CalculateTotalPaidAmount();
            if(txtCourseFee.Text == txtPreviousPayment.Text)
            {
                txtCurrentPayment.Enabled = false;
            }
            else
            {
                txtCurrentPayment.Enabled = true;
            }
            BindAdvance();
        }
        connn.Close();
    }
    private void CalculateTotalPaidAmount()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("sp_AdvancePaymentMasterManagement", connn);
        cmddd.CommandType = CommandType.StoredProcedure;
        connn.Open();
        cmddd.Parameters.AddWithValue("@Action", "PreviousAmount");
        cmddd.Parameters.AddWithValue("@SUid", lblUid.Text);
        cmddd.Parameters.AddWithValue("@PaymentDate", Convert.ToDateTime(txtDateOfPayment.Text).ToString("yyyy-MM-dd"));
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            txtPreviousPayment.Text = Convert.ToDouble(readerr["TotalAmount"]).ToString("N0");
        }
        connn.Close();
    }
    private void ValidateAmount()
    {
        double prev = Convert.ToDouble(txtPreviousPayment.Text);
        double total = Convert.ToDouble(txtCourseFee.Text);
        RangeValidator1_txtCurrentPayment.MaximumValue = Convert.ToDouble(total - prev).ToString();
    }
    private void BindCourseName()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM tblSubjectMaster where Status = 'Active' and TCUid = '" + lblTCUid.Text + "' order by SubjectName asc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DropDownListCourseName.DataSource = dt;
        DropDownListCourseName.DataBind();
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
        SqlCommand cmd = new SqlCommand("select * from tblTrainingCentreMaster where TCUid ='" + lblTCUid.Text + "'", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblBranchCode.Text = reader["BranchCode"].ToString() + "/" + finalcialyear + "/" + sMonth;
        }
        conn.Close();
    }
    private void CreateMRNumber()
    {
        RetriveBranchCodeAndYear();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        connn.Open();
        SqlDataAdapter sdaa = new SqlDataAdapter("select * from tblAdvanceMaster where TCUid ='" + lblTCUid.Text + "'", connn);
        DataTable dtt = new DataTable();
        sdaa.Fill(dtt);
        int cnt = dtt.Rows.Count;
        string initValue = new String('0', 16) + cnt;
        int newValue = Int32.Parse(initValue) + 1;
        string newValueString = newValue.ToString().PadLeft(2, '0');
        lblMRNumber.Text = lblBranchCode.Text + "/" + newValueString;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        CreateMRNumber();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_AdvancePaymentMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@MRNumber", lblMRNumber.Text);
        cmd.Parameters.AddWithValue("@SUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@AdvanceAmount", Convert.ToDouble(txtCurrentPayment.Text));
        cmd.Parameters.AddWithValue("@PaymentDate", Convert.ToDateTime(txtDateOfPayment.Text));
        cmd.Parameters.AddWithValue("@PaymentMode", DropDownListPaymentMode.SelectedValue);
        cmd.Parameters.AddWithValue("@PaymentHead", DropDownListPaymentHead.SelectedValue);
        cmd.Parameters.AddWithValue("@NextPaymentDate", Convert.ToDateTime(txtDateOfPayment.Text).AddDays(Convert.ToInt32(DropDownListNextPaymentOn.SelectedValue)));
        if (DropDownListNextPaymentOn.SelectedValue!= "1")
        {
            cmd.Parameters.AddWithValue("@PaymentStatus", "Payment Pending");
        }
        else
        {
            cmd.Parameters.AddWithValue("@PaymentStatus", "Payment Done");
        }
        cmd.Parameters.AddWithValue("@TCUid", lblTCUid.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        BindAdvance();
        Clear();
        CalculateTotalPaidAmount();
    }
    private void Clear()
    {
        DropDownListPaymentHead.SelectedValue = "0"; DropDownListPaymentMode.SelectedValue = "0";txtCurrentPayment.Text = "";txtRemainingFee.Text = "";DropDownListNextPaymentOn.SelectedValue = "0";
    }
    private void BindAdvance()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select A.*, SB.Fees,SB.Fees-A.AdvanceAmount AS Remaining from tblAdvanceMaster A, tblStudentMaster S, tblSubjectMaster SB where A.Status = 'Active' AND A.SUid =S.SUid AND S.SubjectUid =SB.SubjectUid and A.SUid = '" + lblUid.Text + "' order by A.AdvanceUid desc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvDetailsIPAdvance.DataSource = dt;
        gvDetailsIPAdvance.DataBind();
    }
}