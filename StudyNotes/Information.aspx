<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Information.aspx.cs" Inherits="Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Information about our product -->
    <div class="row">
      <div class="col-md-10 mx-auto mt-5">
        <div class="form-group text-justify">
            StudyNotes wants to help you get where you need to be by providing easy and quick access to a vast array of study materials of any educational subject.<br />
            <br />
            The idea was borne out of confusion by a group of 
            <asp:HyperLink ID="linkAbout" runat="server" NavigateUrl="~/About.aspx">software development students</asp:HyperLink>
            who had found limited amounts of clear and concise materials to study.<br />
            <br />
            We at StudyNotes know these struggles students face, so we created a helpful tool for students to find everything they need to help ace exams and get job ready.<br />
            <br />
            For more information on fields of study and post-secondary institutions, visit 
            <asp:HyperLink ID="linkUni" runat="server" NavigateUrl="https://www.topuniversities.com/" Target="_blank">Top Universities</asp:HyperLink>.<br />
            <br />
            Hope you all enjoy!<br />
            <br />
            ~StudyNotes Team<br />
            <br />
         </div> <!-- /form-group -->
       </div> <!-- /col-md-10 -->
    </div> <!-- /row -->
        
</asp:Content>