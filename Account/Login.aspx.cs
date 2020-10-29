using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register.aspx";
        
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
    }
    
    protected void OnAuthentication(object sender, AuthenticateEventArgs e)
    {
        e.Authenticated = true;
        string user = Login.UserName;
        
        if (Roles.IsUserInRole(user, "System Administrator"))
            Login.DestinationPageUrl = "~/SystemAdmin/AdminHome.aspx";
        
        if (Roles.IsUserInRole(user, "Student"))
            Login.DestinationPageUrl = "~/Student/StudentHome.aspx";

        if (Roles.IsUserInRole(user, "Staff"))
            Login.DestinationPageUrl = "~/Staff/StaffHome.aspx";

        if (Roles.IsUserInRole(user, "Management"))
            Login.DestinationPageUrl = "~/Management/ManagementHome.aspx";
    }
}