<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<!-- ================Custom CSS================ -->
<style type="text/css">
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
</style>

<script>
	$(function() {
		$("#tabs").tabs({
			disabled : [ 1, 2, 3 ]
		});
	});
</script>
</head>
<body>
	<div>
		<div class="span8">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1"><font
							style="font-size: 20px; color: #FFAD00;">1</font>&nbsp;<font
							style="font-size: 12px">Email Login</font></a></li>
					<li><a href="#tabs-2"><font style="font-size: 20px;">2</font>&nbsp;<font
							style="font-size: 12px">Shipping Address</font></a></li>
					<li><a href="#tabs-3"><font style="font-size: 20px;">3</font>&nbsp;<font
							style="font-size: 12px">Order Summary</font></a></li>
					<li><a href="#tabs-4"><font style="font-size: 20px;">4</font>&nbsp;<font
							style="font-size: 12px">Payment Options</font></a></li>
				</ul>
				
				<!-- ================Email Login tab content================ -->
				<div id="tabs-1">
					<p>
						<s:form action="shippingaddress">
							<div class="span0"></div>
							<font style="font-size: 12px"><b>Email Address:</b>&nbsp;
								<s:property value="%{emailID}" /> ( Not You? <a href="#">Logout</a>)<br />
								<div class="span00"></div> Your order details will be sent to
								this email address.</font>
							<br />
							<br />
							<div class="span00"></div>
							<s:submit value="Continue" theme="simple" cssClass="btn btn-warning" />
						</s:form>
					</p>
				</div>
			</div>
			<br /> <br /> <i class="icon-lock"
				style="color: #FFAD00; font-size: 25px;"></i>&nbsp;&nbsp;<font
				style="font-size: 16px; color: #999999;"> Safe and Secure
				Shopping Guarantee</font>
		</div>

		<!-- ================Right-side order summary================ -->
		<div class="custspan2">
			<div class="customdiv">
				<font style="font-size: 14px; margin-left: 10px;"><b>Order
						Summary</b>
					<hr /> Items <font style="margin-left: 68px">:</font>&nbsp;<s:property value="%{noOfItems}" /><br />
					Sub Total <font style="margin-left: 40px">:</font>&nbsp;Rs.&nbsp;<s:property value="%{subTotal}" /><br />
					Amount Payable<font style="margin-left: 2px">:</font>&nbsp;Rs.&nbsp;<s:property value="%{grandTotal}" /></font>
			</div>
		</div>
	</div>
</body>
</html>