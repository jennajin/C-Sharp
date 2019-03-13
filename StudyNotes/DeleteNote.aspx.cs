using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteNote : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) DetailsView1.DataBind();
        if (DetailsView1.DataItemCount == 0) Server.Transfer("Browse.aspx");
    }


    protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            LblError.Text = "A database error has occured.";
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            LblError.Text = "No updates done.";
        }
        else
        {
            Server.Transfer("Browse.aspx");
        }
    }


    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("Browse.aspx");
    }

}