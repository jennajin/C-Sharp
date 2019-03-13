<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditNote.aspx.cs" Inherits="EditNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="NoteID,Category" DataSourceID="SqlDataSource1" Height="50px" Width="600px" CssClass="table table-bordered" HorizontalAlign="Center" OnItemUpdated="DetailsView1_ItemUpdated">
            <FieldHeaderStyle BackColor="#336600" ForeColor="White" Width="200px" />
            <Fields>
                <asp:TemplateField HeaderText="Category" SortExpression="CategoryName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DdlCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="Category" SelectedValue='<%# Bind("CategoryID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="Category" SelectedValue='<%# Bind("CategoryID") %>' CssClass="form-control" Enabled="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="NoteTitle">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtNoteTitle" runat="server" Text='<%# Bind("NoteTitle") %>' CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtNoteTitle" Display="Dynamic" ErrorMessage="Title is reqruied" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NoteTitle") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NoteTitle") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Code" SortExpression="CourseCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtCourseCode" runat="server" Text='<%# Bind("CourseCode") %>' CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtCourseCode" Display="Dynamic" ErrorMessage="Course Code is reqruied" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CourseCode") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("CourseCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author" SortExpression="Author">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtAuthor" runat="server" Text='<%# Bind("Author") %>' CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtAuthor" Display="Dynamic" ErrorMessage="Author is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number Of Pages" SortExpression="NumberOfPages">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtNumberOfPages" runat="server" Text='<%# Bind("NumberOfPages") %>' CssClass="form-control"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtNumberOfPages" Display="Dynamic" ErrorMessage="Please enter a valid numer" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NumberOfPages") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("NumberOfPages") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NoteUrl" SortExpression="Note Url">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtNoteUrl" runat="server" Text='<%# Bind("NoteUrl") %>' CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtNoteUrl" Display="Dynamic" ErrorMessage="URL is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtNoteUrl" Display="Dynamic" ErrorMessage="Please enter a valid URL" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("NoteUrl") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("NoteUrl") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="NoteUrl" Target="_blank" Text="View Note" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" >
                <ControlStyle CssClass="btn btn-primary" />
                </asp:CommandField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineLectureNotesDBConnectionString %>" 
            SelectCommand="SELECT Note.NoteID, Note.NoteTitle, Note.CategoryID, Note.CourseCode, Note.Author, Note.NumberOfPages, Note.NoteUrl, Category.* FROM Note INNER JOIN Category ON Note.CategoryID = Category.Category WHERE (Note.NoteID = @NoteID)" 
            UpdateCommand="UPDATE Note SET NoteTitle = @NoteTitle, CategoryID = @CategoryID, CourseCode = @CourseCode, Author = @Author, NumberOfPages = @NumberOfPages, NoteUrl = @NoteUrl FROM Note INNER JOIN Category ON Note.CategoryID = Category.Category WHERE (Note.NoteID = @NoteID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="NoteID" QueryStringField="NoteID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NoteTitle" type="String" />
                <asp:Parameter Name="Category" type="Int32" />
                <asp:Parameter Name="CourseCode" type="String" />
                <asp:Parameter Name="Author" type="String" />
                <asp:Parameter Name="NumberOfPages" />
                <asp:Parameter Name="NoteUrl" type="String" />
                <asp:Parameter Name="NoteID" type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p class="browse_align">
        <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
    </p>

    <div class="row">
        <div class="col-md-2 mt-2 browse_align">
            <asp:Button ID="BtnBack" runat="server" CssClass="btn btn-success ml-2 px-4" Text="Back to Browse" OnClick="BtnBack_Click" />
        </div> <!-- /col: button --> 
    </div> <!-- /row: button --> 
    <br />
    
</asp:Content>