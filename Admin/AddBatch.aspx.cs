using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddBatch_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_BatchMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Insert");
        cmd.Parameters.AddWithValue("@TCUid", DropDownListTrainingCentre.SelectedValue);
        cmd.Parameters.AddWithValue("@BatchName", txtBatchName.Text);
        cmd.Parameters.AddWithValue("@Timing", txtBatchTiming.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        DropDownListTrainingCentre.SelectedValue = "0";
        txtBatchName.Text = "";
        txtBatchTiming.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ImageButtonPrint = sender as ImageButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        lblUid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_BatchMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@BatchUid", lblUid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            DropDownListTrainingCentre.Text = reader["TCUid"].ToString();
            txtBatchName.Text = reader["BatchName"].ToString();
            txtBatchTiming.Text = reader["Timing"].ToString();
            btnAddBatch.Visible = false;
            btnUpdateBatch.Visible = true;
        }
        conn.Close();
    }

    protected void btnUpdateBatch_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("sp_BatchMasterManagement", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("@BatchUid", lblUid.Text);
        cmd.Parameters.AddWithValue("@TCUid", DropDownListTrainingCentre.SelectedValue);
        cmd.Parameters.AddWithValue("@BatchName", txtBatchName.Text);
        cmd.Parameters.AddWithValue("@Timing", txtBatchTiming.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        gvDetails.DataBind();
        DropDownListTrainingCentre.SelectedValue = "0";
        txtBatchName.Text = "";
        txtBatchTiming.Text = "";
	btnAddBatch.Visible = true;
        btnUpdateBatch.Visible = false;
    }
}