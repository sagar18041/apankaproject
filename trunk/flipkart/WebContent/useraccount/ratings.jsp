<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
.hrclass {
	clear: both;
	margin: 2px 0 2px 0;
	display: block;
}
</style>
<body>
	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li><a href="accountpage">My Account</a> <span class="divider">></span></li>
			<li class="active">My Ratings</li>
		</ul>
		<div class="row-fluid">
			<div class="span3">
				<div class="acct">
					<!-- changed nav-list -->
					<ul class="nav nav-list">
						<li class="nav-head">&nbsp;My Account</li>
						<li class="nav-heading">&nbsp;&nbsp;Orders</li>
						<li class="dividertop"></li>
						<li><a href='vieworders'>My Orders</a></li>
						<li class="divider"></li>
						<li><a href='vieworderstatus'>Order Status</a></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;My Stuff</li>
						<li class="dividertop"></li>
						<li><a href='viewwishlist'>My Wishlist</a></li>
						<li class="divider"></li>
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;My Ratings</b></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;Settings</li>
						<li class="dividertop"></li>
						<li><a href='accountpage'>Personal Information</a></li>
						<li class="divider"></li>
						<li><a href='passwordpage'>Change Password</a></li>
						<li class="divider"></li>
						<li><a href='addresspage'>Addresses</a></li>
						<li class="divider"></li>
						<li><a href='emailpage'>Update Email</a></li>
						<li class="divider"></li>
						<li><a href='deactivateaccountpage'>Deactivate Account</a></li>
						<li class="dividerbottom"></li>
					</ul>
				</div>
			</div>

			<div class="span9">
				<h3>My Ratings</h3>

				<div class="row-fluid">
					<s:iterator value="ratings">

						<div class="span4">
							<div class="well" style="height: 150px">
								<div class="media">
									 <a class="pull-left" href="#"> <img
										class="img-rounded" data-src="holder.js/64x64"
										src="<s:property value="thumbnail" />" width="100"
										height="100">
									</a>
									<div class="media-body" >
										<a href="displayitem?itemID=<s:property value="productID" />"><font style="font-size: 11px;"><s:property
												value="productName" /></font></a> 
												
												
										<hr class="hrclass" size="1" color="#F5F5F5">
										
										<font style="font-size: 11px;"> Price: </font><font style="color: #B82E00; font-size: 11px;">Rs. <s:property value="price" />
										</font>		
																		
										<hr class="hrclass" size="1" color="#F5F5F5" ><span
											class="rating-static rating-<s:property value="ratingStar"/>0">
										</span> 
										
										<br /> 
									</div>
								</div>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</body>
</html>