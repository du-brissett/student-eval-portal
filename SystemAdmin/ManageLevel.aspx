<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageLevel.aspx.cs" Inherits="SystemAdmin_ManageLevel" %>

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

    <h1>OCR LEVELS</h1>
    <asp:HyperLink ID ="hlHome" runat ="server" Text ="Home" NavigateUrl ="~/SystemAdmin/AdminHome.aspx"></asp:HyperLink>
    <br />
    <br />
    <asp:GridView ID="LevelGridView" runat="server" DataSourceID ="LevelObject" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
        DataKeyNames ="ID" OnRowDeleted ="LevelGridView_RowDeleted" OnRowUpdated ="LevelGridView_RowUpdated">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="OCRScoreMin" DataFormatString="{0:n2}" HeaderText="OCR Min Score" HeaderStyle-HorizontalAlign ="Center" ItemStyle-HorizontalAlign ="Center" >
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="OCRScoreMax" DataFormatString="{0:n2}" HeaderText="OCR Max Score" HeaderStyle-HorizontalAlign ="Center" ItemStyle-HorizontalAlign ="Center" >
                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
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
    <asp:ObjectDataSource ID="LevelObject" runat="server" SelectMethod="GetAllLevels" TypeName="BusinessLogic" DeleteMethod="DeleteLevel" UpdateMethod="UpdateLevel" InsertMethod="InsertLevel">
        <DeleteParameters>
            <asp:ControlParameter Name="ID" ControlID ="LevelGridView" PropertyName ="SelectedValue" Type="Int32" />         
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Min" Type="Decimal" />
            <asp:Parameter Name="Max" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter Name="ID" ControlID ="LevelGridView" PropertyName ="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="OCRScoreMin" Type="Single" />
            <asp:Parameter Name="OCRScoreMax" Type="Single" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <h3>Add Level</h3>
    <br />
    <asp:Table ID ="tblInsertLevel" runat ="server">
        <asp:TableRow>
            <asp:TableCell>
                Level Name:
            </asp:TableCell> 
            <asp:TableCell> 
                Description:
            </asp:TableCell> 
            <asp:TableCell> 
                Minimum score:
            </asp:TableCell>
            <asp:TableCell> 
                Maximum score:
            </asp:TableCell> 
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtName" runat="server" Width="100px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDescription" runat="server" Width="335px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMinScore" runat="server" Width="50px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMaxScore" runat="server" Width="50px" CssClass ="TextboxGlow"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
</asp:Content>

