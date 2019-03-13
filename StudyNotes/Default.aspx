<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bannerAndHeaderPlaceHolder" runat="Server">
    <div class="row header" style="background-image: url('Images/bg.jpg'); background-position: top">
        <h1><span>Welcome to<br />
        </span>StydyNotes</h1>
        <h3 class="text-light px-5 mx-5 text-justify">
        StudyNotes is a free, user friendly educational service for both Junior and Leaving Certificate students and teachers. Currently on our website, you will find: many notes in different topics.
            StudyNotes aims to change the way students learn, acting as a platform for teachers to share their notes, resources and at the same time help students with their learning. 
            We are an online community where educational content can be shared freely.
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Main content placeholder -->
    <div class="row" id="default_row">
        <!-- Categories row -->
        <%-- <asp:datalist CssClass="ItemTemp"  RepeatColumns="4" ID="dlCat" runat="server" datakeyfield="Category" datasourceid="SqlDataSource1">
            <ItemTemplate>
                <%--Category Item
                <div class="col-md-12 catItemID">
                    <div class="thumbnail">
                        <img src="Images/<%# Eval("CategoryName") %>.jpeg" alt="<%# Eval("CategoryName") %>" />
                        <div class="caption">
                            <p><asp:LinkButton ID="BtnLink" runat="server" CssClass="btn btn-success labelBtn" Text='<%# Eval("CategoryName") %>' PostBackUrl="#" /></p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:datalist>
        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" selectcommand="SELECT * FROM [Category]"></asp:sqldatasource>--%>
        <asp:DataList ID="dlDetails" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="5" CssClass="mx-auto">
            <ItemTemplate>
                <table class="CategoryTable" cellspacing="0" cellpadding="5">
                    <tr>
                        <td class="CategoryImage">
                            <img src="Images/<%# Eval("CategoryName") %>.jpeg" style="width: 150px;" />
                        </td>
                    </tr>
                    <tr>
                        <td class="CategoryButton">
                            <asp:LinkButton ID="lblCompanyName" runat="server" CssClass="btn btn-success col-md-12" Text='<%#Eval("CategoryName") %>'></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" selectcommand="SELECT * FROM [Category]"></asp:sqldatasource>
    </div>
</asp:Content>

