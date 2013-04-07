<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
.spanmin {
	width: 4px;
}

.span0 {
	width: 40px;
}

.span00 {
	width: 148px;
}

.custspan2 {
	width: 200px;
}

.customdiv {
	border-top: 1px solid #999999;
	border-right: 1px solid #999999;
	border-bottom: 1px solid #999999;
	border-left: 1px solid #999999;
	border-radius: 3px;
	margin-left: -20px;
	padding: 10px;
}

.customdiv2 { /* 	display: inline-block;
	*display: inline;
	float: left; */
	/* width: 150px; */
	border-top: 2px solid #999999;
	border-right: 2px solid #999999;
	border-bottom: 2px solid #999999;
	border-left: 2px solid #999999;
	border-radius: 3px;
	margin-left: 10px;
	margin-top: 5px;
	padding: 7px;
}

.customnav {
	color: #ffffff;
	width: 105%;
	background-color: #DDD9D1;
	margin-bottom: -7px;
	margin-left: -7px;
	padding: 2px;
	text-shadow: 0 1px 0 #000000;
}

.input-myText {
	width: 5px;
	min-height: 30px;
}

.ritumodal {
	position: fixed;
	top: 50%;
	left: 41%;
	z-index: 1050;
	width: 800px;
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
	$(function() {
		$("#tabs").tabs({
			disabled : [ 3 ],
			selected : 2,
			select : function(event, ui) {
				if (ui.index == 0) {
					window.location = "emaillogin";
				} else if (ui.index == 1) {
					window.location = "shippingaddress";
				}
			}
		});
	});
</script>

</head>
<body>
	<div>
		<div class="span8">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1"><font style="font-size: 20px;">1</font>&nbsp;<font
							style="font-size: 12px">Email Login</font></a></li>
					<li><a href="#tabs-2"><font style="font-size: 20px;">2</font>&nbsp;<font
							style="font-size: 12px">Shipping Address</font></a></li>
					<li><a href="#tabs-3"><font
							style="font-size: 20px; color: #FFAD00;">3</font>&nbsp;<font
							style="font-size: 12px">Order Summary</font></a></li>
					<li><a href="#tabs-4"><font style="font-size: 20px;">4</font>&nbsp;<font
							style="font-size: 12px">Payment Options</font></a></li>
				</ul>
				<div id="tabs-3">
					<p>
					<div align="left">
						<font style="font-size: 18px; font-family: Georgia;">Review
							your Order</font>
					</div>
					<br />
					<form name="myForm" action="payment">
						<div>
							<table class="table table-striped table-hover ">
								<tr>
									<td style="text-align: center"><font
										style="font-size: 13px; font-weight: bold;">Type</font></td>
									<td style="text-align: center"><font
										style="font-size: 13px; font-weight: bold;">Item
											Description</font></td>
									<td style="text-align: center"><font
										style="font-size: 13px; font-weight: bold;">Delivery
											Time</font></td>
									<td style="text-align: center"><font
										style="font-size: 13px; font-weight: bold;">Price</font></td>
									<td style="text-align: center"><font
										style="font-size: 13px; font-weight: bold;">Qty.</font></td>
									<td style="text-align: center"><font
										style="font-size: 13px; font-weight: bold;">Subtotal</font></td>
									<th></th>
								</tr>
								<s:iterator value="cartList" status="i">
									<tr>
										<td style="text-align: center">type</td>
										<td style="text-align: center"><s:property
												value="%{itemDescription}" /></td>
										<td style="text-align: center"><s:property
												value="%{deliveryTime}" /></td>
										<td style="text-align: center">Rs.&nbsp;<s:property
												value="%{price}" /></td>
										<td style="text-align: center"><s:property value="1" /></td>

										<td style="text-align: center">Rs.&nbsp;<s:property
												value="%{subTotal}" /></td>
										<td><a href="#" style="text-decoration: none;"><i
												class="icon-remove-sign"></i></a></td>
									</tr>
								</s:iterator>
							</table>
							<br /> <br />
							<hr style="height:1px; background-color: #999999; color: #999999"/>

							<div class="row-fluid">
								<div>
									<b style="margin-left: 350px;">Amount Payable </b><b
										style="margin-left: 110px;">Rs.&nbsp;<s:property
											value="%{amountPayable}" /></font></b>
								</div>
							</div>
							<hr style="height:1px; background-color: #999999; color: #999999"/>
							<br />
							<div class="row-fluid">
								<font style="font-size: 12px; font-family: Georgia;">Order
									Confirmation email alert to</font><font
									style="font-size: 13px; font-family: Georgia; font-style: italic; font-weight: bold;">
									<s:property value="%{emailID}" />
								</font>
								<div align="right">
									<s:submit value="          Continue          " theme="simple"
										style="margin-left: 100px"
										cssClass="btn btn-warning btn-large" />
								</div>
							</div>
						</div>
					</form>
					</p>
				</div>
			</div>
			<br /> <br /> <i class="icon-lock"
				style="color: #FFAD00; font-size: 25px;"></i>&nbsp;&nbsp;<font
				style="font-size: 16px; color: #999999;"> Safe and Secure
				Shopping Guarantee</font>
		</div>

		<div class="custspan2">
			<div class="customdiv">
				<font style="font-size: 14px; margin-left: 10px;"><b>Order
						Summary</b>
					<hr /> Items <font style="margin-left: 50px">:</font>&nbsp;<s:property
						value="%{noOfItems}" /><br /> Sub Total <font
					style="margin-left: 22px">:</font>&nbsp;Rs.&nbsp;<s:property
						value="%{subTotal}" /><br /> Grand Total<font
					style="margin-left: 12px">:</font>&nbsp;Rs.&nbsp;<s:property
						value="%{grandTotal}" /></font>
			</div>
		</div>
	</div>

</body>
</html>
