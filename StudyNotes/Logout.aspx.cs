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
        if (Session["User"] != null)
        {
            //Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //Response.Cache.SetNoStore();
            try
            {
                Session.Clear();
                Session.Abandon();
                //Session.Abandon();
                //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //Response.Buffer = true;
                //Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                //Response.Expires = -1000;
                //Response.CacheControl = "no-cache";
                //Response.Redirect("login.aspx", true);
            }
            catch (Exception ex)
            {
                lbllbl.Text = ex.Message;
            }
            Response.Redirect("Login.aspx");
            //Server.Transfer("Login.aspx");

        }
        //else
            //Server.Transfer("Default.aspx");
    }

    protected void BtnGoToMain_Click(object sender, EventArgs e)
    {
        //Server.Transfer("Default.aspx");
    }
}