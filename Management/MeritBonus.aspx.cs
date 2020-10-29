using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting.WebControls;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.Shared;
using System.Web.Security;

public partial class Management_MeritBonus : System.Web.UI.Page
{
    MembershipUser currentUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        currentUser = Membership.GetUser(); //get current user that is logged in
        string userName = currentUser.ToString();
        lblUserName.Text = userName;
        lblUserName.Visible = false;
        lblDescription.Visible = false;

        LinkBtnMerit.Visible = false;
        //hide report and data list on load page
        CrystalReportViewerMerit.Visible = false;

        if (IsPostBack)
        {
            lblDescription.Text = "Table below shows the merit bonus for your department members.";
            GridViewMerit.Visible = true;
            lblDescription.Visible = true;

            LinkBtnMerit.Visible = true;
        }
    }
    
    protected void GridViewMerit_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void LinkBtnMerit_Click(object sender, EventArgs e)
    {
        //string userName = Page.User.Identity.Name;
        //code for report
        string userName = currentUser.ToString().Trim();

        ReportDocument ReportDoct = new ReportDocument();

        ReportDoct.Load(Server.MapPath("~/Reports/MeritBonusReport.rpt"));
        ReportDoct.FileName = Server.MapPath(@"~/Reports/MeritBonusReport.rpt");
        ReportDoct.SetParameterValue("@Academic_Year", ddlYear.SelectedValue);
        ReportDoct.SetParameterValue("@RealID", userName);
        CrystalReportViewerMerit.ReportSource = ReportDoct;
        
        //unhide report on load page
        CrystalReportViewerMerit.Visible = true;
        GridViewMerit.Visible = false;

        //user.Visible = false;
        //lblMsg.Visible = false;
        //lblTableDesc.Visible = false;
        CrystalReportViewerMerit.Visible = true;

        //hide gridview
        GridViewMerit.Visible = false;
    }
}