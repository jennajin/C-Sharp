using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AddNote : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null) Server.Transfer("login.aspx");
        if (!IsPostBack) DdlCategory.DataBind();
    }

    protected void BtnAddNote_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource2.InsertParameters["CategoryID"].DefaultValue = DdlCategory.Text;
            SqlDataSource2.InsertParameters["NoteTitle"].DefaultValue = TxtTitle.Text;
            SqlDataSource2.InsertParameters["CourseCode"].DefaultValue = TxtCourse.Text;
            SqlDataSource2.InsertParameters["Author"].DefaultValue = TxtAuthor.Text;
            SqlDataSource2.InsertParameters["NumberOfPages"].DefaultValue = TxtPages.Text;
            SqlDataSource2.InsertParameters["NoteUrl"].DefaultValue = TxtNoteUrl.Text;
            SqlDataSource2.Insert();
            Server.Transfer("Browse.aspx", true);
        }
    }
}