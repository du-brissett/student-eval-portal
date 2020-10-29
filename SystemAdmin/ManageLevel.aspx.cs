using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SystemAdmin_ManageLevel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string error = BusinessLogic.InsertLevel(txtName.Text, txtDescription.Text, Decimal.Parse(txtMinScore.Text), Decimal.Parse(txtMaxScore.Text));

        if (error.Length > 3)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + error + "');", true);
        }
        else
        {
            LevelGridView.DataBind();
            clearForm();
        }
    }

    protected void clearForm()
    {
        txtName.Text = "";
        txtDescription.Text = "";
        txtMaxScore.Text = "";
        txtMinScore.Text = "";
    }


    protected void LevelGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        LevelGridView.DataBind();
    }

    protected void LevelGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        LevelGridView.DataBind();
    }
}