using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SystemAdmin_ManageRoleComponent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string error = BusinessLogic.InsertRoleComponent(txtName.Text, txtDescription.Text, ddlFacultyRole.SelectedValue);

        if (error.Length > 3)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + error + "');", true);
        }
        else
        {
            RoleComponentGV.DataBind();
            clearForm();
        }
    }

    protected void ddlFacultyRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        RoleComponentGV.DataSourceID = "RoleComponentDataSource";
    }

    protected void clearForm()
    {
        txtName.Text = "";
        txtDescription.Text = "";
    }

    protected void RoleComponentGV_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        RoleComponentGV.DataBind();

    }

    protected void RoleComponentGV_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        RoleComponentGV.DataBind();
    }
}