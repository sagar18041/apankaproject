<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li><a href="accountpage">My Account</a> <span class="divider">></span></li>
			<li class="active">Order Status</li>
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
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;Order
								Status</b></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;My Stuff</li>
						<li class="dividertop"></li>
						<li><a href='#'>My Wishlist</a></li>
						<li class="divider"></li>
						<li><a href='#'>My Ratings</a></li>
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

			<div class="span7">
				<h3>Order Status</h3>
				
				<h4>Check Order Status</h4>
				<br /> Now you can track the progress of your order right here!<br />
				Enter your Order ID below and click "GO" to view details of your
				order.<br /> <br />
				<div align="center">
					<s:form action="vieworderdetails" method="post">
						<div class="row-fluid">
							<div class="span2">
								<s:textfield name="orderNo" />
							</div>
							<div class="span4 offset1" style="padding-top: 2px;">
								<s:submit name="commandButton" value=" Go " align="center"
									cssClass="fk-button-blue" theme="simple" />
							</div>
						</div>
						<br />
					</s:form>

					<s:if test="hasActionErrors()">
						<div align="center">
							<s:iterator value="actionErrors">
								<div class="alert alert-error">
									<br /> <i class="icon-remove icon-2x"></i>&nbsp;&nbsp;
									<s:property />
									<br /> <br />
								</div>
							</s:iterator>

						</div>
					</s:if>
				</div>

			</div>
		</div>
</body>
</html>