<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoleComponentItems.aspx.cs" Inherits="SystemAdmin_RoleComponentItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">    
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

     <h3>Faculty Roles</h3>
    <asp:DropDownList ID="ddlFacultyRole" runat="server" DataSourceID="facultyRoleObjectSource" DataValueField="Name" AppendDataBoundItems="true" AutoPostBack="true"
        OnSelectedIndexChanged="ddlRoleComponent_SelectedIndexChanged">
        <asp:ListItem Text="-- Select Role --"></asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="facultyRoleObjectSource" runat="server" SelectMethod="GetFacultyRoleNames" TypeName="BusinessLogic"></asp:ObjectDataSource>
    <br />
    <br />
    <asp:Table ID="tblQuestionItems" runat="server" Width="1000px">
        <asp:TableRow>
            <asp:TableCell>
                <h3>
                    <asp:Label ID="lblRoleName" runat="server"></asp:Label> Role Components
                </h3>
                <asp:ListBox ID="lbRoleComponent" runat="server" DataSourceID="roleComponentObjectSource" DataValueField="Name"></asp:ListBox>
                <asp:ObjectDataSource ID="roleComponentObjectSource" runat="server" SelectMethod="GetRoleComponents" TypeName="BusinessLogic">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlFacultyRole" Name="Role" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:TableCell>
            <asp:TableCell Width="100px" RowSpan="2" VerticalAlign="Middle">
                <asp:Button ID="btnUnAssign" runat="server" Text="<<" OnClick="btnUnAssign_Click" ToolTip ="Click to unassign an item" />
                <asp:Label ID="lblSpace" runat="server" Text="                       " />
                <asp:Button ID="btnAssign" runat="server" Text=">>" OnClick="btnAssign_Click" ToolTip ="Click to assign an item" />
            </asp:TableCell><asp:TableCell RowSpan="2" VerticalAlign="Bottom">
                <asp:ListBox ID="lbQuestionSelections" runat="server" Width="450px"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="lbQuestionnaire" runat="server" Width="250px"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3">

            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign ="Center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Selections" OnClick="btnSubmit_Click" />
            </asp:TableCell>
            <asp:TableCell HorizontalAlign ="Center">
                <asp:Button ID="btnSave" runat="server" Text="Save Progress" OnClick="btnSave_Click" ToolTip ="Click button to save your progress and resume if you so wish at a later time." />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID ="btnLoad" runat ="server" Text ="Load Progress" OnClick ="btnLoad_Click" ToolTip ="Click button to load previously saved assignments." />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
