<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
	redirectTime = "1500";
	redirectURL = "";
	function timedRedirect(value) {
		redirectURL = "deleteaddress?addressID=" + value;
		document.getElementById(value).innerHTML = "<div class='span5' align='center' style='background-color: #D4EFF8; width: 220px; height: 290px;font-size: 16px'><br><br><br><br><br><b>Deleting...</b></div>";
		setTimeout("location.href = redirectURL;", redirectTime);

	}
</script>


</head>
<body>
	<div class=container-fluid>

		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li><a href="accountpage">My Account</a> <span class="divider">></span></li>
			<li class="active">Addresses</li>
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
						<li><a href='#'>My Ratings</a></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;Settings</li>
						<li class="dividertop"></li>
						<li><a href='accountpage'>Personal Information</a></li>
						<li class="divider"></li>
						<li><a href='passwordpage'>Change Password</a></li>
						<li class="divider"></li>
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;Addresses</b></li>
						<li class="divider"></li>
						<li><a href='emailpage'>Update Email</a></li>
						<li class="divider"></li>
						<li><a href='deactivateaccountpage'>Deactivate Account</a></li>
						<li class="dividerbottom"></li>
					</ul>
				</div>
			</div>
			<div class="span6">
				<h3>Add a New Address</h3>
				<div align="center">
					<s:form action="addaddress">
						<table class="table">
							<tr>
								<td>Name</td>
								<td><s:textfield name="shippingName" /></td>
							</tr>
							<tr>
								<td>Address</td>
								<td><s:textarea name="shippingAddr" rows="4"
										style="resize: none;" /><font
									style="font-size: 12px; color: #999999"><br />(Maximum
										Limit : 216 characters)</font></td>
							</tr>
							<tr>
								<td>Landmark</td>
								<td><s:textfield name="shippingLm" style="font-size: 12px" /></td>
							</tr>
							<tr>
								<td>City</td>
								<td><s:textfield name="shippingCity" /></td>
							</tr>
							<tr>
								<td>State</td>
								<td><s:select name="shippingState" list="stateList"
										headerKey="-1" headerValue="--Select--" /></td>
							<tr>
								<td>Country</td>
								<td><font style="font-size: 12px; font-weight: bold;">India</font>&nbsp;<font
									style="font-size: 12px; color: #999999">(Service
										available only in India)</font></td>
							</tr>
							<tr>
								<td>Pincode</td>
								<td><s:textfield name="shippingCode"
										style="font-size: 12px" /></td>
							</tr>
							<tr>
								<td>Phone Number</td>
								<td><s:textfield name="shippingPhone"
										style="font-size: 12px" /></td>
							</tr>
						</table>

						<s:submit value="Save Changes" theme="simple"
							style="margin-left: 0px" cssClass="fk-button-blue" />
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
				<hr style="border-style: dotted; border-color: #CBCBCB;">
				<b>&nbsp;&nbsp;&nbsp;&nbsp;Your Saved Addresses</b> <br /> <br />
				<s:iterator value="addressList">
					<div class="span5" id="<s:property value="addressID" />">
						<div class="well" style="height: 250px; width: 180px;">
							<font style="font-size: 12px"> <b><s:property
										value="name" /></b> <br /> <s:property value="streetAddress" />
								<br /> <s:property value="landmark" /> <s:property
									value="city" /> <br /> <s:property value="stateName" /> <br />
								<s:property value="pincode" /> <br /> <s:property
									value="phoneNumber" />
								<hr style="border-style: dotted; border-color: #CBCBCB;"> <a
								href="javascript:timedRedirect('<s:property value="addressID" />')"
								style="text-decoration: none; padding-left: 40px">Delete
									Address</a><br />
							</font>
						</div>
					</div>
				</s:iterator>

			</div>
		</div>
	</div>
</body>
</html>