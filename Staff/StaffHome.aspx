<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffHome.aspx.cs" Inherits="Staff_StaffHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1> STAFF</h1>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Staff Options</li>
              <li class="active"><a href="StaffCRRDetail.aspx">View CRR Details</a></li>
             
                    <li><a href="StaffOCRView.aspx">View OCR Details</a></li>
                    <li><a href="viewGraphReport.aspx">View Annual Graph Report</a></li>
                    <li><a href="WeightedRate.aspx">View Weighted Rating Report</a></li>
                    <li><a href="StaffOCRDetail.aspx">OCR Annual Report</a></li>  
                    <li>
                        <asp:LoginStatus ID="LoginStatus" runat="server" LogoutAction ="RedirectToLoginPage"/>
                    </li>  
                                 
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
    </div>
  </div>
</asp:Content>

