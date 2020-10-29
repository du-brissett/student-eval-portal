using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SystemAdmin_ManagePositions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblCustomErrorMessage.Text = BusinessLogic.InsertPosition(txtName.Text, txtDescription.Text);
        clearForm();
        GridViewPosition.DataBind();
    }

    protected void clearForm()
    {


    }

    protected void GridViewFacultyRole_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridViewPosition.DataBind();
    }

    protected void GridViewFacultyRole_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridViewPosition.DataBind();
    }
}