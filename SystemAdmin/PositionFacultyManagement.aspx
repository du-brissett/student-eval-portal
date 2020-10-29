﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PositionFacultyManagement.aspx.cs" Inherits="SystemAdmin_PositionFacultyManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
          <a class="brand" href="AdminHome.aspx">Home</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="">
                 <a href="../Account/Login.aspx">Log Out</a>
              </li>
              <li class="">
                <a href="../Account/Login.aspx">Log Out</a>
              </li>
              
            </ul>
          </div>
        </div>
      </div>
    </div>

    <h4> SELECT POSITION: </h4>    
    <asp:DropDownList ID ="ddlPosition" runat="server" DataSourceID="PositionDataSource" AppendDataBoundItems="true" DataTextField ="Name" OnSelectedIndexChanged ="ddlPosition_SelectedIndexChanged" AutoPostBack ="true">
        <asp:ListItem Text ="-- Choose Position--" Value ="0"></asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="PositionDataSource" runat="server" SelectMethod="GetPositions" TypeName="BusinessLogic">
    </asp:ObjectDataSource>    
    <asp:DataList ID="dlAssignedWeight" runat="server" Width ="100%" BorderStyle ="Ridge" BorderWidth="6px" BorderColor="#66CCFF" BackColor ="#cccccc" Font-Bold ="true" Font-Names ="Verdana" Font-Size ="Medium">
        <HeaderTemplate>            
            <asp:TableRow ID="TableRowTitle" runat ="server">
                <asp:TableCell>

                </asp:TableCell>                
                <asp:TableCell>
                    Faculty Roles
                </asp:TableCell>
                <asp:TableCell>
                    Weighted Rating
                </asp:TableCell>
            </asp:TableRow>                
        </HeaderTemplate>
        <ItemTemplate>            
            <asp:TableRow ID="TableRowItems" runat ="server">
                <asp:TableCell Width ="10px">

                </asp:TableCell>
                <asp:TableCell Width ="250px">
                    <asp:Label ID ="lblFacultyRole" runat ="server" Text = '<%# Eval("Name") %>'/>
                </asp:TableCell>
                <asp:TableCell Width ="150px">
                    <asp:TextBox ID ="txtbxAssignedWeight" runat ="server" Text = '<%# Bind("AssignedWeight") %>' Width ="25px"/>
                </asp:TableCell>
                <asp:TableCell Width ="680px">
                    <asp:Label ID ="lblError" runat ="server" ForeColor ="Red" Font-Bold ="true" Font-Size ="Smaller" Font-Names ="Verdana"/>
                </asp:TableCell>
            </asp:TableRow>
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID ="RoleDataSource" runat ="server" SelectMethod="PositionFacultyRole" TypeName="BusinessLogic">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlPosition" Name="Position" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />    
    <asp:Button ID ="btnSubmit" runat ="server" Text ="Submit" OnClick ="btnSubmit_Click"/>    
    <asp:Label ID ="lblTotal" runat ="server" ForeColor ="Red" Font-Bold ="true" Font-Size ="Medium" Font-Names ="Verdana"></asp:Label>
</asp:Content>