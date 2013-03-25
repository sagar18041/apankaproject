<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.acct {
	background-color: white;
	border: 1px solid #E0E0EB;
	-moz-box-shadow: 3px 3px 5px #888888; /* Old Firefox */
	box-shadow: 3px 3px 5px #888888;
}

.nav-heading {
	width: auto;
	padding: 5px;
	font-size: 16px;
	font-weight: bold;
	line-height: 20px;
	color: black;
	background-color: #E0E0EB;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
	font-size: 16px;
	padding: 5px;
	font-size: 16px;
}

.nav-head {
	width: auto;
	padding: 8px;
	font-size: 18px;
	font-weight: bold;
	line-height: 20px;
	color: white;
	background-color: #014A72;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
}

.nav-list .dividertop {
	*width: 100%;
	height: 1px;
	margin: 0px 0px;
	*margin: 0px 0 0px;
	overflow: hidden;
	background-color: #e5e5e5;
	border-bottom: 1px solid #ffffff;
	border-bottom-width: 10px;
}

.nav-list .dividerbottom {
	*width: 100%;
	height: 1px;
	margin: 0px 1px;
	*margin: 0px 0 0px;
	overflow: hidden;
	background-color: #e5e5e5;
	border-top: 1px solid #ffffff;
	border-top-width: 10px;
}
</style>
</head>
<body>
	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li><li><a href="accountPage">My Account</a> <span class="divider">></span></li>
			<li class="active">Change Password</li>
		</ul>
		<div class="row-fluid">
			<div class="span3">
				<div class="acct">
					<!-- changed nav-list -->
					<ul class="nav nav-list">
						<li class="nav-head">&nbsp;My Account</li>
						<li class="nav-heading">&nbsp;&nbsp;Orders</li>
						<li class="dividertop"></li>
						<li><a href='#'>My Orders</a></li>
						<li class="divider"></li>
						<li><a href='#'>Order Status</a></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;Payments</li>
						<li class="dividertop"></li>
						<li><a href='#'>Wallet</a></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;My Stuff</li>
						<li class="dividertop"></li>
						<li><a href='#'>My Wishlist</a></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;Settings</li>
						<li class="dividertop"></li>
						<li ><a href='accountPage'>Personal
								Information</a></li>
						<li class="divider"></li>
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;Change Password</b></li>
						<li class="divider"></li>
						<li><a href='#'>Addresses</a></li>
						<li class="divider"></li>
						<li><a href='#'>Update Email</a></li>
						<li class="dividerbottom"></li>
					</ul>
				</div>
			</div>

			<div class="span9">
				<h3>Change Password</h3>
				<div align="center">
					<s:form action="modifypassword" method="post">
						<table class="table">
							<tbody>
							
								<tr>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'>Email Address</td>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'><s:property value="emailAddress" /></td>
								</tr>
								
								<tr>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'>Old Password</td>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'><s:password
											name="oldPassword" cssClass="input-large" /></td>
								</tr>

								<tr>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'>New Password</td>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'><s:password
											name="newPassword" cssClass="input-large" /></td>
								</tr>

								<tr>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'>Retype New Password</td>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'><s:password
											name="retypedPassword" cssClass="input-large" /></td>
								</tr>

							</tbody>
						</table>
						<br />
						<s:submit name="commandButton" value="Save Changes" align="center"
							cssClass="btn btn-primary" />

					</s:form>
					<s:if test="hasActionMessages()">
						<div align="center">
							<s:iterator value="actionMessages">
								<div class="alert alert-success"> <br /><i class="icon-ok icon-2x"></i>&nbsp;&nbsp;<s:property />
									<br /> <br />
								</div>
							</s:iterator>

						</div>
					</s:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>