<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FeedbackConfirmation.aspx.cs" Inherits="FeedbackConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Thank you message -->
    <div class="container py-5 text-center">
        <h4 class="mx-auto"> Thank You for your Feedback! </h4>
        <!-- Button: Go To Main -->
        <asp:Button ID="BtnGoToMain" runat="server" Text="Go To Main" OnClick="BtnGoToMain_Click" CssClass="btn btn-success" />
    </div> 
</asp:Content>

