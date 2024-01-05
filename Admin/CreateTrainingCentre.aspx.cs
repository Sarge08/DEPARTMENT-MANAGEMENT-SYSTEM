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
using System.Net.Mail;
using System.Text;
using System.Net;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtDateOfRegd.Text = DateTime.Today.ToString("dd-MM-yyyy");
        }
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        btnRefresh.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        {
            btnRefresh.Visible = false;
        }
        else
        {
            btnRefresh.Visible = true;
        }
    }
    private void RetriveLastTCID()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select TOP 1 TCCode from tblTrainingCentreMaster order by TCUid DESC", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblTCID.Text = readerr["TCCode"].ToString().Substring(8);
            int last = Convert.ToInt32(lblTCID.Text);
            int one = 1;
            int res = last + one;
            lblTCID.Text = "IMS/TC/-00" + res.ToString();
        }
        else
        {
            int last = 0;
            int one = 1;
            int res = last + one;
            lblTCID.Text = "IMS/TC/-00" + res.ToString();
        }
        connn.Close();
    }
    private void CreatePassword()
    {
        char[] charArr = "0123456789ABCDEFGIJKLMONPQRSTUVWXYZ".ToCharArray();
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
        lblUniqueKey.Text = UniquePassword;
    }
    protected void btnAddTC_Click(object sender, EventArgs e)
    {
        if (FileUpload1Phtoto.PostedFile.ContentLength < 1 * 2048 * 2048)
        {
            RetriveLastTCID();
            CreatePassword();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
            SqlCommand cmd = new SqlCommand("sp_TrainingCentreMasterManagement", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@TCCode", lblTCID.Text);
            cmd.Parameters.AddWithValue("@BranchCode", txtBranchCode.Text);

            string filenamepost = Path.GetFileName(FileUpload1Phtoto.PostedFile.FileName);
            FileUpload1Phtoto.SaveAs(Server.MapPath("~/Photo/" + txtMobileNumber.Text + filenamepost));
            cmd.Parameters.AddWithValue("@Photo", "../Photo/" + txtMobileNumber.Text + filenamepost);

            cmd.Parameters.AddWithValue("@Owner", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtAuthorizedPersonName.Text.ToLower().Trim()));
            cmd.Parameters.AddWithValue("@CentreName", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtCentreName.Text.ToLower().Trim()));
            cmd.Parameters.AddWithValue("@DateOfRegd", Convert.ToDateTime(txtDateOfRegd.Text));
            cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToLower());
            cmd.Parameters.AddWithValue("@Address", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtPresentAddresss.Text.ToLower().Trim()));
            cmd.Parameters.AddWithValue("@Password", lblUniqueKey.Text);
            cmd.Parameters.AddWithValue("@TCStatus", "Regd. Pending");
            cmd.Parameters.AddWithValue("@Status", "Active");
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Clear();
            gvDetails.DataBind();
            lblMessage.Text = "<i class='fa fa-check'></i>" + " New TC Created Successfully...";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.CssClass = "alert alert-success";
        }
        else
        {
            lblMessage.Text = "<i class='fa fa-remove'></i>" + " File Size Exceeded...";
            lblMessage.ForeColor = System.Drawing.Color.White;
            lblMessage.CssClass = "alert alert-danger";
        }
    }
    private void Clear()
    {
        txtBranchCode.Text = ""; txtAuthorizedPersonName.Text = "";txtCentreName.Text = "";txtMobileNumber.Text = "";txtEmail.Text = ""; txtPresentAddresss.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButton1 = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButton1.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("sp_TrainingCentreMasterManagement", connn);
        cmddd.CommandType = CommandType.StoredProcedure;
        connn.Open();
        cmddd.Parameters.AddWithValue("@Action", "Select");
        cmddd.Parameters.AddWithValue("@TCUid", lblUid.Text);
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            txtCentreName.Text = readerr["CentreName"].ToString();
            txtBranchCode.Text = readerr["BranchCode"].ToString();
            txtDateOfRegd.Text = Convert.ToDateTime(readerr["DateOfRegd"]).ToString("dd-MM-yyyy");
            txtAuthorizedPersonName.Text = readerr["Owner"].ToString();
            txtEmail.Text = readerr["Email"].ToString();
            txtMobileNumber.Text = readerr["MobileNumber"].ToString();
            txtPresentAddresss.Text = readerr["Address"].ToString();
            lblUniqueKey.Text = readerr["Password"].ToString();
            ImageProfilePhoto.ImageUrl = readerr["Photo"].ToString();
            btnAddTC.Visible = false;
            btnUpdateTC.Visible = true;
            btnSendMail.Visible = true;
            btnUpdatePhtoto.Visible = true;
        }
        connn.Close();
    }
    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string status = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "TCStatus"));

            if (status == "Regd. Pending")
            {
                e.Row.Cells[2].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[2].BackColor = System.Drawing.Color.OrangeRed;
            }
            if (status == "Regd. Done")
            {
                e.Row.Cells[2].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[2].BackColor = System.Drawing.Color.Green;
            }
        }
    }
    protected void btnUpdateTC_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_TrainingCentreMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@TCUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@BranchCode", txtBranchCode.Text);
        cmd.Parameters.AddWithValue("@Owner", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtAuthorizedPersonName.Text.ToLower().Trim()));
        cmd.Parameters.AddWithValue("@CentreName", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtCentreName.Text.ToLower().Trim()));
        cmd.Parameters.AddWithValue("@DateOfRegd", Convert.ToDateTime(txtDateOfRegd.Text));
        cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToLower());
        cmd.Parameters.AddWithValue("@Address", System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(txtPresentAddresss.Text.ToLower().Trim()));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Clear();
        btnAddTC.Visible = true;
        btnUpdateTC.Visible = false;
        btnSendMail.Visible = false;
        btnUpdatePhtoto.Visible = false;
        gvDetails.DataBind();
        lblMessage.Text = "<i class='fa fa-check'></i>" + " TC Update Successfully...";
        lblMessage.ForeColor = System.Drawing.Color.White;
        lblMessage.CssClass = "alert alert-success";
    }

    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        String Email = txtEmail.Text;
        String FullName = txtAuthorizedPersonName.Text;
        String EmailBody = "<h4>Dear " + FullName + ", Your Training Centre <b style='font-weight:700;color:#1fa5e5;'>" + txtCentreName.Text+ "</b> has beed registered successfully. Your login details for <b style='font-weight:700;color:#1fa5e5;'>e-IMS | Smart ERP</b> are provided below <br/> <br/>  Account Login Details <br/> ================================= <br/>Website : www.sit.sainaatech.com <br/> Username : " + txtEmail.Text+" <br/> Password : "+ lblUniqueKey.Text + " <br/> ================================= <br/> <br/> Thank you again for giving us the opportunity to be the service provider for your institution. <br/>Thanks & Regards,<br/>SIT Team <br/> <br/> <img src='https://www.sit.sainaatech.com/img/SIT.png'/> <br/>Sharma Institute of Technology <br/>Website : https://siteducations.in/ <br/>Mobile No : 8984722691, Email : director@siteducations.in <br/> HH-18 , CIVIL TOWNSHIP , ROURKELA-769012 , SUNDARGARH (ODISHA) </h4>";
        MailMessage PassRecMail = new MailMessage("sainaatechitsolutions@gmail.com", Email);
        PassRecMail.From = new MailAddress("sainaatechitsolutions@gmail.com", "Sainaatech IT Solutions");
        PassRecMail.Body = EmailBody;
        PassRecMail.IsBodyHtml = true;
        PassRecMail.Priority = MailPriority.High;
        PassRecMail.Subject = "Thank you for choosing Sainaatech IT Solutions";
        SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
        PassRecMail.BodyEncoding = Encoding.GetEncoding("Windows-1256");
        PassRecMail.BodyEncoding = Encoding.GetEncoding("iso-8859-1");
        SMTP.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        SMTP.Credentials = new NetworkCredential()
        {
            UserName = "sainaatechitsolutions@gmail.com",
            Password = "iwicmrwxyrmzyjtq"
        };
        SMTP.EnableSsl = true;
        SMTP.Send(PassRecMail);
        ApproveTCStatus();
        btnAddTC.Visible = true;
        btnUpdateTC.Visible = false;
        btnSendMail.Visible = false;
        Clear();
        lblMessage.Text = "<i class='fa fa-check'></i>" + " Mail Sent Successfully...";
        lblMessage.ForeColor = System.Drawing.Color.White;
        lblMessage.CssClass = "alert alert-success";
    }
    private void ApproveTCStatus()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_TrainingCentreMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "ApproveTC");
        cmd.Parameters.AddWithValue("@TCUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@TCStatus", "Regd. Done");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
    }

    protected void btnUpldate_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_TrainingCentreMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "UpdatePhoto");
        cmd.Parameters.AddWithValue("@TCUid", lblUid.Text);
        string filenamepost = Path.GetFileName(FileUpload1Phtoto.PostedFile.FileName);
        FileUpload1Phtoto.SaveAs(Server.MapPath("~/Photo/" + txtMobileNumber.Text + filenamepost));
        cmd.Parameters.AddWithValue("@Photo", "../Photo/" + txtMobileNumber.Text + filenamepost);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
    }
}