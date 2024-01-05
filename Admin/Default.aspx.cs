 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_Default:System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
     
        if (Session["AdminUid"] != null)
        {
            Total();
            TotalPlaced();
            TotalNotPlaced();
            TotalRegisteredPlaced();
        }
        else
        {
            Session["AdminUid"] = null;
            Response.Redirect("../");
        }
    }
    private void Total()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select count(*) as Total from tbl_StudentMaster where Status='Active'", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lbltotalRecord1.Text = readerr["Total"].ToString();
        }
        connn.Close();
    }
    private void TotalPlaced()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select count(*) as Total from tbl_PlacementMaster where Status='Active' and PStatus='Yes'", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblTotalCall.Text = readerr["Total"].ToString();
        }
        connn.Close();
    }
    private void TotalNotPlaced()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select count(*) as Total from tbl_PlacementMaster where Status='Active' and PStatus='No'", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblFollowOfNextDay.Text = readerr["Total"].ToString();
        }
        connn.Close();
    }
    private void TotalRegisteredPlaced()
    {
        SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmddd = new SqlCommand("select count(*) as Total from tbl_PlacementMaster where Status='Active'", connn);
        connn.Open();
        SqlDataReader readerr = cmddd.ExecuteReader();
        if (readerr.Read())
        {
            lblTotalInterestedClient.Text = readerr["Total"].ToString();
        }
        connn.Close();
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string status = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "PStatus"));

            if (status == "Yes")
            {
                e.Row.Cells[1].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[1].BackColor = System.Drawing.Color.Green;
            }
            if (status == "No")
            {
                e.Row.Cells[1].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[1].BackColor = System.Drawing.Color.Red;
            }
        }
    }
}