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

public partial class Home_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnMaterial_Click(object sender, EventArgs e)
    {
        LinkButton ImageButtonPrint = sender as LinkButton;
        GridViewRow GvRow = (GridViewRow)ImageButtonPrint.NamingContainer;
        Labeluid.Text = gvDetails.DataKeys[GvRow.RowIndex].Value.ToString();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SP_QuestionMaster", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.Parameters.AddWithValue("@Action", "Select");
        cmd.Parameters.AddWithValue("@QUid", Labeluid.Text);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string path = reader["Question"].ToString();
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "window.open('" + string.Format(path) + "', '_blank' )", true);
        }
        conn.Close();
    }
}