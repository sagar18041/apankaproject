<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.customdiv {
	border-top: 1px solid #999999;
	border-right: 1px solid #999999;
	border-bottom: 1px solid #999999;
	border-left: 1px solid #999999;
	border-radius: 3px;
	padding: 10px;
	box-shadow: 2px 2px 5px #999999;
	width: 40%;
}

.bpadding20 {
	padding-bottom: 20px;
}

.tpadding30 {
	padding-top: 30px;
}

.main-order-status-table {
	font-size: 12px;
	font-weight: normal;
	font-family: tahoma, verdana, arial, sans-serif;
}

.main-order-status-table .details-table {
	border: 0 solid #ccc;
	border-width: 1px 0;
}

.bmargin15 {
	margin-bottom: 15px;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

.order-details-table tr.caption,.order-details-MP .order-details-table tr.total-row
	{
	border: solid 1px #CCC;
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#e8e8e8) );
	background: -moz-linear-gradient(top, #f5f5f5, #e8e8e8);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f5f5f5,
		endColorstr=#E8E8E8 );
}

.order_item_row_0 {
	font-weight: bold;
	border-bottom: 1px solid #ccc;
}

.order_item_row_1 {
	background-color: #f3f5f7;
	color: #333;
	border-bottom: 1px solid #ccc;
}

.order_item_row_2 {
	color: #333;
	border-bottom: 1px solid #ccc;
}

.order-details-table tr th,.order-details-MP .order-details-table tr td
	{
	padding: 10px;
	border-bottom: solid 1px #c5c5c5;
}

.order_item_row_1 td,.order_item_row_2 td {
	padding: 10px 0;
}

.order_item_row_1 td,.order_item_row_2 td {
	font-size: 11px;
}

.it_nowrap {
	white-space: nowrap;
}

ol,ul {
	list-style: none;
}

.order_item_row_4 {
	font-size: 11px;
	font-weight: normal;
	color: #333;
}

.order-details-table tr.total-row {
	border: solid 1px #CCC;
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5),
		to(#e8e8e8) );
	background: -moz-linear-gradient(top, #f5f5f5, #e8e8e8);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f5f5f5,
		endColorstr=#E8E8E8 );
}

.order-details-table tr.total-row td,.order-details-table tr.other-charges td
	{
	text-align: right;
}

.order-details-table tr.caption th,.order-details-table tr.total-row td,
.order-details-table tr.order_item_row_0 td,.order-details-table tr.order_item_row_4 td
	{
	padding: 5px;
}

.hrclass {
	clear: both;
	margin: 7px 0 7px 0;
	display: block;
}
</style>
</head>
<body>
	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li><a href="accountpage">My Account</a> <span class="divider">></span></li>
			<li><a href="vieworders">My Orders</a> <span class="divider">></span></li>
			<li class="active"><s:property value="order.orderNumber" /></li>
			<li class="pull-right"><a href="javascript:;"
				onclick="window.print(); return false;" alt="Print this page"><span
					class="print"></span><b><i class="icon-print"></i>&nbsp;Print</b></a></li>
		</ul>

		<div class="customdiv">
			<div class="row-fluid">
				<div class="span6">
					<font style="font-size: 17px; font-family: Georgia;">Order
						Summary</font> <br />
					<hr style="color: #000000; border-style: outset;" />
					<hr
						style="color: #000000; border-style: outset; margin-top: -18px;" />
					<s:property value="order.totalItems" />
					Items <br />
					<hr style="background-color: #999999" class="hrclass" />
					<font style="font-size: 12px; color: #999999">Order ID:</font>&nbsp;
					<s:property value="order.orderNumber" />
					<br />
					<hr style="background-color: #999999" />
					<font style="font-size: 12px; color: #999999">Date:</font>&nbsp;
					<s:property value="order.createdOn" />
					<br />
					<hr style="background-color: #999999" />
					<font style="font-size: 12px; color: #999999">Total:</font>&nbsp;Rs.&nbsp;
					<b><s:property value="order.totalPrice" /></b> <br />
					<hr style="background-color: #999999" />
					<s:property value="order.status" />
					<br /> <br />

				</div>
				<div
					style="width: 1px; height: 330px; background-color: #000000; float: left; margin-left: 15px;"></div>

				<div class="span5">
					<font style="font-size: 17px; font-family: Georgia;">Shipping
						Address</font> <br />
					<hr style="color: #000000; border-style: outset;" />
					<hr
						style="color: #000000; border-style: outset; margin-top: -18px;" />
					<font style="font-size: 13px;"> <s:property
							value="order.name" /> <br />
						<hr style="background-color: #999999" class="hrclass" /> <s:property
							value="order.address.streetAddress" /><br /> <s:property
							value="order.address.landmark" /> <s:property
							value="order.address.city" /> <br /> <s:property
							value="order.address.stateName" /> <br /> <s:property
							value="order.address.pincode" />
						<hr style="background-color: #999999" class="hrclass" /> <s:property
							value="order.phoneNumber" />
					</font>
				</div>
			</div>
		</div>

		<div class="main-order-status-table tpadding30 bpadding20">
			<table cellspacing="0" cellpadding="0" width="100%" align="left"
				class="order-details-table details-table bmargin15">

				<tbody>
					<tr class="caption">
						<th colspan="2" align="left">Order ID: <a
							href="vieworderdetails?orderNo=<s:property value="order.orderNumber" />"><s:property
									value="order.orderNumber" /></a>
						</th>
						<th colspan="6" align="right">Total Items: (<s:property
								value="order.totalItems" /> Items)
						</th>
					</tr>

					<tr class="order_item_row_0" align="left">
						<td width="8%" align="center">Type</td>
						<td width="32%" align="left">Item Description</td>
						<td width="20%" align="center">Order Status</td>
						<td width="25%" align="right">Price</td>
						<td width="5%" align="center">Qty.</td>
						<td align="left">Subtotal</td>
						<td width="10%" align="center">Action</td>
					</tr>

					<!-- List of items to display -->
					<s:iterator value="products" status="count">
						<s:if test="#count.odd == true">
							<tr class="order_item_row_1" align="left">
								<td valign="top" align="center" rowspan="1"><s:property
										value="type" /></td>
								<td valign="top"><a href="displayitem.action?itemID=<s:property
										value="itemID" />" target="__blank"><s:property
											value="itemName" /></a></td>
								<td valign="top" align="center" class="it_nowrap "><s:property
										value="status" /></td>
								<td valign="top" align="right" class="it_nowrap "><s:property
										value="itemPrice" /></td>
								<td valign="top" align="center" class="it_nowrap "><s:property
										value="quantity" /></td>
								<td valign="top" align="right" class="it_nowrap "><s:property
										value="totalPrice" /></td>

								<td align="center" valign="bottom" class="cancel-cell"
									rowspan="1">
									<ul>
										<!-- Review product link -->
										<li class="bmargin5"><a href="#"
											title="Review this product">Review Product</a></li>
										<!--  Cancel link -->

									</ul>
								</td>

							</tr>
						</s:if>
						<s:else>
							<tr class="order_item_row_2" align="left">
								<td valign="top" align="center" rowspan="1"><s:property
										value="type" /></td>
								<td valign="top"><a href="displayitem.action?itemID=<s:property
										value="itemID" />"  target="__blank"><s:property
											value="itemName" /></a></td>
								<td valign="top" align="center" class="it_nowrap "><s:property
										value="status" /></td>
								<td valign="top" align="right" class="it_nowrap "><s:property
										value="itemPrice" /></td>
								<td valign="top" align="center" class="it_nowrap "><s:property
										value="quantity" /></td>
								<td valign="top" align="right" class="it_nowrap "><s:property
										value="totalPrice" /></td>

								<td align="center" valign="bottom" class="cancel-cell"
									rowspan="1">
									<ul>
										<!-- Review product link -->
										<li class="bmargin5"><a href="#"
											title="Review this product">Review Product</a></li>
									</ul>
								</td>
							</tr>
						</s:else>
					</s:iterator>


					<!-- Row for shipping charge -->
					<tr class="order_item_row_4">
						<td colspan="3" align="left"></td>
						<td colspan="2" align="right">Shipping</td>
						<td colspan="1" align="right"><span
							style="color: red; font-weight: bold;"> <s:set var="price"
									value="%{order.shippingCharge}" /> <s:if test="#price=='FREE'">
									<s:property value="order.shippingCharge" />
								</s:if> <s:else>
								Rs. <s:property value="order.shippingCharge" />
								</s:else>
						</span></td>
						<td>&nbsp;</td>
					</tr>

					<!-- Total -->
					<tr class="total-row">
						<td colspan="5"><font size="3px"><b>Total</b></font></td>
						<td colspan="2" style="text-align: left; color: #CC0000;"><font
							size="3px"><b>&nbsp;Rs. <s:property
										value="order.totalPrice" /></b></font></td>
					</tr>

				</tbody>
			</table>

		</div>
	</div>

</body>
</html>