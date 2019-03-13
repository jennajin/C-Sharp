using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Browse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null) Server.Transfer("login.aspx");
        
        if (!IsPostBack) GridView1.DataBind();
    }

    protected void BtnAddNote_Click(object sender, EventArgs e)
    {
        Server.Transfer("AddNote.aspx");
    }
}