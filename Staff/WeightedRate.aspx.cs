﻿using System;
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

public partial class Staff_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userName = Page.User.Identity.Name;
        Session["user"] = userName;

        ReportDocument rptDoc = new ReportDocument();
        rptDoc.Load(Server.MapPath("~/Reports/WeightedRating.rpt"));

        ParameterFields param = new ParameterFields();
        ParameterField par = new ParameterField();
        ParameterDiscreteValue paramValue = new ParameterDiscreteValue();

        par.Name = "@RealID";
        paramValue.Value = userName;
        par.CurrentValues.Add(paramValue);
        param.Add(par);
        rptDoc.SetParameterValue("@RealID", paramValue);

        rptDoc.SetParameterValue("RealID", userName);
        CrysRepCR.ReportSource = rptDoc;


        rptDoc.SetParameterValue("@facultyRole", ddlFacultyRole.SelectedValue);
        rptDoc.SetParameterValue("@academicYear", ddlAcademic.SelectedValue);
        CrysRepCR.ReportSource = rptDoc;
    }   
}