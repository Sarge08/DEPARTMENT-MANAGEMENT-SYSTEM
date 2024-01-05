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
		if(Session["AdminUid"] != null)
		{
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
			SqlCommand cmd = new SqlCommand("select * from tbl_adminLoginMaster where ADMUid = @ADMUid", conn);
			conn.Open();
			cmd.Parameters.AddWithValue("@ADMUid", Session["AdminUid"].ToString());
			SqlDataReader reader = cmd.ExecuteReader();
			if(reader.Read())
			{
				lblName.Text = reader["Name"].ToString();
			}
			conn.Close();
		}
		else
		{
			Session["AdminUid"] = null;
			Response.Redirect("../");
		}
	}

	protected void btnLogout_Click(object sender, EventArgs e)
	{
		Session["AdminUid"] = null;
		Response.Redirect("../login.aspx");
	}

}
