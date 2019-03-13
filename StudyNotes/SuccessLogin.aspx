<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SuccessLogin.aspx.cs" Inherits="SuccessLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Success message -->
    
    <div class="container py-5 text-center">
        <h3>Welcome  <asp:Label ID="UserFromSession" runat="server" Text="User"></asp:Label>,</h3>
        <h4 class="mx-auto"> You have successfully logged in! </h4>
        <!-- Button: Go To Main -->
        <asp:Button ID="BtnGoToMain" runat="server" Text="Go To Main" OnClick="BtnGoToMain_Click" CssClass="btn btn-success" />
    </div> 
</asp:Content>

