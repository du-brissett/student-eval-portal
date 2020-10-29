<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageRoleComponent.aspx.cs" Inherits="SystemAdmin_ManageRoleComponent" %>

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
    <asp:DropDownList ID="ddlFacultyRole" runat="server" DataSourceID ="FacultyRoleDataSource" DataValueField ="Name" AppendDataBoundItems ="true" AutoPostBack="true" OnSelectedIndexChanged="ddlFacultyRole_SelectedIndexChanged">
        <asp:ListItem text="--Select Faculty Role--"> </asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID="FacultyRoleDataSource" runat="server" SelectMethod="GetFacultyRoleNames" TypeName="BusinessLogic"></asp:ObjectDataSource>
        <br />
    <asp:GridView ID="RoleComponentGV" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDeleted ="RoleComponentGV_RowDeleted" OnRowUpdated ="RoleComponentGV_RowUpdated" DataKeyNames ="ID"> 
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
        <br />
    <asp:ObjectDataSource ID="RoleComponentDataSource" runat="server" DeleteMethod="DeleteRoleComponent" InsertMethod="InsertRoleComponent" SelectMethod ="GetRoleComponentsAll" TypeName="BusinessLogic" UpdateMethod="UpdateRoleComponents">
        <DeleteParameters>
            <asp:ControlParameter Name ="ID" ControlID ="RoleComponentGV" PropertyName ="SelectedValue" Type ="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="role" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter Name ="ID" ControlID ="RoleComponentGV" PropertyName ="SelectedValue" Type ="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:ControlParameter ControlID ="ddlFacultyRole" Type ="String" Name ="role" PropertyName ="SelectedValue"/>
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID ="ddlFacultyRole" Type ="String" Name ="role" PropertyName ="SelectedValue"/>
        </SelectParameters>
    </asp:ObjectDataSource>

      <br />
    <asp:Table ID ="tblInsertComponent" runat ="server">
        <asp:TableRow>
            <asp:TableCell>
                Role Component Name:
            </asp:TableCell> 
            <asp:TableCell Width ="20px">

            </asp:TableCell>
             <asp:TableCell> 
                Description:
            </asp:TableCell>             
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtName" runat="server" Width="100px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell Width ="20px">

            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDescription" runat="server" Width="335px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>            
        </asp:TableRow>
    </asp:Table>
    <br />    
    <asp:Button ID="btnSave" runat="server" OnClick ="btnSave_Click" Text="Save" />
</asp:Content>

