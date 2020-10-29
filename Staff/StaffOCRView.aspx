<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffOCRView.aspx.cs" Inherits="Staff_StaffOCRView" %>

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
                <a href="StaffCRRDetail.aspx">View CRR Details</a>
              </li>
                <li class="">
                <a href="StaffOCRDetail.aspx">Annual OCR report</a>
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
    
    <h3><strong>Select Academic Year</strong></h3>
    <br />
   
     <asp:DropDownList ID="ddlYear" runat="server"  DataSourceID="ObjectDataSourceddl" AppendDataBoundItems="True"  DataTextField="AcademicYear" Height="30px" Width="194px">
        <asp:ListItem> Select Academic Year </asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlYear"
                ErrorMessage="Select Year!!!!" InitialValue="Select Academic Year" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="btnOCR" runat="server" Text="View OCR Breakdown" OnClick="btnOCR_Click" Height="34px" Width="247px" />    
    <br />
    <br />
                       <asp:Label  ID="lblTableDesc" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:DataList ID="DatalistOCR" runat="server"  CellPadding="0" DataSourceID="ObjectDataSourceDatalist" Width="759px"   >
        <HeaderTemplate>            
           <asp:TableRow ID="TableRow1" runat ="server"  >
                <asp:TableCell ColumnSpan ="1" RowSpan ="1" HorizontalAlign ="Center" BorderStyle="Solid" BorderColor="Black"  BorderWidth="2"  BackColor="#006699" ForeColor="White"  >
                                          <h4>  Faculty Roles</h4>  
                 </asp:TableCell>                  
                 <asp:TableCell ColumnSpan ="1" RowSpan ="1" HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" BackColor="#006699" ForeColor="White"  >
                                          <h4> Assigned Weight</h4>    
                 </asp:TableCell>                      
                 <asp:TableCell  ColumnSpan ="1" RowSpan ="1" HorizontalAlign ="Center" BorderStyle="Solid" BorderColor="Black"  BorderWidth="2" BackColor="#006699" ForeColor="White"  >
                                           <h4>Composite Role Rating (CRR) </h4>  
                 </asp:TableCell>
                 <asp:TableCell ColumnSpan ="1" RowSpan ="1"  HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" BackColor="#006699"  ForeColor="White" >
                                          <h4>Weighted Composite Rating </h4>  
                 </asp:TableCell>
            </asp:TableRow>
     </HeaderTemplate>
     <ItemTemplate>            
        <asp:TableRow ID="TableRow2" runat ="server" >
              <asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" RowSpan="2">
                   <asp:Label ID ="lblFacultyComponent" runat ="server"   Text = '<%# Eval("FactName") %>'/>                   
               </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BackColor="WhiteSmoke" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2"  RowSpan="2" >
                   <asp:Label ID ="lblAssignWgt" runat ="server"   Text = '<%# Eval("AssignedWgt") %>'/>  
               </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BackColor="WhiteSmoke" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" ColumnSpan ="1"  RowSpan="2">                             
                   <asp:Label ID ="lblCompositeRating" runat ="server"   Text = '<%# Eval("CrrFnd") %>'/>  
               </asp:TableCell><asp:TableCell  HorizontalAlign ="Center" BorderStyle="Solid" BackColor="WhiteSmoke" BorderColor="Black"  BorderWidth="2"  RowSpan="2">
                   <asp:Label ID ="WeightedCompositeRating" runat ="server"   Text = '<%# Eval("W") %>'/>                            
               </asp:TableCell></asp:TableRow></ItemTemplate><SeparatorStyle BorderColor="Black" BorderStyle="Solid" />
    </asp:DataList> 
<asp:LinkButton ID="LnkBtn" runat="server" OnClick="LinkButton1_Click">Print </asp:LinkButton><br />
    <%--Report --%>
    <CR:CrystalReportViewer ID="CrystalReportViewerOCRViewStaff" runat="server" AutoDataBind="true" />
    <asp:Label ID="user" runat="server" Text="Label"></asp:Label><asp:ObjectDataSource ID="ObjectDataSourceddl" runat="server" SelectMethod="GetAcademicYear" TypeName="BusinessLogic" >        
         <selectparameters>
                <asp:ControlParameter ControlID="user" Name="RealID" PropertyName="Text" Type="String"  />
        </selectparameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceDatalist" runat="server" InsertMethod="InsertFacultyRole" SelectMethod="OverallCompositeRatingView" TypeName="BusinessLogic">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MinValue" Type="Decimal" />
            <asp:Parameter Name="MaxValue" Type="Decimal" />

        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="user" Name="RealID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlYear" Name="AcademicYear" PropertyName="SelectedValue" Type="String" />                       
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>