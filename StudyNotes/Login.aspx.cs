using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;


public partial class Login : System.Web.UI.Page
{
    private SqlConnection _connection; // Sql Connection declaration
    protected void Page_Load(object sender, EventArgs e)
    { // Page Load handler
        if(Session["user"] != null && Session["user"].ToString() != "")
        { // If the user is logged in, redirects to main page
            Response.Redirect("default.aspx");
        }
        _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineLectureNotesDBConnectionString"].ConnectionString); // Sql Connection initialization on Page Load event
    }

    protected void BtnSignIn_Click(object sender, EventArgs e)
    { // Signin Button Click handler
        if (Page.IsValid) // If the page is valid
        {
            Session["user"] = TxtUsername.Text; // Sets the Session["user"] to the value of Username Text Box
            if (_connection.State == ConnectionState.Closed) // Opens the connection if it is not open already
                _connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT UserID, Username FROM [User] WHERE Username=@username", _connection); // Initialization of Sql Command
            cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
            SqlDataReader reader = cmd.ExecuteReader(); 
            if (!reader.HasRows)
                return;
            reader.Read();
            Session["userId"] = reader["UserID"]; // Sets Session["userId"]
            Session["user"] = reader["Username"]; // Sets Session["user"]
            _connection.Close(); // Closing connection
            Server.Transfer("SuccessLogin.aspx"); // Transfer to SuccessLogin page
        }
    }
    protected void CredentialValidator(object source, ServerValidateEventArgs args)
    { // Credential validation authenticate the user
        args.IsValid = AuthenticateUser(args.Value, _encode(TxtPassword.Text), _connection); // Calling AuthenticateUser
        if (_connection.State == ConnectionState.Open) // Closes the connection if it's open
            _connection.Close();
    }
    private bool AuthenticateUser(string username, string password, SqlConnection conn)
    { // 
        if (conn.State == ConnectionState.Closed) // Checks if the connection is closed. If it is, the method opens the connection
            conn.Open();
        SqlCommand query = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE Username=@username AND Password=@password", conn);
        query.Parameters.AddWithValue("@username", username);
        query.Parameters.AddWithValue("@password", password);
        if ((int)query.ExecuteScalar() == 1)
            return true;
        return false;
    }
    private string _encode(string pass)
    {
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            UTF8Encoding utf8 = new UTF8Encoding();
            byte[] data = md5.ComputeHash(utf8.GetBytes(pass));
            return Convert.ToBase64String(data);
        }
    }
}