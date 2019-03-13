<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
    <!-- Custom Validation -->
    // Username custom validation check 
    function usernameValidate(oSrc, args) {
        var first_character = args.Value.charAt(0);
        var letters = /[A-z]/;
        var lettersAndNumbers = /^[a-zA-Z0-9]+$/;

        // check whether first character is a letter or not
        if (!first_character.match(letters))
            args.IsValid = false;

        // check the user name is all letters and numbers
        if (args.Value.search(lettersAndNumbers) == -1)
            args.IsValid = false;
    }


    // Password custom validation check 
    function passwordValidate(oSrc, args) {
        var value = args.Value;
        var first_character = args.Value.charAt(0);
        var letters = /[A-z]/;
        var special_characters = /[!*]/;
        var numbers = /[0-9]/;

        // check the length
        if (value.length < 8 || value.length > 16)
            args.IsValid = false;

        // check whether first character is a letter or not
        if (!first_character.match(letters))
            args.IsValid = false;

        // check whether password includes ! or *
        if (value.search(special_characters) == -1)
            args.IsValid = false;

        // check whether password includes at least one digit
        if (value.search(numbers) == -1)
            args.IsValid = false;
    }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:CustomValidator ID="CredentialsValidator" runat="server" ControlToValidate="TxtUsername" OnServerValidate="CredentialValidator" CssClass="alert alert-danger" Display="Dynamic" ErrorMessage="Wrong username or password"></asp:CustomValidator>
    <div class="row">
        <!-- left column -->
        <div class="col-md-5 mx-auto mt-5 login_column">
            <!-- username-->
            <div class="form-group row">
                <asp:Label ID="LblUsername" runat="server" Text="Username" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- username validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert alert-warning" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="usernameValidate" ControlToValidate="txtUsername" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid username"></asp:CustomValidator>
                </div>
                <!-- /col -->
            </div>
            <!-- /row: username -->

            <!-- password-->
            <div class="form-group row">
                <asp:Label ID="LblPassword" runat="server" Text="Password" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="form-control" MaxLength="16"></asp:TextBox>
                </div>
            </div>
            <!-- password validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert alert-warning" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="passwordValidate" ControlToValidate="txtPassword" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid password"></asp:CustomValidator>
                </div>
                <!-- /col: password -->
            </div>
            <!-- /row: password -->
        </div>
        <!-- /left column -->

        <!-- right column -->
        <div class="vl mt-5"></div>
        <div class="col-md-6 mx-auto mt-5">
            <asp:Label ID="LblLoginInstruction" runat="server" Font-Bold="True" Font-Size="Larger" Text="Login Instruction" CssClass="col-sm-2 col-form-label"></asp:Label>
            <p class="text-justify">
                <b>Username</b>
                <br />
                &bull; Begins with a letter.
                <br />
                &bull; Must be all letters and numbers.<br />
                <b>Password</b>
                <br />
                &bull; Must be 8 to 16 characters long.
                <br />
                &bull; Begins with a letter.
                <br />
                &bull; Contains at least one ! or *.
                <br />
                &bull; Contains at least one digit.
            </p>
            <asp:Label ID="LblSecurity" runat="server" Font-Size="Larger" Text="Security" Font-Bold="True" CssClass="col-sm-2 col-form-label"></asp:Label>
            <p>For security reasons don't forget to log out when you are done.</p>
        </div>
        <!-- /right column -->
    </div>
    <!-- /row -->

    <!-- Buttont: Sign in -->
    <div class="row">
        <div class="col-md-2 mt-2 signinBtn">
            <asp:Button ID="BtnSignIn" runat="server" Text="Sign in" OnClick="BtnSignIn_Click" CssClass="btn btn-success" />
        </div>
        <!-- /col: button -->
    </div>
    <!-- /row: button -->

    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <br />
</asp:Content>
