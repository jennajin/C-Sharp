using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuccessLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null && Session["user"].ToString() != "")
            UserFromSession.Text = Session["user"].ToString();
        else
            Server.Transfer("Login.aspx");
    }

    protected void BtnGoToMain_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx");
    }
}