<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="Browse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NoteID,Category" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-condensed">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:BoundField DataField="NoteTitle" HeaderText="NoteTitle" SortExpression="NoteTitle" />
                <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:HyperLinkField DataNavigateUrlFields="NoteID" DataNavigateUrlFormatString="EditNote.aspx?NoteID={0}" Text="View" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="NoteID" DataNavigateUrlFormatString="DeleteNote.aspx?NoteID={0}" Text="Delete">
                <ControlStyle CssClass="btn btn-danger" />
                </asp:HyperLinkField>
            </Columns>
            <HeaderStyle BackColor="#4C7A36" ForeColor="White" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" 
            SelectCommand="SELECT Note.*, Category.* FROM Note INNER JOIN Category ON Note.CategoryID = Category.Category"></asp:SqlDataSource>
    </p>

    <div class="row">
        <div class="col-md-2 mt-2 browse_algin">
            <asp:Button ID="BtnAddNote" runat="server" CssClass="btn btn-success ml-2 px-4" Text="Add Note" OnClick="BtnAddNote_Click" />
        </div> <!-- /col: button --> 
    </div> <!-- /row: button --> 
    <br />
 
</asp:Content>
