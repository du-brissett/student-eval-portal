<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WeightedRate.aspx.cs" Inherits="Staff_Default" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 
   <!-- Navbar
    ================================================== -->
    <div class="navbar navbar-inverse navbar">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">STAFF</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="">
                 <a href="StaffHome.aspx">HOME</a>
              </li>
              <li class="">
                <a href="StaffCRRDetail.aspx">View CRR report</a>
              </li>
                <li class="">
                <a href="StaffOCRDetail.aspx">Annual OCR report</a>
              </li>
              <li class="">
                <a href="StaffOCRView.aspx">View OCR Details</a>
              </li>
              <li class="">
                <a href="viewGraphReport.aspx">View Annual Graph Report</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div> 

    <asp:DropDownList ID="ddlAcademic" runat="server" AutoPostBack="True" DataSourceID="YearData" DataTextField="AcademicYear" DataValueField="AcademicYear" AppendDataBoundItems ="true">
        <asp:ListItem Text ="-- Select an Academic Year --" Value ="0"></asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="YearData" runat="server" SelectMethod="GetUserAcademicYear" TypeName="BusinessLogic">
        <SelectParameters>
            <asp:SessionParameter SessionField="user" Name="User" Type="String"></asp:SessionParameter>
        </SelectParameters>        
    </asp:ObjectDataSource>

    <asp:DropDownList ID="ddlFacultyRole" runat="server" DataSourceID ="FacultyRoleDataSource" DataValueField ="Name" AppendDataBoundItems ="true" AutoPostBack="true" >
        <asp:ListItem text="--Select Faculty Role--"> </asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="FacultyRoleDataSource" runat="server" SelectMethod="GetFacultyRoleNames" TypeName="BusinessLogic"></asp:ObjectDataSource>  
   
    <CR:CrystalReportViewer ID="CrysRepCR" runat="server" AutoDataBind="True" Height="50px" ReportSourceID="CrystalReportSource1" ToolPanelWidth="200px" Width="350px" EnableParameterPrompt="False" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="..\Reports\WeightedRating.rpt">
        </Report>
    </CR:CrystalReportSource>
  
</asp:Content>

