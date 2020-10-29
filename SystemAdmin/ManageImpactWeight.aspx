<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageImpactWeight.aspx.cs" Inherits="SystemAdmin_ManageImpactWeight" %>

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

    <h5>&nbsp;&nbsp;Overall Impacts Assigned for selected Position:&nbsp;
        <asp:Label ID="lblStatus" runat="server" ForeColor="#66CCFF" Font-Size="Larger"></asp:Label>
     </h5>
<p>&nbsp;&nbsp;<strong> Review Faculty Role:</strong>
    <asp:Label ID="lblFacultyPending" runat="server"></asp:Label>
     </p>
<asp:DropDownList ID="ddlPosition" DataSourceID="ObjDataPosition" runat="server" Height="33px" Width="214px" DataTextField="Name" AppendDataBoundItems ="True" AutoPostBack="true" OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged">
    <asp:ListItem Text ="Select Position"></asp:ListItem> 
</asp:DropDownList>   
                
<asp:DropDownList ID="ddlFactRole" runat="server" DataSourceID="ObjDataSrcddlFaculty" DataTextField="Name" Height="33px" Width="215px"  AutoPostBack="true" AppendDataBoundItems ="True" OnSelectedIndexChanged="ddlFactRole_SelectedIndexChanged"  >
    <asp:ListItem Text="Select Faculty Role">  </asp:ListItem>
</asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="round" class=.btn-primary ToolTip="Click to edit Impacts" EnableViewState="False"  />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel"  Visible="false" OnClick="btnCancel_Click" /> 
        <asp:Label ID="lblmsg" runat="server" ForeColor="#66CCFF"></asp:Label>
    &nbsp;<br />
&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPosition"
ErrorMessage="Please Select Position!!!!" InitialValue="Select Position" ForeColor="Red"></asp:RequiredFieldValidator>   
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlFactRole"
ErrorMessage="Please Select Faculty Role!!!!"  InitialValue="Select Faculty Role" ForeColor="Red"></asp:RequiredFieldValidator>              
    <asp:Label ID="lblInstruct" runat="server" ForeColor="Red" Text="Label"></asp:Label>              
    &nbsp;&nbsp;              
    <br />  
  <asp:Label ID="lblTotalImpact" runat="server" Text="The total impacts assigned for the Specified  Position and Faculty Role are:" ></asp:Label>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblRemainingImpacts" runat="server" Text="The total Impacts remainding for assignment are:"></asp:Label>
<asp:DataList ID="dlCRR" runat="server" CellSpacing="-1" DataSourceID="ObjectDataSourceComponents" CellPadding="0" OnSelectedIndexChanged="dlCRR_SelectedIndexChanged"  OnItemCommand="dlCRR_ItemCommand"  >
    <HeaderTemplate >            
     <asp:TableRow ID="TableRow1" runat ="server"   >
         <asp:TableCell ColumnSpan ="1" RowSpan ="3" HorizontalAlign ="Center"  BorderColor="Black"  BorderWidth="2"   BackColor="#006699" Font-Bold="True" ForeColor="White">
                     <h4> Role Components </h4>  
         </asp:TableCell>         
         <asp:TableCell ColumnSpan ="6" RowSpan ="1" HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" BackColor="#006699" Font-Bold="True" ForeColor="White" >
                     <h3>Sources</h3> 
         </asp:TableCell>                  
         <asp:TableCell  ColumnSpan ="1" RowSpan ="3" HorizontalAlign ="Center" BorderStyle="Solid" BorderColor="Black"  BorderWidth="2" BackColor="#006699" Font-Bold="True" ForeColor="White">
                      <h4>  Weighted Rating</h4>
         </asp:TableCell></asp:TableRow>
     <asp:TableRow ID="TableRow2" runat ="server"  >             
         <asp:TableCell ColumnSpan ="2" HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" BackColor="#006699" Font-Bold="True" ForeColor="White"  >
                       <h4> Students</h4>
         </asp:TableCell>
         <asp:TableCell ColumnSpan ="2" HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" BackColor="#006699" Font-Bold="True" ForeColor="White">
                       <h4> Peers</h4>
         </asp:TableCell>
         <asp:TableCell  ColumnSpan ="2" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" HorizontalAlign="Center" BackColor="#006699" Font-Bold="True" ForeColor="White"  >
                       <h4> Head of Department/School</h4>
         </asp:TableCell>

     </asp:TableRow>
     <asp:TableRow ID="TableRow3" runat ="server">                            
         <asp:TableCell BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2"  HorizontalAlign="Center" BackColor="#006699" Font-Bold="True" ForeColor="White" >
                        Source Impact Weight
         </asp:TableCell>
         <asp:TableCell BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" Wrap="false" BackColor="#006699" Font-Bold="True" ForeColor="White">
                        Source Rating
         </asp:TableCell>
                        
         <asp:TableCell BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2"  HorizontalAlign="Center" BackColor="#006699" Font-Bold="True" ForeColor="White" >
                        Source Impact Weight
         </asp:TableCell>
         
         <asp:TableCell BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" Wrap="false" BackColor="#006699" Font-Bold="True" ForeColor="White" >
                        Source Rating
         </asp:TableCell>
                        
         <asp:TableCell BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2"  HorizontalAlign="Center" BackColor="#006699" Font-Bold="True" ForeColor="White"   >
                        Source Impact Weight
         </asp:TableCell>
                        
         <asp:TableCell  BorderStyle="Solid"  BorderColor="Black"  BorderWidth="2" Wrap="false" BackColor="#006699" Font-Bold="True" ForeColor="White" >
                        Source Rating
         </asp:TableCell>

      </asp:TableRow >
   </HeaderTemplate>
    <ItemTemplate> 
        <asp:TableRow ID="TableRow4" runat ="server"   >
            <asp:TableCell HorizontalAlign ="Center"  BorderColor="Black"  BorderWidth="1"  >
                <asp:Label ID ="lblRoleComponent" runat ="server"    Text = '<%# Eval("RoleComponent") %>' ForeColor="#003399" />                   
            </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  >
                <asp:TextBox ID="txtboxStudentImpact" runat="server"  Enabled="False" Width="120" Text='<%# Bind("StudentImpact") %>' BorderStyle="None" BackColor="White" ForeColor="#003399" MaxLength="99">  </asp:TextBox>
                    <asp:comparevalidator ID="Comparevalidator1" operator="DataTypeCheck" type="Double" controltovalidate="txtboxStudentImpact" display="Dynamic" BackColor="Red" errormessage="Invalid Input!!!" runat="server" />
                        <asp:RequiredFieldValidator ID="vldtxtStd" runat="server" ControlToValidate="txtboxStudentImpact"
                            ErrorMessage="Required Field" />
                            <%--<asp:RangeValidator ID="RangeValidatorStd" ControlToValidate="txtboxStudentImpact" runat="server" Type="Integer" ErrorMessage="One Impact value must not exceed 99" MaximumValue="99" MinimumValue="0"></asp:RangeValidator>--%>
                <br />
             </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"  BorderWidth="1"  RowSpan="1" BackColor="#006699">                                  
            </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1">               
                 <asp:TextBox ID="txtboxPeerImpact" runat="server"   Enabled="False" Width="120"  Text='<%# Bind("PeerImpact") %>' BorderStyle="None" BackColor="White" ForeColor="#003399" MaxLength="99">  </asp:TextBox>
                     <asp:comparevalidator ID="Comparevalidator2" operator="DataTypeCheck" type="Double" controltovalidate="txtboxPeerImpact" display="Dynamic" BackColor="Red" errormessage="Invalid Input!!!." runat="server" />
                           <asp:RequiredFieldValidator ID="vldtxtPeer" runat="server" ControlToValidate="txtboxPeerImpact"
                            ErrorMessage="Required Field" />
                <%--<asp:RangeValidator ID="RangeValidatorPeer" runat="server" ErrorMessage="One Impact value must not exceed 99" MaximumValue="99" MinimumValue="0" Type="Integer"></asp:RangeValidator>--%><br />
            </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid" BackColor="#006699"  BorderColor="Black"   BorderWidth="1"  RowSpan="1">                        
            </asp:TableCell><asp:TableCell  HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1">
                <asp:TextBox ID="txtboxHODImpact" runat="server" Enabled="False" Width="120"  Text='<%# Bind("HODImpact") %>' BorderStyle="None" BackColor="White" ForeColor="#003399" MaxLength="99">  </asp:TextBox>
                    <asp:comparevalidator ID="Comparevalidator3" operator="DataTypeCheck" type="Double" controltovalidate="txtboxHODImpact" display="Dynamic" BackColor="Red" errormessage="Invalid Input!!!." runat="server" />
                        <asp:RequiredFieldValidator ID="vldtxtHOD" runat="server" ControlToValidate="txtboxHODImpact" 
                            ErrorMessage="Required Field" />
                <%--<asp:RangeValidator ID="RangeValidatorHOD" runat="server" Type="Integer" controltovalidate="txtboxHODImpact" ErrorMessage="One Impact value must not exceed 99" MaximumValue="99" MinimumValue="0"></asp:RangeValidator>--%><br />
            </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid" BackColor="#006699" BorderColor="Black"   BorderWidth="1"  RowSpan="1">                   
            </asp:TableCell><asp:TableCell HorizontalAlign ="Center" BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1" Wrap="False" ForeColor="#003399" >  
                                    W                       
            </asp:TableCell></asp:TableRow></ItemTemplate><SeparatorStyle BorderColor="Black" BorderStyle="Solid" />
        <%--For footer of table--%>
  <FooterTemplate>
        <asp:TableRow ID="Crr" runat="server" > 
            <asp:TableCell  BorderStyle="Solid"  BorderColor="Black" HorizontalAlign="Center"  BorderWidth="1"  RowSpan="1" ColumnSpan ="1" Wrap="false"  ForeColor="#003399">
                                        Composite Role Rating
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1" ColumnSpan ="1"  >                        
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"  BorderWidth="1" RowSpan="1" ColumnSpan ="1" BackColor="#006699"  >                      
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1" ColumnSpan ="1"   >                      
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1" ColumnSpan ="1"  BackColor="#006699" >                                      
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1" ColumnSpan ="1"   >                                    
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"   BorderWidth="1"  RowSpan="1" ColumnSpan ="1" BackColor="#006699"  >                                  
             </asp:TableCell><asp:TableCell  BorderStyle="Solid"  BorderColor="Black"  BorderWidth="1"  RowSpan="1" ColumnSpan ="1" HorizontalAlign="Center" ForeColor="#003399" >
                          &#8721;        
             </asp:TableCell></asp:TableRow></FooterTemplate></asp:DataList><asp:ObjectDataSource ID="ObjDataPosition" runat="server" SelectMethod="GetPositions" TypeName="BusinessLogic">                                                                                                                                                                                                  
                 </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjDataSrcddlFaculty" runat="server" InsertMethod="InsertFacultyRole" SelectMethod="GetFacultyRoleNames" TypeName="BusinessLogic">
            <InsertParameters><asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="MinValue" Type="Decimal" />
                <asp:Parameter Name="MaxValue" Type="Decimal" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSourceComponents" runat="server" InsertMethod="InsertFacultyRole" SelectMethod="GetSelectRCSWeightParameter" TypeName="BusinessLogic">
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="MinValue" Type="Decimal" />
                <asp:Parameter Name="MaxValue" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPosition"  Name="inPositionName" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlFactRole" Name="inFactRoleName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
     <br />
   </asp:Content>

