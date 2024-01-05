using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Home:System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(Session["SUid"] != null)
		{
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
			SqlCommand cmd = new SqlCommand("select * from tbl_StudentMaster where Status='Active' and SUid=@SUid", conn);
			conn.Open();
			cmd.Parameters.AddWithValue("@SUid", Session["SUid"].ToString());
			SqlDataReader reader = cmd.ExecuteReader();
			if(reader.Read())
			{
				lblName.Text = reader["SName"].ToString();
			}
			conn.Close();
		}
		else
		{
			Session["SUid"] = null;
			Response.Redirect("../");
		}
	}

	protected void btnLogout_Click(object sender, EventArgs e)
	{
        Session["SUid"] = null;
        Response.Redirect("../login.aspx");
    }

}
