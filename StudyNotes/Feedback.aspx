<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <div class="row">
      <div class="col-md-10 mx-auto mt-5">
        <!-- Title -->
        <div class="form-group row">
            <asp:Label ID="LblTitle" runat="server" Text="Title" CssClass="col-sm-2 col-form-label"></asp:Label>
            <div class="col-sm-8">   
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True">Note Issue</asp:ListItem>
                    <asp:ListItem>Website Issue</asp:ListItem>
                    <asp:ListItem>Request Note</asp:ListItem>
                    <asp:ListItem>Broken Link</asp:ListItem>
                </asp:DropDownList>
            </div>
       </div>

        <!-- blank line -->
        <div class="form-group row">
           <div class="col-sm-8 mx-auto">   
           </div>
        </div>
       
       <!-- Name -->
       <div class="form-group row">
           <asp:Label ID="LblName" runat="server" Text="Name" CssClass="col-sm-2 col-form-label"></asp:Label>
           <div class="col-sm-8"> 
             <asp:TextBox ID="TxtName"  CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <!-- Name validation -->
       <div class="form-group row">
           <div class="col-sm-8 mx-auto">   
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
           </div>
        </div>

        <!-- Email -->
        <div class="form-group row">
            <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="col-sm-2 col-form-label"></asp:Label>
            <div class="col-sm-8">
                 <asp:TextBox ID="TxtEmail"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

        <!-- Email validation -->
        <div class="form-group row">
           <div class="col-sm-8 mx-auto">   
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter the valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
           </div>
        </div>

        <!-- Comments -->
        <div class="form-group row">
            <asp:Label ID="LblComments" runat="server" Text="Comments" CssClass="col-sm-2 col-form-label"></asp:Label>
            <div class="col-sm-8">  
                <textarea id="TareaComments" rows="10" class="form-control" runat="server"></textarea>
            </div>
        </div>

        <!-- Checkbox: check complaint -->
        <div class="form-group row">
            <span class="col-sm-2 col-form-label"></span> 
            <div class="col-sm-8">
                <asp:CheckBox ID="ChkComplaint" runat="server" />
                <asp:Label ID="LblComplaint" Text="Complaint" runat="server"></asp:Label>
            </div>
        </div>

        <!-- Buttont: Submit -->
        <div class="form-group row form_btn">
            <span class="col-sm-2 col-form-label"></span> 
             <asp:Button ID="BtnSubmit" CssClass="btn btn-success ml-2 px-4" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />  
        </div> <!-- /form-group row -->   
     </div> <!-- /col-md-10 -->
  </div> <!-- /row -->  
    <asp:SqlDataSource 
        ID="SqlDataSource1" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Feedback]"
        InsertCommand="INSERT INTO Feedback VALUES (@FeedbackTitle,@Name,@Email,@Message,@Complaint)">
       <insertparameters>
            <asp:Parameter name="FeedbackTitle" Type="String" />
            <asp:Parameter name="Name"  type="String"/>
            <asp:Parameter name="Email" type="String"/>
            <asp:Parameter name="Message" type="String"/>
            <asp:Parameter name="Complaint"/>
       </insertparameters>
     </asp:SqlDataSource>
  </asp:Content>
