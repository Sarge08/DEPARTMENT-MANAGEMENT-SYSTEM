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

    protected void btnAddDesignation_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_Designation", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        //  gvDetails.DataBind();
        Clear();
    }
    private void Clear()
    {
        txtDesignation.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_Designation", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("DEGUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txtDesignation.Text = reader["Designation"].ToString();
            btnAddDesignation.Visible = false;
            btnUpdateDesignation.Visible = true;
        }
        conn.Close();
    }

    protected void btnUpdateDesignation_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_Designation", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("DEGUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        gvDetails.DataBind();
        Clear();
        btnAddDesignation.Visible = true;
        btnUpdateDesignation.Visible = false;
    }
}
