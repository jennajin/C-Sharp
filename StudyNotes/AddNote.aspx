<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNote.aspx.cs" Inherits="AddNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="row">
      <div class="col-md-10 mx-auto mt-5">
        <!-- Category -->
        <div class="form-group row">
            <div class="col-sm-4">   
                <asp:Label ID="LblCategory" runat="server" Text="Category" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="col-sm-8">   
                 <asp:DropDownList ID="DdlCategory" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="Category">
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
            </div>
       </div>

        <!-- Empty row -->
        <div class="form-group row">
           <div class="col-sm-8">   
           </div>
        </div>
       
       <!-- Title -->
       <div class="form-group row">
           <div class="col-sm-4">   
                <asp:Label ID="LblTitle" runat="server" Text="Title" CssClass="col-sm-2 col-form-label"></asp:Label>
           </div>
           <div class="col-sm-8"> 
               <asp:TextBox ID="TxtTitle"  CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <!-- Title Validation -->
       <div class="form-group row">
           <div class="col-sm-4"></div>
           <div class="col-sm-8">   
               <!-- need to fill validation -->
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtTitle" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Title is required"></asp:RequiredFieldValidator>
           </div>
        </div>

        <!-- Course Code -->
       <div class="form-group row">
           <div class="col-sm-4">   
                <asp:Label ID="LblCourse" runat="server" Text="Course Code" CssClass="col-sm-2 col-form-label"></asp:Label>
           </div>
           <div class="col-sm-8"> 
               <asp:TextBox ID="TxtCourse"  CssClass="form-control" runat="server"></asp:TextBox>
           </div>
       </div>

       <!-- Course Code Validation -->
       <div class="form-group row">
           <div class="col-sm-4"></div>
           <div class="col-sm-8">   
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Course Code is reqiured" ControlToValidate="TxtCourse" CssClass="alert alert-warning" Display="Dynamic"></asp:RequiredFieldValidator>
           </div>
        </div>

        <!-- Author Name -->
        <div class="form-group row">
            <div class="col-sm-4">   
                <asp:Label ID="LblAuthor" runat="server" Text="Author" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="col-sm-8">
                 <asp:TextBox ID="TxtAuthor"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

        <!-- Author validation -->
        <div class="form-group row">
           <div class="col-sm-4"></div>
           <div class="col-sm-8">   
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtAuthor" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Author is required"></asp:RequiredFieldValidator>
           </div>
        </div>

         <!-- Number of Pages -->
        <div class="form-group row">
            <div class="col-sm-4">   
                 <asp:Label ID="LblPages" runat="server" Text="Number of Pages" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="col-sm-8">
                 <asp:TextBox ID="TxtPages"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

        <!-- Number of Pages validation -->
        <div class="form-group row">
           <div class="col-sm-4"></div>
           <div class="col-sm-8">   
               <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid number of pages" Operator="GreaterThan" Type="Integer" ValueToCompare="0" ControlToValidate="TxtPages"></asp:CompareValidator>
           </div>
        </div>

        <!-- Note Url -->
        <div class="form-group row">
            <div class="col-sm-4">   
                <asp:Label ID="LblNoteUrl" runat="server" Text="Note URL" CssClass="col-sm-2 col-form-label"></asp:Label>
            </div>
            <div class="col-sm-8">
                 <asp:TextBox ID="TxtNoteUrl"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

        <!-- Note Url validation -->
        <div class="form-group row">
           <div class="col-sm-4"></div>
           <div class="col-sm-8">   
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtNoteUrl" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="URL is required"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtNoteUrl" CssClass="alert alert-warning" Display="Dynamic" ErrorMessage="Please enter a valid URL" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
           </div>
        </div>

        <!-- Buttont: Add Notes -->
        <div class="form-group row">
            <div class="col-sm-4">   
                <asp:Button ID="BtnAddNote" CssClass="btn btn-success ml-2 px-4" runat="server" Text="Add Note" OnClick="BtnAddNote_Click"/>  
            </div>
        </div> <!-- /form-group row -->   
     </div> <!-- /col-md-10 -->
  </div> <!-- /row -->  
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Note]"
        InsertCommand="INSERT INTO Note (CategoryID, NoteTitle, CourseCode, Author, NumberOfPages, NoteUrl)
                       VALUES (@CategoryID,@NoteTitle,@CourseCode,@Author,@NumberOfPages,@NoteUrl)">
        <insertparameters>
            <asp:Parameter name="CategoryID"  type="Int32"/>
            <asp:Parameter name="NoteTitle"  type="String"/>
            <asp:Parameter name="CourseCode" type="String"/>
            <asp:Parameter name="Author" type="String"/>
            <asp:Parameter name="NumberOfPages" type="Int32"/>
            <asp:Parameter name="NoteUrl" type="String"/>
        </insertparameters>
     </asp:SqlDataSource>
</asp:Content>