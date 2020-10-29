using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SystemAdmin_ManageFacultyRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataTableReader read = new DataTableReader(BusinessLogic.InsertFacultyRole(txtName.Text, txtDescription.Text, Int32.Parse(txtMinVal.Text), Int32.Parse(txtMaxVal.Text)));
        string msg = "";

        if (read.HasRows == false)
        {
            clearForm();
            GridViewFacultyRole.DataBind();
        }
        else
        {
            DataTable error = new DataTable();
            error.Columns.Add(new DataColumn("errors", typeof(string)));
            error.Load(read);

            foreach (DataRow row in error.Rows)
            {
                msg = msg + row[0].ToString() + "\\n";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + msg + "');", true);
        }
        
    }

    protected void clearForm()
    {
        txtName.Text = "";
        txtDescription.Text = "";
        txtMaxVal.Text = "";
        txtMinVal.Text = "";
    }
    
    protected void GridViewFacultyRole_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        GridViewFacultyRole.DataBind();
    }
    
    protected void GridViewFacultyRole_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridViewFacultyRole.DataBind();
    }
}