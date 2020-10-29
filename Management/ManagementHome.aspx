<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManagementHome.aspx.cs" Inherits="Management_ManagementHome" %>
<%@ MasterType VirtualPath="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <%-- <div class="navbar-wrapper">
      

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
            <a class="brand" href="#">Management</a>
            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="#">Home</a></li>             
                <li><a href="#contact">Contact</a><%--</li>
                <!-- Read about Bootstrap dropdowns at http://twitter.github.com/bootstrap/javascript.html#dropdowns -->
                <li class="dropdown">
                <%--  <a href="#tab1" <%--class="dropdown-toggle"--%> 
   <%-- data-toggle="dropdown">MANAGEMENT<b class="caret"></b></a>--%>
                  <%--<ul class="dropdown-menu">
                    <<%--li><a href="StaffOCRReport.aspx">STAFF OCR</a></li>
                    <li><a href="CompositeRoleRating.aspx">COMPOSITE ROLE RATING</a></li>
                    <li><a href="MeritBonus.aspx">MERIT BONUS REPORT</a></li>--%>
                    

 

<body>
	
	
	
	
	
	
	
	<!-- MODAL CONTACT FORM -->
	<div class="modal hide fade" id="modal-contact-form">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">&times;</button>
			<h3>Contact Us</h3>
		</div>
		
		<div class="modal-body">
			<form action="" class="form-horizontal">
				<div class="control-group">
					<label for="contact-name" class="control-label">Name:</label>
					
					<div class="controls">
						<input type="text" id="contact-name" />
					</div>
				</div>

				<div class="control-group">
					<label for="contact-email" class="control-label">Email:</label>
					
					<div class="controls">
						<input type="email" id="contact-email" />
					</div>
				</div>

				<div class="control-group">
					<label for="contact-message" class="control-label">Message:</label>
					
					<div class="controls">
						<textarea name="contact-message" id="contact-message" cols="30" rows="10"></textarea>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn btn-primary" value="Send Message" />
					</div>
				</div>
			</form>
		</div>
		
		<div class="modal-footer">
			<a href="" data-dismiss="modal" class="btn">Cancel</a>
		</div>
	</div> <!-- end modal -->
	
	
	
	
	<div class="container">
		<!-- PAGE HEADER -->
		<section>
			<ul class="breadcrumb">
				<li><a href="ManagementHome.aspx">HOME</a> <span class="divider">/</span></li>	
                <li><a href="StaffOCRReport.aspx">STAFF OCR</a><span class="divider">/</span></li>
                <li><a href="CompositeRoleRating.aspx">COMPOSITE ROLE RATING</a> <span class="divider">/</span></li>
                <li><a href="MeritBonus.aspx">MERIT BONUS REPORT</a> <span class="divider">/</span></li>
                <li><asp:LoginStatus ID ="LoginStatus" runat ="server" LogoutAction ="RedirectToLoginPage" /></li>
			</ul>
		</section>
		
		
		
		
		
		
		<!-- PAGE CONTENT -->
		<section>
			<h4>PURPOSE</h4>

			<div class="row">
				<div class="span8">
					<p>The purposes of faculty evaluation at the University of Technology, Jamaaica are to promote individual professional development, to facilitate student learning, and to enhance institutional improvement. The evaluation process focuses on the objectives and goals of the individual and of the University. It serves both as a measure of progress toward stated goals and a discussion of expectations for the future. The evaluation is also the basis for promotion, tenure, pre-tenure and post-tenure review.</p>
					
				</div>
				
				<div class="span4">
				</div>
			</div>
			
			<hr />
		</section>
	
	
	
	
	
		<!-- TEAM -->
		<section>
			<h4>&nbsp;</h4>
			
			<ul class="thumbnails">
				<li class="span6">
					<div class="thumbnail">
						<img src=""  />
						
						<div class="caption">
							<h5>&nbsp;</h5>
							
							<p><small>:</small></p>
						</div>
					</div>
				</li>
				<li class="span6">
					<div class="thumbnail">
						&nbsp;<div class="caption">
						</div>
					</div>
				</li>
			</ul>
		</section>
	
	
	
	
	
		<!-- FOOTER -->
		<section>
			<hr />
		
			<p class="lead text-center">&nbsp;</p>
			
			<hr />
			
			<ul class="inline text-center">
				<li></li>
			</ul>
			
			<p class="text-center muted">© Copyright 2013</p>
		</section>
	</div> <!-- end container -->
	
	<!-- JavaScript -->
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
	    $(document).ready(function () {
	        $('.carousel').carousel({
	            interval: 5000
	        });
	    });
	</script>

</body>  
</asp:Content>

