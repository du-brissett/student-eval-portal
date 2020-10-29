<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageFacultyRole.aspx.cs" Inherits="SystemAdmin_ManageFacultyRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
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

    <asp:GridView ID="GridViewFacultyRole" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataSourceID="FacultyRoleSource" Height="204px" Width="1087px" OnRowDeleted ="GridViewFacultyRole_RowDeleted"
        OnRowUpdated ="GridViewFacultyRole_RowUpdated" AutoGenerateColumns="False" DataKeyNames ="ID">
        <Columns>
            <asp:CommandField ButtonType ="Button" ShowDeleteButton="true" ShowEditButton ="true" />
            <asp:BoundField DataField ="Name" HeaderText ="Name" />
            <asp:BoundField DataField ="Description" HeaderText ="Description" />
            <asp:BoundField DataField ="MinValue" HeaderText ="MinValue" />
            <asp:BoundField DataField ="MaxValue" HeaderText ="MaxValue" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:ObjectDataSource ID="FacultyRoleSource" runat ="server" DeleteMethod="DeleteFacultyRole" InsertMethod="InsertFacultyRole" SelectMethod="GetFacultyRoleAll" TypeName="BusinessLogic" UpdateMethod="UpdateFacultyRole">
        <DeleteParameters>
            <asp:ControlParameter Name ="ID" ControlID ="GridViewFacultyRole" PropertyName ="SelectedValue" Type ="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MinValue" Type="Int32" />
            <asp:Parameter Name="MaxValue" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter Name ="ID" ControlID ="GridViewFacultyRole" PropertyName ="SelectedValue" Type ="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MinValue" Type="Int32" />
            <asp:Parameter Name="MaxValue" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    
    <h3>Add Faculty Role</h3>
    <br />
    <asp:Table ID ="tblInsertRole" runat ="server">
        <asp:TableRow>
            <asp:TableCell>
                Faculty Name:
            </asp:TableCell> 
            <asp:TableCell> 
                Description:
            </asp:TableCell> 
            <asp:TableCell> 
                Minimum Value:
            </asp:TableCell>
            <asp:TableCell> 
                Maximum value:
            </asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtName" runat="server" Width="100px"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDescription" runat="server" Width="335px"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMinVal" runat="server" Width="50px"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMaxVal" runat="server" Width="50px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
    <br />
    <br />
    <asp:Label ID ="lblCustomErrorMessage" runat ="server"></asp:Label>
</asp:Content>

