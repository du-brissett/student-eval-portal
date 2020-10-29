using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting.WebControls;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.Shared;

public partial class Management_StaffOCRReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userName = Page.User.Identity.Name;

        ReportDocument rptDoc = new ReportDocument();
        rptDoc.Load(Server.MapPath("~/Reports/StaffOCRReport.rpt"));

        ParameterFields param = new ParameterFields();
        ParameterField par = new ParameterField();
        ParameterDiscreteValue paramValue = new ParameterDiscreteValue();

        rptDoc.SetParameterValue("@AcademicYear", ddlStaffOCR.SelectedValue);
        CRPStaff.ReportSource = rptDoc;
    }
   
}