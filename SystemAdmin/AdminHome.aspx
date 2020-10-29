<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="SystemAdmin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<div class="navbar-wrapper">
      

        <div class="navbar navbar-top">
          <div class="navbar-inner">
            <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
              <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
      <div class="container">
            <a class="brand" href="#">Administration</a>
            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="AdminHome.aspx">Home</a></li>
                <li><a href="../Account/Login.aspx">LOG OUT</a></li>
                <li><a href="#contact">Contact</a></li>
                <!-- Read about Bootstrap dropdowns at http://twitter.github.com/bootstrap/javascript.html#dropdowns -->
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="AssignPositionWeight.aspx">Assign Position Weight</a></li>
                    <li><a href="ManageFacultyRole.aspx">Manage Faculty Role</a></li>
                    <li><a href="ManageImpactWeight.aspx">Manage Impact Weight</a></li>
                    <li><a href="ManageLevel.aspx">Manage Level</a></li>
                    <li><a href="ManagePositions.aspx">Manage positions</a></li>
                    <li><a href="PositionFacultyManagement.aspx">Position Faculty Management</a></li>
                    <li><a href="RoleComponentItems.aspx">Role Component Items</a></li>

                   <%-- <li class="divider"></li>
                    <li class="nav-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>--%>

                       

<%--                  </ul>
                </li>
              </ul>
            </div><!--/.nav-collapse -->
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->--%>
     <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Administrative Options</li>
              <li class="active"><a href="AssignPositionWeight.aspx">Assign Position Weight</a></li>
             
                    <li><a href="ManageFacultyRole.aspx">Manage Faculty Role</a></li>
                    <li><a href="ManageImpactWeight.aspx">Manage Impact Weight</a></li>
                    <li><a href="ManageLevel.aspx">Manage Level</a></li>
                    <li><a href="ManagePositions.aspx">Manage Positions</a></li>
                    <li><a href="PositionFacultyManagement.aspx">Position Faculty Management</a></li>
                    <li><a href="RoleComponentItems.aspx">Role Component Items</a></li>
                    <li><a href= "ManageRoleComponent.aspx">Manage Role Components</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
</asp:Content>

