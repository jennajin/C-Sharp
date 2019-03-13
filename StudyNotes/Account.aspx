<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        // Custom Validation
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

        // FirstName custom validation check 
        function firstnameValidate(oSrc, args) {
            var first_character = args.Value.charAt(0);
            var letters = /[A-z]/;
            var numbers = /[0-9]/
            var lettersAndNumbers = /^[a-zA-Z0-9]+$/;

            // check whether first character is a letter or not
            if (!first_character.match(letters))
                args.IsValid = false;

            // check the first name is all letters (No number)
            if (args.Value.search(numbers) != -1)
                args.IsValid = false;
        }

        // LastName custom validation check 
        function lastnameValidate(oSrc, args) {
            var first_character = args.Value.charAt(0);
            var letters = /[A-z]/;
            var numbers = /[0-9]/
            var lettersAndNumbers = /^[a-zA-Z0-9]+$/;

            // check whether first character is a letter or not
            if (!first_character.match(letters))
                args.IsValid = false;

            // check the first name is all letters (No number)
            if (args.Value.search(numbers) != -1)
                args.IsValid = false;
        }

        // Email custom validation check 
        function emailValidate(oSrc, args) {
            var first_character = args.Value.charAt(0);
            var letters = /[A-z]/;
            var numbers = /[0-9]/;
            var atSign = "@";
            var lettersAndNumbers = /^[a-zA-Z0-9]+$/;

            // check whether first character is a letter or not
            if (!first_character.match(letters))
                args.IsValid = false;

            // check the email has an at sign
            if (args.Value.search(atSign) == -1)
                args.IsValid = false;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="row">
        <!-- left column -->
        <div class="col-md-12 mx-auto login_column">
            <asp:Label ID="lbllbl" runat="server"></asp:Label>
            <!-- Username -->
            <div class="form-group row mt-3 my-4">
                <asp:Label ID="LblUsername" runat="server" Text="Username" CssClass="col-sm-12 col-form-label"></asp:Label>
                <asp:Label ID="LblFirstName" runat="server" Text="First Name" CssClass="col-sm-8 col-form-label"></asp:Label> <asp:LinkButton CssClass="col-sm-4" ID="linkFirstName" runat="server" OnClick="Unnamed_Click" CausesValidation="False">(Edit)</asp:LinkButton>
                <asp:Label ID="LblLastName" runat="server" Text="Last Name" CssClass="col-sm-8 col-form-label"></asp:Label> <asp:LinkButton CssClass="col-sm-4" ID="linkLastName" runat="server" OnClick="Unnamed_Click" CausesValidation="False">(Edit)</asp:LinkButton>
                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="col-sm-8 col-form-label"></asp:Label> <asp:LinkButton CssClass="col-sm-4" ID="linkEmail" runat="server" OnClick="Unnamed_Click" CausesValidation="False">(Edit)</asp:LinkButton>
                <asp:Label ID="LblAddress" runat="server" Text="Address" CssClass="col-sm-8 col-form-label"></asp:Label> <asp:LinkButton CssClass="col-sm-4" ID="linkAddress" runat="server" OnClick="Unnamed_Click" CausesValidation="False">(Edit)</asp:LinkButton>
                <asp:Label ID="LblPhoneNumber" runat="server" Text="PhoneNumber" CssClass="col-sm-8 col-form-label"></asp:Label> <asp:LinkButton CssClass="col-sm-4" ID="linkPhoneNumber" runat="server" OnClick="Unnamed_Click" CausesValidation="False">(Edit)</asp:LinkButton>
                <asp:Label ID="lblPassword" runat="server" Text="Change your password" CssClass="col-sm-8 col-form-label"></asp:Label> <asp:LinkButton CssClass="col-sm-4" ID="linkPassword" runat="server" OnClick="Unnamed_Click" CausesValidation="False">(Edit)</asp:LinkButton>
            </div>

            <%-- /Username --%>
        </div>
        <!-- /Left Column -->
    </div>
    <div class="row">
        <div class="col-md-12 mx-auto login_column">
            <%--Fields--%>

            <!-- Current Password -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtCrntPassword" runat="server" placeholder="Current Password" TextMode="Password" CssClass="form-control" MaxLength="16"></asp:TextBox>
                </div>
            </div>

            <!-- New Password -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtNewPassword" runat="server" placeholder="New Password" TextMode="Password" CssClass="form-control" MaxLength="16"></asp:TextBox>
                </div>
            </div>

            <!-- Password Confirm -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtPassConfirm" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="form-control" MaxLength="16"></asp:TextBox>
                </div>
            </div>

            <!-- FirstName -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtFirstName" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <!-- LastName -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtLastName" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <!-- Email -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <!-- Address -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtAddress" runat="server" placeholder="Address" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- PhoneNumber -->
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtPhoneNumber" runat="server" placeholder="Phone Number" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <%--Validators--%>
            
            <div class="form-group row mt-0 ml-1">
                <!-- Current Password Validation -->
                <div class="form-group row mb-3">
                    <div class="col-sm-12">
                         <asp:RequiredFieldValidator ID="CrntPasswordRequiredValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtCrntPassword" ErrorMessage="Current Password is required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CrntPasswordCustomValidator" runat="server" ClientValidationFunction="passwordValidate" ControlToValidate="txtCrntPassword" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid password"></asp:CustomValidator>
                    </div>
                </div>
                <!-- New Password Validation -->
                <div class="form-group row mb-3">
                    <div class="col-sm-12">
                        <asp:RequiredFieldValidator ID="NewPasswordRequiredValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New password is required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="NewPasswordCustomValidator" runat="server" ClientValidationFunction="passwordValidate" OnServerValidate="newPasswordValidate" ControlToValidate="txtNewPassword" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid password"></asp:CustomValidator>
                    </div>
                </div>
                <br />
                <!-- Confirm Password Validation -->
                <div class="form-group row mb-3">
                    <div class="col-sm-12">
                        <asp:RequiredFieldValidator ID="PassConfirmRequiredValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtPassConfirm" ErrorMessage="Confirm password is required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="PassConfirmCustomValidator" runat="server" OnServerValidat="PassConfirmValidator" ControlToValidate="txtPassConfirm" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid password"></asp:CustomValidator>
                    </div>
                </div>

                <!-- FirstName Validation -->
                <div class="form-group row">
                    <div class="col-sm-12">
                        <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="FirstNameCustomValidator" runat="server" ClientValidationFunction="firstnameValidate" ControlToValidate="txtFirstName" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid first name"></asp:CustomValidator>
                    </div>
                </div>

                <!-- LastName Validation -->
                <div class="form-group row">
                    <div class="col-sm-12">
                        <asp:RequiredFieldValidator ID="LastNameRequiredValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="LastNameCustomValidator" runat="server" ClientValidationFunction="lastnameValidate" ControlToValidate="txtLastName" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid last name"></asp:CustomValidator>
                    </div>
                </div>

                <!-- Email Validation -->
                <div class="form-group row">
                    <div class="col-sm-12">
                        <asp:RequiredFieldValidator ID="EmailRequiredValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="EmailCustomValidator" runat="server" ClientValidationFunction="emailValidate" ControlToValidate="txtEmail" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid email"></asp:CustomValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 my-4 signinBtn">
            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" CausesValidation="false" CssClass="btn btn-danger" />
            <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" CausesValidation="true" CssClass="btn btn-success" />
        </div>
    </div>
</asp:Content>
