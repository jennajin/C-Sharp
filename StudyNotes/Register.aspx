<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

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
        <div class="col-md-5 mx-auto mt-5 login_column">
            <!-- Username -->
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
                    <asp:RequiredFieldValidator ID="usernameRequiredFieldValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="usernameValidator" runat="server" ClientValidationFunction="usernameValidate" OnServerValidate="UsernameAvailabilityValidator" ControlToValidate="txtUsername" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid username"></asp:CustomValidator>
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
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="PasswordCustomValidator" runat="server" ClientValidationFunction="passwordValidate" ControlToValidate="txtPassword" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid password"></asp:CustomValidator>
                </div>
                <!-- /col: password -->
            </div>
            <!-- /row: password -->

            <!-- password confirm-->
            <div class="form-group row">
                <asp:Label ID="LblPassConfirm" runat="server" Text="Confirm Password" CssClass="col-sm-2 col-form-label text-nowrap"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtPassConfirm" runat="server" TextMode="Password" CssClass="form-control" MaxLength="16"></asp:TextBox>
                </div>
            </div>
            <!-- password confirm validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="PassConfirmRequiredFieldValidator" CssClass="alert alert-warning" runat="server" ControlToValidate="txtPassConfirm" ErrorMessage="Password confirmaion is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="PassConfirmCustomValidator" runat="server" OnServerValidat="PassConfirmValidator" ControlToValidate="txtPassConfirm" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid password"></asp:CustomValidator>
                </div>
                <!-- /col: password confirm -->
            </div>
            <!-- /row: password confirm -->

            <!-- FirstName -->
            <div class="form-group row">
                <asp:Label ID="LblFirstName" runat="server" Text="First Name" CssClass="col-sm-2 col-form-label text-nowrap"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- FirstName validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="alert alert-warning" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="firstnameValidate" ControlToValidate="txtFirstName" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid first name"></asp:CustomValidator>
                </div>
                <!-- /col -->
            </div>
            <!-- /row: FirstName -->

            <!-- lastname -->
            <div class="form-group row">
                <asp:Label ID="LblLastName" runat="server" Text="Last Name" CssClass="col-sm-2 col-form-label text-nowrap"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- lastname validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="alert alert-warning" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="lastnameValidate" ControlToValidate="txtLastName" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid last name"></asp:CustomValidator>
                </div>
                <!-- /col -->
            </div>
            <!-- /row: lastname -->

            <!-- email -->
            <div class="form-group row">
                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- email validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="alert alert-warning" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="emailValidate" ControlToValidate="txtEmail" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid email"></asp:CustomValidator>
                </div>
                <!-- /col -->
            </div>
            <!-- /row: email -->

            <!-- address -->
            <div class="form-group row">
                <asp:Label ID="LblAddress" runat="server" Text="Address" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- address validation check -->
            <div class="form-group row">
                <div class="col">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="alert alert-warning" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="usernameValidate" ControlToValidate="txtUsername" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid username"></asp:CustomValidator>
                    --%>
                </div>
                <!-- /col -->
            </div>
            <!-- /row: address -->

            <!-- phonenumber -->
            <div class="form-group row">
                <asp:Label ID="LblPhoneNumber" runat="server" Text="Phone Number" CssClass="col-sm-2 col-form-label text-nowrap"></asp:Label>
            </div>
            <div class="form-group row">
                <div class="col-sm-10">
                    <asp:TextBox ID="TxtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- phonenumber validation check -->
            <div class="form-group row">
                <div class="col">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="alert alert-warning" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="usernameValidate" ControlToValidate="txtUsername" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid username"></asp:CustomValidator>
                </div>
                <!-- /col -->
            </div>
            <!-- /row: phonenumber -->
        </div>
        <!-- /Left Column -->
        <!-- right column -->
        <div class="vl mt-5"></div>
        <div class="col-md-6 mx-auto mt-5">
            <asp:Label ID="LblLoginInstruction" runat="server" Font-Bold="True" Font-Size="Larger" Text="Registration Instruction" CssClass="col-sm-2 col-form-label"></asp:Label>
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
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 mt-2 signinBtn mb-5">
            <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="BtnRegister_Click" CssClass="btn btn-success" />
        </div>
    </div>
</asp:Content>
