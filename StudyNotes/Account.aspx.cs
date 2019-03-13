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

public partial class Account : System.Web.UI.Page
{
    private string[] userData = new string[6]; // User data list declaration
    private SqlConnection _connection; // Sql Connection declaration
    private SqlDataReader _reader; // Sql Data Reader declaration
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null) // Redirects to Login page if the Session["user"] is null (is not set)
        {
            Server.Transfer("login.aspx");
        }
        _connection = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineLectureNotesDBConnectionString"].ConnectionString); // Initializing the connection string
        _connection.Open(); // Opening the connection
        SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE UserID=@id", _connection); // Sql Command to retrieve user data
        cmd.Parameters.AddWithValue("@id", Session["userId"]); 
        _reader = cmd.ExecuteReader(); // Initializing Sql Data Reader as the result of the execution of Sql Command
        if (!_reader.HasRows) // If reader doesn't return any rows, redirect to logout page as the user data doesn't exist in the database
            Response.Redirect("Logout.aspx"); 
        _reader.Read();
        userData[0] = _reader["Username"].ToString();    // 0 => Username
        userData[1] = _reader["FirstName"].ToString();   // 1 => FirstName
        userData[2] = _reader["LastName"].ToString();    // 2 => LastName
        userData[3] = _reader["Email"].ToString();       // 3 => Email
        userData[4] = _reader["Address"].ToString();     // 4 => Address
        userData[5] = _reader["PhoneNumber"].ToString(); // 5 => PhoneNumber

        if (!IsPostBack) // If it's the first time that the page is beeing loaded
        {
            HideTextBoxes(); // Hides all texboxes
            DisableAllValidators(); // Disables all validators
            /////////////////////////////////////////////////
            LblUsername.Text += ":\t" + userData[0];      // Sets the value of the user info
            LblFirstName.Text += ":\t" + userData[1];     // Sets the value of the user info
            LblLastName.Text += ":\t" + userData[2];      // Sets the value of the user info
            LblEmail.Text += ":\t" + userData[3];         // Sets the value of the user info
            LblAddress.Text += ":\t" + userData[4];       // Sets the value of the user info
            LblPhoneNumber.Text += ":\t" + userData[5];   // Sets the value of the user info

            TxtFirstName.Text = userData[1];              // Sets the value of each field in their TextBox
            TxtLastName.Text = userData[2];               // Sets the value of each field in their TextBox
            TxtEmail.Text = userData[3];                  // Sets the value of each field in their TextBox
            TxtAddress.Text = userData[4];                // Sets the value of each field in their TextBox
            TxtPhoneNumber.Text = userData[5];            // Sets the value of each field in their TextBox
        }
        _connection.Close(); // Closing connection

        //Hide_ShowTextBox(TxtFirstName);
    }
    public void Hide_ShowTextBox(TextBox textbox) 
    { // Switches the visibility of the texbox passed as an argument
        textbox.Visible = !textbox.Visible;
    }
    public void HideTextBoxes()
    { // Sets the Visible property of all TextBoxes for user input to false
        TxtAddress.Visible = false;
        TxtEmail.Visible = false;
        TxtFirstName.Visible = false;
        TxtLastName.Visible = false;
        TxtPhoneNumber.Visible = false;
        TxtCrntPassword.Visible = false;
        TxtNewPassword.Visible = false;
        TxtPassConfirm.Visible = false;
    }
    public void DisableAllValidators()
    { // Sets the Enable property of all Validators on the page to false
        FirstNameRequiredValidator.Enabled = false;
        FirstNameCustomValidator.Enabled = false;
        LastNameCustomValidator.Enabled = false;
        LastNameRequiredValidator.Enabled = false;
        EmailCustomValidator.Enabled = false;
        EmailRequiredValidator.Enabled = false;
        CrntPasswordCustomValidator.Enabled = false;
        CrntPasswordRequiredValidator.Enabled = false;
        NewPasswordCustomValidator.Enabled = false;
        NewPasswordRequiredValidator.Enabled = false;
        PassConfirmCustomValidator.Enabled = false;
        PassConfirmRequiredValidator.Enabled = false;
    }

    private string _encode(string pass)
    { // Hashes the password passed as an argument (String) and returns it as an String
        using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
        {
            UTF8Encoding utf8 = new UTF8Encoding();
            byte[] data = md5.ComputeHash(utf8.GetBytes(pass));
            return Convert.ToBase64String(data);
        }
    }
    protected void newPasswordValidate(object source, ServerValidateEventArgs args)
    { // Validator for new password field
        NewPasswordCustomValidator.ErrorMessage = "This field is required";
        if (!string.IsNullOrEmpty(TxtCrntPassword.Text))
            if (string.IsNullOrEmpty(args.Value))
                args.IsValid = false;
    }
    protected void PassConfirmValidator(object source, ServerValidateEventArgs args)
    { // Validator for confirm password field
        PassConfirmCustomValidator.ErrorMessage = "This field is required";
        if (!string.IsNullOrEmpty(TxtCrntPassword.Text))
            if (string.IsNullOrEmpty(args.Value))
                args.IsValid = false;
            else if (args.Value != TxtNewPassword.Text)
            {
                PassConfirmCustomValidator.ErrorMessage = "Password doesn't match";
                args.IsValid = false;
            }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    { // Edit links event handler
        HideTextBoxes(); // hides all textboxes
        LinkButton source = (LinkButton)sender; // Gets the instance of the clicked LinkButton
        switch (source.ID) // Checks for the selected LinkButton's ID
        {
            case "linkFirstName": // Case FirstName
                FirstNameCustomValidator.Enabled = true;
                FirstNameRequiredValidator.Enabled = true;
                Hide_ShowTextBox(TxtFirstName);
                break;
            case "linkLastName": // Case LastName
                LastNameCustomValidator.Enabled = true;
                LastNameRequiredValidator.Enabled = true;
                Hide_ShowTextBox(TxtLastName);
                break;
            case "linkEmail": // Case Email
                EmailCustomValidator.Enabled = true;
                EmailRequiredValidator.Enabled = true;
                Hide_ShowTextBox(TxtEmail);
                break;
            case "linkAddress": // Case Address
                Hide_ShowTextBox(TxtAddress);
                break;
            case "linkPhoneNumber": // Case PhoneNumber
                Hide_ShowTextBox(TxtPhoneNumber);
                break;
            case "linkPassword": // Case Password
                CrntPasswordCustomValidator.Enabled = true;
                CrntPasswordRequiredValidator.Enabled = true;
                NewPasswordCustomValidator.Enabled = true;
                NewPasswordRequiredValidator.Enabled = true;
                PassConfirmCustomValidator.Enabled = true;
                PassConfirmCustomValidator.Enabled = true;
                Hide_ShowTextBox(TxtCrntPassword);
                Hide_ShowTextBox(TxtNewPassword);
                Hide_ShowTextBox(TxtPassConfirm);
                break;
        }
    }
    protected void BtnSave_Click(object sender, EventArgs args)
    { // Save Button Click handler
        bool isLogoutRequired = false; // In case the user changes the password, this variable helps determine if the user has to login
                                       // again
        if (!Page.IsValid) // Stops the event in case of any validation error
            return;
        if (_connection.State == ConnectionState.Closed) // Opens the connection if it is not open already
            _connection.Open();
        SqlCommand cmd; // Declaring the SQL Command
        if (TxtCrntPassword.Visible)
        { // If the user is trying to change the password
            cmd = new SqlCommand("UPDATE [User] SET Password=@pass WHERE Username=@username", _connection);
            cmd.Parameters.AddWithValue("@pass", _encode(TxtNewPassword.Text));
            isLogoutRequired = true;
        }
        else
        { // If the user is updating any information other than password
            cmd = new SqlCommand("UPDATE [User] SET FirstName=@fName, LastName=@lname, Email=@email, Address=@address, PhoneNumber=@pNumber WHERE Username=@username", _connection);

            cmd.Parameters.AddWithValue("@fname", TxtFirstName.Text);
            cmd.Parameters.AddWithValue("@lname", TxtLastName.Text);
            cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@address", TxtAddress.Text);
            cmd.Parameters.AddWithValue("@pnumber", TxtPhoneNumber.Text);
        }

        cmd.Parameters.AddWithValue("@username", Session["User"].ToString());
        try
        {
            cmd.ExecuteNonQuery().ToString();
        }
        catch (Exception ex)
        {
            lbllbl.Text += "Error: \t" + ex.Message;
        }
        _connection.Close(); // Closing the connection
        HideTextBoxes(); // Hiding all texboxes
        DisableAllValidators(); // Disabling all validations
        if (isLogoutRequired) // If user changed his/her password (if isLogoutRequired is true) -> Redirect user to the Logout page
            Response.Redirect("Logout.aspx");
        else // Else, redirect the user to the same page (Account page)
            Response.Redirect("Account.aspx");
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    { // Cancel Button Click handling
        HideTextBoxes(); // Hiding all texboxes
        DisableAllValidators(); // Disabling all validations
    }
}