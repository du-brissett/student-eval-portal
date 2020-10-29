<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CompositeRoleRating.aspx.cs" Inherits="Management_CompositeRoleRating" %>

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
    Select Staff:
    <br />
    <asp:DropDownList ID ="ddlStaff" runat ="server" AutoPostBack ="true">
        <asp:ListItem Text ="-- Select Staff --" Value ="0"></asp:ListItem>
    </asp:DropDownList> 
    <br />

    Select Academic Year:
    <br />    
    <asp:DropDownList ID ="ddlYear" runat ="server" AppendDataBoundItems ="true" AutoPostBack ="true" DataSourceID ="YearSource" DataTextField="AcademicYear" DataValueField ="AcademicYear" OnSelectedIndexChanged ="ddlYear_SelectedIndexChanged">
        <asp:ListItem Text ="-- Select Year --" Value ="0"></asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID ="YearSource" runat ="server" SelectMethod ="GetUserAcademicYear" TypeName ="BusinessLogic">
        <SelectParameters>
            <asp:ControlParameter ControlID ="ddlStaff" Name="RealID" PropertyName ="SelectedValue" Type ="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <br />
    Select Semester:
    <br />                
    <asp:RadioButtonList ID ="rblSemester" runat ="server" RepeatDirection ="Horizontal" AutoPostBack ="false" ValidationGroup ="Semester" CellPadding ="10" CellSpacing ="50"></asp:RadioButtonList>
    
    Select Faculty Roles: <br />
    <asp:DropDownList ID ="ddlFacultyRole" runat ="server" DataSourceID ="facultyRoleObjectSource" DataValueField ="Name" AppendDataBoundItems ="true" AutoPostBack ="true" OnSelectedIndexChanged ="ddlFacultyRole_SelectedIndexChanged">
        <asp:ListItem Text ="-- Select Faculty Role --" Value ="0"></asp:ListItem>
    </asp:DropDownList>
    <asp:ObjectDataSource ID ="facultyRoleObjectSource" runat ="server" SelectMethod="GetFacultyRoleNames" TypeName="BusinessLogic"></asp:ObjectDataSource>
    
    <br />
    <br />

    <asp:DataList ID="dlCRR" runat="server" Width ="100%">
        <HeaderTemplate>            
                <asp:TableRow runat ="server">
                    <asp:TableCell ColumnSpan ="1" RowSpan ="3">
                        
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan ="6" RowSpan ="1" HorizontalAlign ="Center">
                        Sources
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan ="1" RowSpan ="3"  VerticalAlign ="Middle">
                        Weighted Rating
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat ="server">            
                    <asp:TableCell ColumnSpan ="2" HorizontalAlign ="Center">
                        Students
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan ="2" HorizontalAlign ="Center">
                        Peers
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan ="2" HorizontalAlign ="Center">
                        Head of Department/School
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat ="server">            
                    <asp:TableCell>
                        Source Impact Weight
                    </asp:TableCell>
                    <asp:TableCell>
                        Source Rating
                    </asp:TableCell>
                    <asp:TableCell>
                        Source Impact Weight
                    </asp:TableCell>
                    <asp:TableCell>
                        Source Rating
                    </asp:TableCell>
                    <asp:TableCell>
                        Source Impact Weight
                    </asp:TableCell>
                    <asp:TableCell>
                        Source Rating
                    </asp:TableCell>
                </asp:TableRow>
        </HeaderTemplate>
        <ItemTemplate>            
            <asp:TableRow runat ="server">
                <asp:TableCell>
                    <asp:Label ID ="lblRoleComponent" runat ="server" Text = '<%# Eval("RoleComponent") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblStudentImpact" runat ="server" Text = '<%# Eval("StudentImpact") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblStudentRating" runat ="server" Text = '<%# Eval("StudentRating") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblPeerImpact" runat ="server" Text = '<%# Eval("PeerImpact") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblPeerRating" runat ="server" Text = '<%# Eval("PeerRating") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblHODImpact" runat ="server" Text = '<%# Eval("HODImpact") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblHODRating" runat ="server" Text = '<%# Eval("HODRating") %>'/>
                </asp:TableCell>
                <asp:TableCell HorizontalAlign ="Center">
                    <asp:Label ID ="lblWeightedRating" runat ="server" Text = '<%# Eval("WeightedRating") %>'/>
                </asp:TableCell>
            </asp:TableRow>
        </ItemTemplate>
    </asp:DataList>
    <br />   
    
    <asp:ObjectDataSource ID ="WeightedRatingDataSource" runat ="server" SelectMethod="CalculateWeightedRating" TypeName="BusinessLogic">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlStaff" Name="RealID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlFacultyRole" Name="FacultyRole" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlYear" Name="AcademicYear" PropertyName ="SelectedValue" Type ="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID ="WeightedRatingPerSemester" runat ="server" SelectMethod="CalculateWeightedRatingPerSemester" TypeName="BusinessLogic">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlStaff" Name="RealID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlFacultyRole" Name="FacultyRole" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlYear" Name="AcademicYear" PropertyName ="SelectedValue" Type ="String" />
            <asp:ControlParameter ControlID ="rblSemester" Name ="Semester" PropertyName ="SelectedValue" Type ="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div></asp:Content>

