using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class SystemAdmin_PositionFacultyManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
    {
        dlAssignedWeight.DataSourceID = "RoleDataSource";
        Reset();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int i = 0; //count for looping through datalist items
        int count = dlAssignedWeight.Items.Count;
        int total = 0; //tracks total of assigned weights
        int err = 0;

        DataTable dt = new DataTable();
                        
        dt.Columns.Add(new DataColumn("Role", typeof(string)));
        dt.Columns.Add(new DataColumn("Weight", typeof(Int32)));
        DataRow dr;
        
        while (count > 0)
        {
            Label label = (Label)dlAssignedWeight.Items[i].FindControl("lblFacultyRole");
            TextBox textbox = (TextBox)dlAssignedWeight.Items[i].FindControl("txtbxAssignedWeight");
            Label error = (Label)dlAssignedWeight.Items[i].FindControl("lblError");

            if (textbox.Text == "")
                textbox.Text = "0";

            total = total + Convert.ToInt32(textbox.Text);
            error.Text = BusinessLogic.ValidateAssignedWeight(Convert.ToInt32(textbox.Text), label.Text);
            //textbox.TextChanged += new EventHandler(textbox_TextChanged);
            

            if (error.Text == "")
                textbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#99FFCC");
            else
            {
                textbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF7070");
                err = err + 1;
            }
                        
            count -= 1;
            i += 1; 
            
            dr = dt.NewRow();
            dr[0] = label.Text;
            dr[1] = Convert.ToInt32(textbox.Text);
            
            dt.Rows.Add(dr);
        }

        if (total != 100)
        {
            string alert = "Assigned weights total MUST equate to 100. Total is " + total;
            dlAssignedWeight.BorderColor = System.Drawing.Color.FromName("Red");
            dlAssignedWeight.BorderWidth = 4;
            dlAssignedWeight.BorderStyle = BorderStyle.Dotted;
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('" + alert + "');", true);
        }
        else if (total == 100 && err == 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                BusinessLogic.UpdatePositionFacultyRole(ddlPosition.SelectedValue, row["Role"].ToString(), Convert.ToInt32(row["Weight"]));                
            }
            Reset();
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Update Successful!');", true);
        }        
    }

    protected void Reset()
    {
        dlAssignedWeight.BorderColor = System.Drawing.ColorTranslator.FromHtml("#66CCFF");
        dlAssignedWeight.BorderWidth = 6;
        dlAssignedWeight.BorderStyle = BorderStyle.Ridge;
    }    
}