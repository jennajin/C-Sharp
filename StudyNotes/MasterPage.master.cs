using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    { // Page Load handler
        if (Session["user"] == null)
            // If Session["user"] is not set (User is not logged in) sets the visible property of the Logout button to false
            BtnLogout.Visible = false;
        else
        { // Else (User is logged in and the Session["user"] value is not null, sets the visible property of Login and Registration button to false
            linkLogin.Visible = false;
            linkRegister.Visible = false;
        }
    }
    protected void BtnLogoutClick(object sender, EventArgs e)
    { // Logout Button Click handler
        Response.Redirect("Logout.aspx"); // Redirect's user to the Logout page
    }
    
}
