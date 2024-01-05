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

    protected void btnAddIcon_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_IconMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("DEGUid", DropDownDesignation.SelectedValue);
        cmd.Parameters.AddWithValue("@IconTitle", txticontitle.Text);
        string filenamepost = Path.GetFileName(imgIcon.PostedFile.FileName);
        imgIcon.SaveAs(Server.MapPath("~/img/" + txticontitle.Text + filenamepost));
        cmd.Parameters.AddWithValue("@Image", "../img/" + txticontitle.Text + filenamepost);
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();
    }
    private void Clear()
    {
        txticontitle.Text = ""; 
    }

    protected void btnAddSubmenu_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubmenuMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@ICuid", DropdownIcon.SelectedValue);
        cmd.Parameters.AddWithValue("@SubMenu", txtsubmenu.Text);
        cmd.Parameters.AddWithValue("@SubMenuURL", txtsubmenuurl.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();
        ClearSubmenu();
    }
    private void ClearSubmenu()
    {
        DropdownIcon.SelectedValue = "0"; txtsubmenu.Text = ""; txtsubmenuurl.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_IconMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("ICuid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            DropDownDesignation.SelectedValue = reader["DEGUid"].ToString();
            txticontitle.Text = reader["IconTitle"].ToString();
            imagePreview.ImageUrl = reader["IconImage"].ToString();
            btnAddIcon.Visible = false;
            btnUpdate.Visible = true;
        }
        conn.Close();
    }



    protected void Imagebtn2_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lbluid1.Text = GridView1.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubmenuMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("SMUid", lbluid1.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            DropdownIcon.SelectedValue = reader["ICuid"].ToString();
            txtsubmenu.Text = reader["SubMenu"].ToString();
            txtsubmenuurl.Text = reader["SubMenuURL"].ToString();
            btnAddSubmenu.Visible = false;
            btnupdateMenu.Visible = true;
        }
        conn.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_IconMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@ICuid", lblUid.Text);
        cmd.Parameters.AddWithValue("DEGUid", DropDownDesignation.SelectedValue);
        cmd.Parameters.AddWithValue("@IconTitle", txticontitle.Text);
        cmd.Parameters.AddWithValue("@IconURL", txtIconUrl.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();
        btnAddIcon.Visible = true;
        btnUpdate.Visible = false;
    }

    protected void btnupdateMenu_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubmenuMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@SMUid", lbluid1.Text);
        cmd.Parameters.AddWithValue("@ICuid", DropdownIcon.SelectedValue);
        cmd.Parameters.AddWithValue("@SubMenu", txtsubmenu.Text);
        cmd.Parameters.AddWithValue("@SubMenuURL", txtsubmenuurl.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.DataBind();
        ClearSubmenu();
        btnAddSubmenu.Visible = true;
        btnupdateMenu.Visible = false;
    }


    protected void ImgBtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_IconMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Delete");
        cmd.Parameters.AddWithValue("@ICuid", lblUid.Text);
        conn.Open();
        cmd.ExecuteNonQuery(); 
        conn.Close();
        gvDetails.DataBind();
       Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void imgbtnDeleteSubmenu_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lbluid2.Text = GridView1.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_SubmenuMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Delete");
        cmd.Parameters.AddWithValue("@SMUid", lbluid2.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        GridView1.DataBind();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
