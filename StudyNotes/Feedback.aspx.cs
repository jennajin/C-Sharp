using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null) Server.Transfer("login.aspx");
    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource1.InsertParameters["FeedbackTitle"].DefaultValue = DropDownList1.Text;
            SqlDataSource1.InsertParameters["Name"].DefaultValue = TxtName.Text;
            SqlDataSource1.InsertParameters["Email"].DefaultValue = TxtEmail.Text;
            SqlDataSource1.InsertParameters["Message"].DefaultValue = TareaComments.Value;
            SqlDataSource1.InsertParameters["Complaint"].DefaultValue = (ChkComplaint.Checked ? 1 : 0).ToString();
            SqlDataSource1.Insert();
            Server.Transfer("FeedbackConfirmation.aspx", true);
        }
    }
}