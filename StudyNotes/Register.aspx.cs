using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

public partial class Register : System.Web.UI.Page
{
    SqlConnection connection; // Sql Connection declaration
    protected void Page_Load(object sender, EventArgs e)
    {
        connection = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineLectureNotesDBConnectionString"].ConnectionString); // Sql Connection initialization on Page Load event
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) // If the page is not valid, the if statement body (The 'return') stops the method from executing further
            return;
        SqlCommand query = new SqlCommand("INSERT into [User](FirstName, LastName, PhoneNumber, Email, Address, Username, Password) VALUES (@fName, @lName, @pNumber, @email, @address, @uName, @pass)", connection); // Sql Command query declaration and initialization
        query.Parameters.AddWithValue("@fName", TxtFirstName.Text); // First Name
        query.Parameters.AddWithValue("@lName", TxtLastName.Text); // Last Name
        query.Parameters.AddWithValue("@pNumber", TxtPhoneNumber.Text); // Phone Number
        query.Parameters.AddWithValue("@email", TxtEmail.Text); // Email Address
        query.Parameters.AddWithValue("@address", TxtAddress.Text); // Postal Address
        query.Parameters.AddWithValue("@uName", TxtUsername.Text); // Username
        query.Parameters.AddWithValue("@pass", _encode(TxtPassword.Text)); // Password
        int result = 0;
        try
        {
            result = query.ExecuteNonQuery();
        }
        catch (Exception ex)
        {

        }
        if (result > 0)
            // Registered
            Server.Transfer("Login.aspx");
        connection.Close();
    }

    private bool IsUsernameUnique(string username, SqlConnection conn)
    { // Checks if the username already exists in the database, if it does, returns False and returns True otherwise
        if (conn.State == ConnectionState.Closed) // Checks if the connection is closed. If it is, the method opens the connection
            conn.Open();
        SqlCommand query = new SqlCommand("SELECT Count(*) FROM [User] WHERE Username=@username", conn); // Declaration and initialization of the SqlCommand
        query.Parameters.AddWithValue("@username", username); // Adds the value of username (Method's argument) to the query
        int exists = (int)query.ExecuteScalar(); // Executes the query and store's the int value of Count in the variable
        if (exists > 0)
            return false;
        return true;
    }

    protected void UsernameAvailabilityValidator(object source, ServerValidateEventArgs args)
    { // Validates and checks if the username entered in the TxtUsername exists in the database
        try
        {
            if (!IsUsernameUnique(args.Value, connection)) // - This method [_isUsernameUnique(String username, SqlConnection connection)]
            {                                               // - searches for username in database, returns True if username is available
                usernameValidator.ErrorMessage = "Username already exists";
                args.IsValid = false;
                return; // Stops the method from executing further
            }
            usernameValidator.ErrorMessage = "Please enter a valid username";
        }
        catch (Exception ex)
        {
            usernameValidator.ErrorMessage = "Server error, please try again later";
            args.IsValid = false;
        }
    }
    protected void PassConfirmValidator(object source, ServerValidateEventArgs args) // Compares the value of TxtPassword with the value of
    {                                                                         // TxtPassConfirm. Sets the IsValid property to the result of the
        args.IsValid = (args.Value == TxtPassword.Text);    
        // comparison. (True/False)
    }
    private string _encode(string pass)
    { // Hashes the password string passed as an argument and returns the result
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            UTF8Encoding utf8 = new UTF8Encoding();
            byte[] data = md5.ComputeHash(utf8.GetBytes(pass));
            return Convert.ToBase64String(data);
        }
    }
}