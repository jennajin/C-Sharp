<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteNote.aspx.cs" Inherits="DeleteNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Category,NoteID" DataSourceID="SqlDataSource1" Height="50px" Width="492px" CssClass="table table-bordered" HorizontalAlign="Center" OnItemDeleted="DetailsView1_ItemDeleted">
            <FieldHeaderStyle BackColor="#336600" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:BoundField DataField="NoteTitle" HeaderText="NoteTitle" SortExpression="NoteTitle" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="NumberOfPages" HeaderText="NumberOfPages" SortExpression="NumberOfPages" />
                <asp:BoundField DataField="NoteUrl" HeaderText="NoteUrl" SortExpression="NoteUrl" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" 
            DeleteCommand="DELETE FROM Note WHERE (NoteID = @NoteID)" 
            SelectCommand="SELECT Category.*, Note.NoteID, Note.NoteTitle, Note.CategoryID, Note.CourseCode, Note.Author, Note.NumberOfPages, Note.NoteUrl FROM Category INNER JOIN Note ON Category.Category = Note.CategoryID WHERE (Note.NoteID = @NoteID)">
            <DeleteParameters>
                <asp:Parameter Name="NoteID" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="NoteID" QueryStringField="NoteID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>

    <p class="browse_align">
        <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <div class="row">
        <div class="col-md-2 mt-2 browse_algin">
            <asp:Button ID="BtnBack" runat="server" CssClass="btn btn-success ml-2 px-4" Text="Back to Browse" OnClick="BtnBack_Click" />
        </div> <!-- /col: button --> 
    </div> <!-- /row: button --> 
    <br />
</asp:Content>
