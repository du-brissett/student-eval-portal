<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffOCRDetail.aspx.cs" Inherits="Staff_StaffOCRDetail" %>
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
                <li><a href="StaffOCRView.aspx">View OCR Details</a></li>
              </li>
              <li class="">
                <a href="viewGraphReport.aspx">View Annual Graph Report</a>
              </li>
              <li class="">
                <a href="WeightedRate.aspx">View Weighted Rating Report</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div> 
    
     <div>
        <CR:CrystalReportViewer ID="CrysRepOCR" runat="server" AutoDataBind="True"
            Height="50px" EnableParameterPrompt ="False" ReportSourceID="CrystalReportSource1"
            ToolPanelWidth="200px" Width="350px"  ToolPanelView="None" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="..\Reports\OCRDetails.rpt">
            </Report>
        </CR:CrystalReportSource>
        
            
    </div>
</asp:Content>

