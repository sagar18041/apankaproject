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
			<li class="active">Update Email</li>
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
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;Update
								Email</b></li>
						<li class="divider"></li>
						<li><a href='deactivateaccountpage'>Deactivate Account</a></li>
						<li class="dividerbottom"></li>
					</ul>
				</div>
			</div>

			<div class="span7">
				<h3>Update Email</h3>
				<br /> <br /> <b>Enter the new Email ID that you wish to
					associate with your Flipkart account.</b><br /> <br />
				<div align="center">
					<s:form action="modifyemail" method="post">
						<table class="table">
							<tbody>

								<tr>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'>Email
										Address</td>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'><s:property
											value="emailAddress" /></td>
								</tr>


								<tr>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'>New
										Email ID</td>
									<td
										style='text-align: left; vertical-align: middle; font-size: 14px'><s:textfield
											name="newEmailAddress" cssClass="input-large" /></td>
								</tr>

							</tbody>
						</table>
						<br />
						<s:submit name="commandButton" value="Save Changes" align="center"
							cssClass="fk-button-blue" />

					</s:form>
					<s:if test="hasActionMessages()">
						<div align="center">
							<s:iterator value="actionMessages">
								<div class="alert alert-success">
									<br /> <i class="icon-ok icon-2x"></i>&nbsp;&nbsp;
									<s:property />
									<br /> <br />
								</div>
							</s:iterator>

						</div>
					</s:if>

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

				<div class="span 6">
					<br />
					<br />
					<h5>
						<b>What happens when the Email ID is updated?</b>
					</h5>
					<ul>
						<li><font style="size: 10px">Wallet balance is
								transferred to the new account</font></li>
						<li>Your order history is available under the new account</li>
						<li>Your wishlist items are associated with the new account's
							URL. The list's previous hyperlink is cleared</li>
						<li>Profile activity (including your reviews and ratings) is
							migrated likewise</li>
					</ul>
				</div>

			</div>
		</div>
	</div>
</body>
</html>