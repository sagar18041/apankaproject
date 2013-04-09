<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
.span0 {
	width: 40px;
}

.span00 {
	width: 148px;
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
/* Vertical Tabs
----------------------------------*/
.ui-tabs-vertical {
	width: 55em;
}

.ui-tabs-vertical>.ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 12em;
}

.ui-tabs-vertical>.ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical>.ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical>.ui-tabs-nav li.ui-tabs-selected {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
	border-right-width: 1px;
}

.ui-tabs-vertical>.ui-tabs-panel {
	padding: 1em;
	float: right;
	width: 32em;
}
</style>

<script>
	$(function() {
		$("#subTab").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#subTab > ul > li").removeClass("ui-corner-top").addClass(
				"ui-corner-left");
		$("#mainTab").tabs({
			selected : 3,
			select : function(event, ui) {
				if (ui.index == 0) {
					window.location = "emaillogin";
				} else if (ui.index == 1) {
					window.location = "shippingaddress";
				} else if (ui.index == 2) {
					var addr = $("#addressid").val();
					window.location = "ordersummary?addressid="+addr;
				}
			}
		});
	});
</script>


</head>
<body>
	<div class="row-fluid">
		<div class="span8">
			<div id="mainTab">
				<ul>
					<li><a href="#tabs-1"><font style="font-size: 20px;">1</font>&nbsp;<font
							style="font-size: 12px">Email Login</font></a></li>
					<li><a href="#tabs-2"><font style="font-size: 20px;">2</font>&nbsp;<font
							style="font-size: 12px">Shipping Address</font></a></li>
					<li><a href="#tabs-3"><font style="font-size: 20px;">3</font>&nbsp;<font
							style="font-size: 12px">Order Summary</font></a></li>
					<li><a href="#tabs-4"><font
							style="font-size: 20px; color: #FFAD00;">4</font>&nbsp;<font
							style="font-size: 12px">Payment Options</font></a></li>
				</ul>
				<div id="tabs-4">
					<p>
						<font style="font-size: 16px;">Choose your mode of payment</font><br />
						<br />
					<div id="subTab"
						style="margin-left: -20px; margin-top: -20px; width: 104%">
						<ul>
							<li><a href="#tabs-a">Credit Card</a></li>
							<li><a href="#tabs-b">Debit Card</a></li>
							<li><a href="#tabs-c">Net Banking</a></li>
						</ul>
						<div id="tabs-a">
							Pay using Credit Card
							<hr />
							<h5>Enter your card details</h5>
							<s:form action="post" method="ccEntry" theme="simple">
								<s:hidden name="addressid" id="addressid" value="%{addressid}" />

								<table cellpadding="5">
									<tr>
										<td>Card Number</td>
										<td><s:textfield required="true" label="cardNumber" /></td>
									</tr>

									<tr>
										<td>Name on Card</td>
										<td><s:textfield required="true" label="nameCard" /></td>
									</tr>

									<tr>
										<td>Expiry Date</td>
										<td>
											<div>
												<s:select label="Select a month" headerKey="-1"
													headerValue="Select Month"
													list="#{'1':'Jan', '2':'Feb', '3':'Mar', '4':'Apr' , '5':'May' , '6':'Jun','7':'Jul','8':'Aug','9':'Sep','10':'Oct','11':'Nov','12':'Dec'}"
													name="month" cssStyle="width:160px;" />
												/
												<s:select label="Select a year" headerKey="-1"
													headerValue="Select Year"
													list="#{'1':'2013', '2':'2014', '3':'2015', '4':'2016' , '5':'2017' , '6':'2018','7':'2019','8':'2020','9':'2021','10':'2022','11':'2023','12':'2024'}"
													name="year" cssStyle="width:140px;" />
											</div>
										</td>
									</tr>

									<tr>
										<td>CVV No</td>
										<td><s:textfield required="true" label="cvv" size="3"
												cssStyle="width:37px;" /></td>
									</tr>
								</table>
								<s:submit value="Pay" cssClass="btn btn-primary"
									cssStyle="margin-left:380px;" />
							</s:form>
						</div>
						<div id="tabs-b">
							Pay using Debit Card
							<hr />
							<h5>Enter your card details</h5>
							<s:form action="post" method="dbEntry" theme="simple">
								<table cellpadding="5">
									<tr>
										<td>Card Number</td>
										<td><s:textfield required="true" label="cardNumber" /></td>
									</tr>

									<tr>
										<td>Name on Card</td>
										<td><s:textfield required="true" label="nameCard" /></td>
									</tr>

									<tr>
										<td>Expiry Date</td>
										<td>
											<div>
												<s:select label="Select a month" headerKey="-1"
													headerValue="Select Month"
													list="#{'1':'Jan', '2':'Feb', '3':'Mar', '4':'Apr' , '5':'May' , '6':'Jun','7':'Jul','8':'Aug','9':'Sep','10':'Oct','11':'Nov','12':'Dec'}"
													name="month" cssStyle="width:160px;" />
												/
												<s:select label="Select a year" headerKey="-1"
													headerValue="Select Year"
													list="#{'1':'2013', '2':'2014', '3':'2015', '4':'2016' , '5':'2017' , '6':'2018','7':'2019','8':'2020','9':'2021','10':'2022','11':'2023','12':'2024'}"
													name="year" cssStyle="width:140px;" />
											</div>
										</td>
									</tr>

									<tr>
										<td>CVV No</td>
										<td><s:textfield required="true" label="cvv" size="3"
												cssStyle="width:37px;" /></td>
									</tr>
								</table>
								<s:submit value="Pay" cssClass="btn btn-primary"
									cssStyle="margin-left:380px;" />
							</s:form>
						</div>
						<div id="tabs-c">
							Pay using Net Banking
							<hr />
							<s:form theme="simple">
								<table>
									<tr>
										<td width="160px">Choose your Bank</td>
										<td><s:select label="Bank Name" headerKey="-1"
												headerValue="Choose Bank"
												list="#{'1':'ICICI', '2':'HDFC', '3':'Punjab National Bank', '4':'State Bank of India'}"
												name="bank" cssStyle="width:200px;" /></td>
									</tr>
									<tr>
										<td colspan="2"><span><font color="#aaa"
												size="2px"><b>Note: </b>After clicking on the "Pay"
													button, you will be directed to a secure gateway for
													payment. After completing the payment process, you will be
													redirected back to Flipkart.com to view details of your
													order.</font></span></td>
									</tr>
								</table>

								<s:submit value="Pay" cssClass="btn btn-primary"
									cssStyle="margin-left:400px;margin-top:20px;" />
							</s:form>
						</div>
					</div>
					</p>


				</div>
			</div>

			<br /> <br /> <i class="icon-lock"
				style="color: #FFAD00; font-size: 25px;"></i>&nbsp;&nbsp;<font
				style="font-size: 16px; color: #999999;"> Safe and Secure
				Shopping Guarantee</font>
		</div>

		<div class="span3">
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