<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffOCRReport.aspx.cs" Inherits="Management_StaffOCRReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
		<!-- PAGE HEADER -->
		<section>
			<ul class="breadcrumb">
				<li><a href="ManagementHome.aspx">HOME</a> <span class="divider">/</span></li>	
                <li><a href="StaffOCRReport.aspx">STAFF OCR</a><span class="divider">/</span></li>
                <li><a href="CompositeRoleRating.aspx">COMPOSITE ROLE RATING</a> <span class="divider">/</span></li>
                  <li><a href="MeritBonus.aspx">MERIT BONUS REPORT</a> <span class="divider">/</span></li>
			</ul>
		</section>
		
    <asp:DropDownList ID="ddlStaffOCR" runat="server" AutoPostBack="True" DataTextField="AcademicYear" DataValueField="AcademicYear" AppendDataBoundItems ="True" DataSourceID="ObjectDataSourceDDLyear">
        <asp:ListItem Text ="-- Select Academic Year --" Value ="0"></asp:ListItem>
    </asp:DropDownList>

<asp:ObjectDataSource ID="ObjectDataSourceDDLyear" runat="server" SelectMethod="spGetAllAcademicYear" TypeName="BusinessLogic">
</asp:ObjectDataSource>

    <br />
    <CR:CrystalReportViewer ID="CRPStaff" runat="server" AutoDataBind="True" Height="50px" ReportSourceID="CrystalReportSource1" ToolPanelWidth="200px" Width="350px" />
       <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
         <Report FileName="..\Reports\STaffOCRReport.rpt">
         </Report>
     </CR:CrystalReportSource>
</asp:Content>

