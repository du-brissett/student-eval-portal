using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting.WebControls;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.Shared;

public partial class Staff_StaffOCRView : System.Web.UI.Page
{
    MembershipUser currentUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        currentUser = Membership.GetUser(); //get surrent user that is logged in

        //store in label to retrieve usert
        user.Text = currentUser.ToString().Trim();

        //hide report and data list on load page
        CrystalReportViewerOCRViewStaff.Visible = false;

        DatalistOCR.Visible = false;
        user.Visible = false;
        LnkBtn.Visible = false;
        lblTableDesc.Visible = false;
    }

    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        BusinessLogic.GetAcademicYear(currentUser.ToString().Trim());
    }

    protected void dlCRR_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnOCR_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            BusinessLogic.OverallCompositeRatingView(currentUser.ToString().Trim(), ddlYear.SelectedValue);
            DatalistOCR.Visible = true;

            lblTableDesc.Text = "Table Shows the Computation of Overall Composite Rating";
            lblTableDesc.Visible = true;
            LnkBtn.Visible = true;
        }//end if
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //string userName = Page.User.Identity.Name;
        //code for report
        string userName = currentUser.ToString().Trim();

        ReportDocument ReportDoc = new ReportDocument();

        ReportDoc.Load(Server.MapPath("~/Reports/OCRViewStaff.rpt"));
        ReportDoc.FileName = Server.MapPath(@"~/Reports/OCRViewStaff.rpt");
        ReportDoc.SetParameterValue("@RealID", userName);
        ReportDoc.SetParameterValue("@AcademicYear", ddlYear.SelectedValue);

        CrystalReportViewerOCRViewStaff.ReportSource = ReportDoc;

        //hide report on load page
        CrystalReportViewerOCRViewStaff.Visible = true;

        DatalistOCR.Visible = false;
        user.Visible = false;
        //lblMsg.Visible = false;
        lblTableDesc.Visible = false;
    }
}
