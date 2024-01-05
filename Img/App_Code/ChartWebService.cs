using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data;//
using System.Data.SqlClient;//
using System.Configuration;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ChartWebService : System.Web.Services.WebService
{
    public class FruitEnity
    {
        public string DeptUid { get; set; }
        public double TotalAmount { get; set; }
    }
    [WebMethod]
    public List<FruitEnity> RetriveBranchWiseStudentDetails()
    {
        List<FruitEnity> piedata = new List<FruitEnity>();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select b.TCUid,b.CentreName, isnull(count(c.SUid),0) as TotalStudent from tblTrainingCentreMaster b, tblStudentMaster c where b.TCUid = c.TCUid and b.Status = 'Active' and c.Status = 'Active' group by b.TCUid,b.CentreName", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "Revenue");
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables["Revenue"].Rows.Count > 0)
                        {
                            foreach (DataRow dr in ds.Tables["Revenue"].Rows)
                            {
                                piedata.Add(new FruitEnity { DeptUid = dr["CentreName"].ToString(), TotalAmount = Convert.ToDouble(dr["TotalStudent"]) });
                            }
                        }
                    }
                }
            }
        }
        return piedata;
    }
    public class TargentAllocation
    {
        public string district { get; set; }
        public int TCUid { get; set; }
        public double target { get; set; }
        public Boolean drilldown { get; set; }
    }
    [WebMethod]
    public List<TargentAllocation> RetriveTrainingCentreWiseStudent()
    {
        List<TargentAllocation> YearRevenues = new List<TargentAllocation>();
        DataSet ds = new DataSet();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select b.TCUid,b.CentreName, isnull(count(c.SUid),0) as TotalStudent from tblTrainingCentreMaster b, tblStudentMaster c where b.TCUid = c.TCUid and b.Status = 'Active' and c.Status = 'Active' group by b.TCUid,b.CentreName";
                cmd.Connection = con;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds, "dsRevenue");
                }
            }
        }
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables["dsRevenue"].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables["dsRevenue"].Rows)
                    {
                        YearRevenues.Add(new TargentAllocation
                        {
                            district = dr["CentreName"].ToString(),
                            TCUid = Convert.ToInt32(dr["TCUid"]),
                            target = Convert.ToDouble(dr["TotalStudent"]),
                            drilldown = true
                        });
                    }
                }
            }
        }
        return YearRevenues;
    }
    [WebMethod]
    public List<TargentAllocation> TargetUsedByPIAOSFDC(string district)
    {
        List<TargentAllocation> QuarterRevenues = new List<TargentAllocation>();
        DataSet ds = new DataSet();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["HMS"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select sb.SubjectName, isnull(count(s.SUid),0) as TotalStudent from tblSubjectMaster sb, tblStudentMaster s  where sb.SubjectUid = s.SubjectUid and s.Status = 'Active' and sb.Status = 'Active' and s.TCUid = '"+ district + "' group by sb.SubjectName";
                cmd.Connection = con;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds, "dsQuarter");
                }
            }
        }
        if (ds != null)
        {
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables["dsQuarter"].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables["dsQuarter"].Rows)
                    {
                        QuarterRevenues.Add(new TargentAllocation
                        {
                            district = dr["SubjectName"].ToString(),
                            target = Convert.ToInt32(dr["TotalStudent"])
                        });
                    }
                }
            }
        }
        return QuarterRevenues;
    }
}
