<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function getSortByValue() {
		var element = document.getElementById("sortById");
		var content = element.options[element.selectedIndex].text;
		/* alert("..."+content); */
		callActionClass(content);
	}

	function callActionClass(content) {
		var x = 1;
		window.location = "sortByValue?content=" + content + "&fromSelectFlag="
				+ x;
	}
</script>
<title>Insert title here</title>
<style type="text/css">
.hrclass {
	clear: both;
	margin: 9px 0 9px 0;
	display: block;
}

.brclass {
	clear: both;
	margin: 1px 0 1px 0;
	display: block;
}
</style>
</head>
<body>
	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li><a href="accountpage">My Account</a> <span class="divider">></span></li>
			<li class="active">Wishlist</li>
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
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;My Wishlist</b></li>
						<li class="divider"></li>
						<li><a href='viewmyratings'>My Ratings</a></li>
						<li class="dividerbottom"></li>

						<li class="nav-heading">&nbsp;&nbsp;Settings</li>
						<li class="dividertop"></li>
						<li><a href='accountpage'>Personal
								Information</a></li>
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
				<br/>
				<b><font style="font-size: 23px;"> My Wishlist </font></b><font style="font-size: 16px;">(<s:property value="wishlistCount" /> Items)</font> 
				<br />
				<div align="right">
					<s:select name="sortBy" list="sortBy" id="sortById" headerKey="0"
						headerValue="Sort by Price" theme="simple" value="%{content}"
						cssStyle="font-size:13px;" style="width:130px"
						onChange="getSortByValue()" />
				</div>
				<hr class="hrclass" size="3" color="#CCCCCC">
				<s:set name="count" value="%{wishlistCount}" />
				<s:if test="%{#count==0}">
					<div align="center">
						There are no items in your wishlist.<br /> <br /> <a href="home"
							class="btn btn-small btn-primary">Continue Shopping</a>
						<hr class="hrclass" size="3" color="#CCCCCC">
					</div>
				</s:if>
				<s:iterator value="wishlistItems" status="i">
					<div class="row-fluid">
						<div class="span1">
							<font style="font-size: 13px; color: #999999;"> <s:property
									value="%{#i.count}" />.
							</font>
						</div>
						<div class="span3">
							<a href="displayitem?itemID=<s:property value="%{itemID}" />"> <img src='<s:property value="thumbnail"/>'
								style="width: 200px; height: 150px;" alt="">
							</a>
						</div>

						<div class="span5">

							<font style="font-size: 13px;"><a
								href="displayitem?itemID=<s:property value="%{itemID}" />">
									<s:property value="%{itemName}" />
							</a>
							<hr class="brclass" style="visibility:hidden;" size="4"/>
								<div style="background-color: #F2F2F2; padding-left: 10px;">

									<br /> <b><font style="color: red;">Rs <s:property
												value="%{price}" /></font></b> <br /> In Stock Delivered in <b><s:property
											value="%{deliveryTime}" /> business days.</b></br>


									<s:set name="priceValue" value="%{price}" />
									<s:if test="%{#priceValue>500}">
											 Free Home Delivery.
											 </s:if>
								</div><hr class="brclass" style="visibility:hidden;" />
								<div
									style="background-color: #F2F2F2; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">

									<a
											href="addToCartFromWishlist?itemID=<s:property value="%{itemID}" />&itemName=<s:property value="%{itemName}" />&price=<s:property value="%{price}" />&deliveryTime=<s:property value="%{deliveryTime}" />&thumbnail=<s:property value="%{thumbnail}" />"
											class="btn btn-small btn-warning">Buy Now</a>&nbsp;&nbsp; <a
										href="removeFromwishlist?itemID=<s:property value="itemID"/>">Remove
										from Wishlist</a>
								</div> </font>
						</div>

					</div>
					<!-- <hr style="border:dashed #999999; border-width:1px 0 0; height:0;"> -->
					<hr class="hrclass" size="3" color="#CCCCCC">
				</s:iterator>
				Total value of items on this page: <b>Rs. <s:property
						value="totalAmount" /></b>
			</div>
		</div>
	</div>
</body>
</html>