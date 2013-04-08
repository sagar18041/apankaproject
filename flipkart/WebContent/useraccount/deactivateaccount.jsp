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
			<li class="active">Deactivate Account</li>
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
						<li><a href='addresspage'>Change Password</a></li>
						<li class="divider"></li>
						<li><a href='addresspage'>Addresses</a></li>
						<li class="divider"></li>
						<li><a href='emailpage'>Update Email</a></li>
						<li class="divider"></li>
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;Deactivate
								Account</b></li>
						<li class="dividerbottom"></li>
					</ul>
				</div>
			</div>

			<div class="span9">
				<h3>Deactivate Account</h3>

				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>

				<div align="left">
					<s:form action="deactivateaccount">
						<table class="">


							<tr>
								<td
									style='text-align: left; vertical-align: middle; font-size: 14px'
									width="200" height="40">Email Address</td>
								<td
									style='text-align: left; vertical-align: middle; font-size: 14px'
									width="200" height="40"><s:property value="emailAddress" /></td>
							</tr>

							<tr>
								<td
									style='text-align: left; vertical-align: middle; font-size: 14px'
									width="200" height="40">Password</td>
								<td
									style='text-align: left; vertical-align: middle; font-size: 14px'
									width="200" height="40"><s:password name="password"
										cssClass="input-large" /></td>
							</tr>

							<tr>
								<td width="200" height="40"></td>
								<td
									style='text-align: left; vertical-align: middle; font-size: 14px'
									width="200" height="40"><s:submit name="commandButton"
										value="Confirm Deactivation" align="center"
										cssClass="fk-button-blue pull-left" /></td>
							</tr>
						</table>
					</s:form>
					<br/>
					<strong>When you deactivate your account</strong> <br /> <br />
					<ul>
						<li>You are logged out of your Flipkart Account.</li>
						<li>Your public profile on Flipkart is no longer visible.</li>
						<li>Your reviews/ratings are still visible, while your
							profile information is shown as 'unavailable' as a result of
							deactivation.</li>
						<li>Your wishlist items are no longer accessible through the
							associated public hyperlink. Wishlist is shown as 'unavailable'
							as a result of deactivation</li>
						<li>You will be unsubscribed from receiving promotional
							emails from Flipkart.</li>
						<li>Your account data is retained and is restored in case you
							choose to reactivate your account.</li>

					</ul>
					<br /> <strong> How do I reactivate my Flipkart account?</strong><br />
					<br /> Reactivation is easy.<br /> <br /> Simply login with the
					email/social network ID and password combination used prior to
					deactivation. Your account data is fully restored. Default settings
					are applied and you will be subscribed to receive promotional
					emails from Flipkart.<br /> <br />Flipkart retains your account
					data for you to conveniently start off from where you left, if you
					decide to reactivate your account.<br />

				</div>
			</div>
		</div>
	</div>
</body>
</html>