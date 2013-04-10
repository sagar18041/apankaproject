<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>


<head>
<style>
.input-myText {
	width: 5px;
	min-height: 30px;
}

.ritumodal {
	position: fixed;
	top: 50%;
	left: 41%;
	z-index: 1050;
	width: 850px;
	margin: -250px 0 0 -280px;
	background-color: #ffffff;
	border: 1px solid #999;
	border: 1px solid rgba(0, 0, 0, 0.3);
	*border: 1px solid #999;
	/* IE6-7 */
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
	box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
	-webkit-background-clip: padding-box;
	-moz-background-clip: padding-box;
	background-clip: padding-box;
	outline: none;
}

.modal.fade {
	-webkit-transition: opacity .3s linear, top .3s ease-out;
	-moz-transition: opacity .3s linear, top .3s ease-out;
	-o-transition: opacity .3s linear, top .3s ease-out;
	transition: opacity .3s linear, top .3s ease-out;
	top: -25%;
}
</style>
<script type="text/javascript">
if(window.history.forward(1) != null)
    window.history.forward(1);
	jQuery(document).ready(function($) {
		$('#ritumodal').modal({
			
			'show' : true,
			'backdrop' : 'static',
			'display' : 'none'
		});
		
	});
	
	function showTextBox(x,y)
	{
	/* alert(y);
	alert(x); */
	document.getElementById(x).style.display='block';
	document.getElementById(y).style.display='none';
	
	}
	function update(x,y)
	{
		var z = document.getElementById(y).value;
/* 		alert(z);
		alert(x);
		alert(y); */
		window.location = "updateCart?itemID=" + x +"&newQuantity=" + z;
		/* alert(z);  */
	}
	
	function updateOnEnter()
	{
		if (event.keyCode == 13){
			 event.preventDefault();
		}
	
	}
	
	setTimeout(function() {
	    $('#mydiv').fadeOut('slow');
	}, 10000);
	
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li class="active">My Account</li>
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
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;Personal
								Information</b></li>
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

			<form name="myForm">
				<div id="ritumodal" class="ritumodal hide fade">
					<div class="modal-header">

						<h3 id="myModalLabel">
							<span class="cart-icon-black"></span> <b>Cart (<s:property
									value="%{#session.cartCount}" />)
							</b>
						</h3>
					</div>
					<%-- <s:property value="%{#session.checkDisplay}" /> --%>

					<s:set name="count" value="%{cartCount}" />
					<s:if test="%{#count>0}">

						<s:set name="checkAdd" value="%{#session.checkAddDisplay}" />
						<s:if test="%{#checkAdd=='true'}">
							<div style="background-color: #FDF7DF; height: 50px;" id="mydiv"
								align="center">
								The item <b><s:property value="%{itemAddedToCart}" /></b> has
								been added to your cart. </br>Your cart has
								<s:property value="%{#session.cartCount}" />
								items now.
							</div>
							<s:set name="checkAddDisplay" scope="session" value="false" />
						</s:if>

						<s:set name="checkDelete" value="%{#session.checkDeleteDisplay}" />
						<s:if test="%{#checkDelete=='true'}">

							<div style="background-color: #FDF7DF; height: 50px;" id="mydiv"
								align="center">
								The item <b><s:property value="%{itemDeletedFromCart}" /></b>
								has been moved deleted from your cart. </br>Your cart has
								<s:property value="%{#session.cartCount}" />
								items now.
							</div>
							<s:set name="checkDeleteDisplay" scope="session" value="false" />
						</s:if>

						<s:set name="check" value="%{#session.checkDisplay}" />
						<s:if test="%{#check=='true'}">
							<div style="background-color: #FDF7DF; height: 50px;" id="mydiv"
								align="center">
								The item <b><s:property value="%{itemMovedToWishlist}" /></b>
								has been moved to your WishList.</br> Your cart has
								<s:property value="%{#session.cartCount}" />
								items now.
							</div>
							<s:set name="checkDisplay" scope="session" value="false" />
						</s:if>

						<div STYLE="height: 300px; overflow: auto;">
							<br />
							<table class="table table-striped ">
								<tr>
									<th></th>
									<th style="text-align: center"></th>
									<th style="text-align: left">Item Description</th>
									<th style="text-align: left">Delivery Time</th>
									<th style="text-align: left">Price</th>
									<th style="text-align: left">Qty</th>
									<th style="text-align: left">Subtotal</th>
									<th></th>


								</tr>
								<s:iterator value="cartItems" status="i">
									<tr>
										<td style="background-color: #C7E7F0; width: 1px;"></td>
										<td style="text-align: left"><img
											src="<s:property
										value="%{thumbnail}" />"
											width="100" height="40" /></td>
										<td style="text-align: left;"><font
											style="font-size: 13px;"><s:property
													value="%{itemDescription}" /></font><br /> <font
											style="font-size: 12px;"><a
												href="moveToWishlist?itemID=<s:property value="itemID"/>">Move
													to wishlist</a></font></td>
										<td style="text-align: left;"><font
											style="font-size: 13px;"><s:property
													value="%{deliveryTime}" /> Business Days</font></td>
										<td style="text-align: left"><font
											style="font-size: 13px;">Rs. <s:property
													value="%{price}" /></font></td>


										<td style="text-align: left">

											<div id="<s:property value="status2" />">
												<font style="font-size: 13px;"><s:property
														value="quantity" /></font> <br /> <font
													style="font-size: 12px;"> <a href="#"
													onclick="showTextBox(<s:property value="%{#i.count}" />,<s:property value="%{status2}" />);">Change</a>
												</font>
											</div>

											<div id="<s:property value="%{#i.count}" />"
												style="display: none">
												<input type="text" name="newQuantity"
													id="<s:property value="statusQuantity" />"
													value="<s:property value="quantity"/>"
													onkeypress="updateOnEnter()"
													style="width: 16px; height: 11px;" /> <font
													style="font-size: 12px;"> <a href="#"
													onclick="update(<s:property value="itemID"/>,<s:property value="statusQuantity" />);">Save</a>
												</font>
											</div>
										</td>


										<td style="text-align: left"><font
											style="color: red; font-size: 13px;">Rs. <s:property
													value="%{subTotal}" /></font></td>
										<td><a
											href="deleteCart?itemID=<s:property value="itemID"/>"
											style="text-decoration: none;"><i
												class="icon-remove-sign"></i></a></td>
									</tr>
								</s:iterator>
								<tr>
									<td></td>
									<td></td>
									<td>Delivery Charge:</td>
									<td></td>
									<td></td>
									<td></td>
									<td><font style="color: red; font-size: 13px;"> <s:property
												value="%{deliveryCharge}" /></font></td>
									<td></td>
								</tr>
							</table>

							<div
								style="background-color: #F2F2F2; align: 'right'; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;">
								<div align="right">
									<b>Amount Payable: Rs. <font
										style="color: red; font-size: 13px;"><s:property
												value="%{amountPayable}" /></font></b>
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<div class="row-fluid">
								<div class="pull-left">
									<a href="home" class="btn btn-primary">Close and Continue
										Shopping</a>
								</div>
								<div class="pull-right">
									<a href="emaillogin" class="btn btn-warning">Place Order</a>
								</div>
							</div>
						</div>
					</s:if>
					<s:else>

						<div class="modal-footer">
							<s:set name="checkDeleteDisplay" scope="session" value="false" />
							<s:set name="checkDisplay" scope="session" value="false" />
							<div align="center">
								<b> There are no items in this cart.</b>
								<div class="row-fluid">
									<div align="center" class="span12">
										<a href="home" class="btn btn-primary">Continue Shopping</a>

									</div>
								</div>
							</div>
						</div>
					</s:else>
				</div>
			</form>
		</div>
</body>
</html>