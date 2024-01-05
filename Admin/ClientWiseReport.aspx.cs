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
        if (!Page.IsPostBack)
        {
            txtDateFrom.Text = DateTime.Today.ToString("dd-MM-yyyy");
            txtDateTo.Text = DateTime.Today.ToString("dd-MM-yyyy");
            BindGrid();
        }
    }
    private void BindGrid()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select f.*,p.ProjectName from tblFollowupMaster f,tblProjectMaster p where f.PUid=p.PUid and f.Status='active' and  f.DateOfCall between '" + Convert.ToDateTime(txtDateFrom.Text).ToString("yyyy-MM-dd") + "' AND '" + Convert.ToDateTime(txtDateTo.Text).ToString("yyyy-MM-dd") + "' order by f.CLid desc", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView.DataSource = dt;
        GridView.DataBind();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    private void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Vithal" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView.GridLines = GridLines.Both;
        GridView.HeaderStyle.Font.Bold = true;
        GridView.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        ExportGridToExcel(); 
    }


}
