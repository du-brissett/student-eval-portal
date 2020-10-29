<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManagePositions.aspx.cs" Inherits="SystemAdmin_ManagePositions" %>

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
 
    <asp:GridView ID="GridViewPosition" runat="server" AutoGenerateColumns ="False" DataSourceID="ObjectDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames ="ID">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType ="Button" ShowDeleteButton ="true" ShowEditButton ="true"/>
            <asp:BoundField DataField ="Name" HeaderText ="Name" />
            <asp:BoundField DataField ="Description" HeaderText ="Description" />
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
    <asp:ObjectDataSource ID="ObjectDataSource" runat="server" DeleteMethod="DeletePosition" SelectMethod="GetPositionsAll" TypeName="BusinessLogic" UpdateMethod="UpdatePosition" InsertMethod="InsertPosition">
        <DeleteParameters>
            <asp:ControlParameter Name ="ID" ControlID ="GridViewPosition" Type ="Int32" PropertyName ="SelectedValue" />
        </DeleteParameters>
         <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter Name ="ID" ControlID ="GridViewPosition" Type ="Int32" PropertyName ="SelectedValue" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />    
    <h3>Add Position</h3>
    <br />
    <asp:Table ID ="tblInsertRole" runat ="server">
        <asp:TableRow>
            <asp:TableCell>
                Position Name:
            </asp:TableCell> 
            <asp:TableCell> 
                Description:
            </asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtName" runat="server" Width="100px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDescription" runat="server" Width="335px" TextMode ="MultiLine" Rows ="4"></asp:TextBox>
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

