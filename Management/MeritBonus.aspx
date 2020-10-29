<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MeritBonus.aspx.cs" Inherits="Management_MeritBonus" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
		
     Select Academic Year from drop down list to view Merit Bonus for members within your department.<br />
    
      &nbsp;&nbsp;&nbsp;<br />
      &nbsp;<asp:DropDownList ID="ddlYear" AutoPostBack="true" DataTextField="AcademicYear" runat="server" DataSourceID="ObjectDataSourceDDLyear" AppendDataBoundItems="true" >
             <asp:ListItem> Select Academic Year </asp:ListItem>
      </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlYear"
                ErrorMessage="Select Year!!!!" InitialValue="Select Academic Year" ForeColor="Red"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;
    <br />     
    <br />
      <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:LinkButton ID="LinkBtnMerit" runat="server" OnClick="LinkBtnMerit_Click">Generate Crytal Report</asp:LinkButton>
      <br />  <br />
      <asp:GridView ID="GridViewMerit" runat="server" DataSourceID="ObjectDataSourceMerit" OnSelectedIndexChanged="GridViewMerit_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" BorderStyle="Solid" HorizontalAlign="Left" Height="122px" Width="647px">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <columns>
          <asp:boundfield datafield="Name" headertext="Staff Name">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:boundfield>
          <asp:boundfield datafield="OCRExcess" headertext="OCR Excess">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:boundfield>

            <asp:boundfield datafield="x" headertext="">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:boundfield>


          <asp:boundfield datafield="MUA" headertext="Merit Unit Amount" DataFormatString="{0:c}">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle BorderStyle="Solid" HorizontalAlign="Center" />
            </asp:boundfield>

            <asp:boundfield datafield="Equal" headertext="">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:boundfield>

          <asp:boundfield datafield="Merit_Bonus" headertext="Merit Bonus" DataFormatString="{0:c}">
            <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
            <HeaderStyle HorizontalAlign="Center" Width="50px" />
            </asp:boundfield>
        </columns>  
          <EditRowStyle BackColor="#999999" />
  
          <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Wrap="False" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#E9E7E2" />
          <SortedAscendingHeaderStyle BackColor="#506C8C" />
          <SortedDescendingCellStyle BackColor="#FFFDF8" />
          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
  
      </asp:GridView>
<br />     
    <CR:CrystalReportViewer ID="CrystalReportViewerMerit" runat="server" AutoDataBind="true" />
     <br />
      <br />
    <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:ObjectDataSource ID="ObjectDataSourceMerit" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="spMeritBonusTemp" TypeName="BusinessLogic">
          <SelectParameters>
              <asp:ControlParameter ControlID="ddlYear" Name="Academic_Year" PropertyName="SelectedValue" Type="String" />
              <asp:ControlParameter ControlID="lblUserName" Name="RealID" PropertyName="Text" Type="String" />
          </SelectParameters>
      </asp:ObjectDataSource>
    <br />
    &nbsp;&nbsp;&nbsp;
    <asp:ObjectDataSource ID="ObjectDataSourceDDLyear" runat="server" InsertMethod="InsertFacultyRole" SelectMethod="spGetAllAcademicYear" TypeName="BusinessLogic">
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>

