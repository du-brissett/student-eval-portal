using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_CompositeRoleRating : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable table = BusinessLogic.GetStaffbyManager(Page.User.Identity.Name);
            foreach (DataRow row in table.Rows)
            {
                ddlStaff.Items.Add(new ListItem(row[0].ToString(), row[1].ToString()));
            }
        }
    }

    protected void ddlFacultyRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblSemester.SelectedIndex == -1)
            dlCRR.DataSourceID = "WeightedRatingDataSource";
        else
            dlCRR.DataSourceID = "WeightedRatingPerSemester";
    }

    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable sem = BusinessLogic.GetSemesters(ddlStaff.SelectedValue.ToString(), ddlYear.SelectedItem.ToString());
        foreach (DataRow row in sem.Rows)
        {
            rblSemester.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
        }
    }
}