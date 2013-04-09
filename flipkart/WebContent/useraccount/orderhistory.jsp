<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="ViewResources/jQuery/css/smoothness/jquery-ui-1.9.2.custom.css" />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>
<script src="ViewResources/jQuery/js/jquery-ui-1.9.2.custom.js"></script>

<script>
	$(function() {
		$(document).tooltip(
				{
					position : {
						my : "center bottom-20",
						at : "center top",
						using : function(position, feedback) {
							$(this).css(position);
							$("<div>").addClass("arrow").addClass(
									feedback.vertical).addClass(
									feedback.horizontal).appendTo(this);
						}
					}
				});
	});
</script>
<style>
.ui-tooltip,.arrow:after {
	background: white;
	border: 1px solid gray;
}

.ui-tooltip {
	padding: 10px 20px;
	color: black;
	font: bold 14px "Helvetica Neue", Sans-Serif;
	box-shadow: 0 0 4px gray;
}

.arrow {
	width: 70px;
	height: 16px;
	overflow: hidden;
	position: absolute;
	left: 50%;
	margin-left: -35px;
	bottom: -16px;
}

.arrow.top {
	top: -16px;
	bottom: auto;
}

.arrow.left {
	left: 20%;
}

.arrow:after {
	content: "";
	position: absolute;
	left: 20px;
	top: -20px;
	width: 25px;
	height: 25px;
	box-shadow: 6px 5px 9px -9px black;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	tranform: rotate(45deg);
}

.arrow.top:after {
	bottom: -20px;
	top: auto;
}

.orders-table {
	border-collapse: collapse;
	width: 100%;
}

.orders-table th {
	border-bottom: 1px solid #999;
	border-top: 1px solid #999;
	color: #3bb0d7;
	padding: 3px 2px;
}

.orders-table .product-info-header th {
	border: 0;
}

.orders-table .order-item-row td {
	border-bottom: 1px solid #CCC;
	font-size: 11px;
	padding: 4px 2px;
}

.orders-table a,.order_cat_list a {
	text-decoration: none;
}

.orders-table a:hover,.order_cat_list a:hover {
	text-decoration: underline;
}

.orders-table .col-order-no,.orders-table .order-item-row td.order-id {
	padding-left: 1px;
	padding-right: 50px;
}

.orders-table .order-item-row.even {
	background-color: #f2f2f2;
}

.orders-table .order-item-table td {
	border-bottom: 1px dotted #999;
}

.orders-table .order-item-table tr.last td {
	border: 0;
}

.orders-table td.order-id,.orders-table td.order-utils {
	padding-top: 6px;
	vertical-align: top;
}

.orders-table .order-item-table td {
	vertical-align: top;
}
</style>
</head>
<body>


	<div class=container-fluid>
		<ul class="breadcrumb">
			<li><a href="home">Home</a> <span class="divider">></span></li>
			<li><a href="accountpage">My Account</a> <span class="divider">></span></li>
			<li class="active">My Orders</li>
		</ul>
		<div class="row-fluid">
			<div class="span3">
				<div class="acct">
					<!-- changed nav-list -->
					<ul class="nav nav-list">
						<li class="nav-head">&nbsp;My Account</li>
						<li class="nav-heading">&nbsp;&nbsp;Orders</li>
						<li class="dividertop"></li>
						<li class="active"><b>&nbsp;&nbsp;&nbsp;&nbsp;My Orders</b></li>
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
			<div class="span9">
				<h3>My Orders</h3><br/>
				<table class="orders-table" id="orders-table">

					<thead>
						<tr>
							<th width=15% class="col-order-no">Order No.</th>
							<th width=60% colspan=3>
								<table class="product-info-header" width=100%>
									<tr>

										<th width=30%>Products</th>
										<th width=18%>Amount</th>
										<th width=25%>Status</th>
									</tr>
								</table>
							</th>
							<th width=10%></th>
						</tr>
					</thead>

					<tbody>
						<s:iterator value="orderHistory" status="count">
							<s:if test="#count.odd == true">
								<tr class="order-item-row">
									<td width=15%><a href="vieworderdetails?orderNo=<s:property value="key" />"
										title="<b>Date</b>: <s:property value="createdOn"/><br /> <b>Total Amount</b>: Rs. 
										<s:property value="totalPrice"/><br />
										<s:property value="status"/><br />">
											<s:property value="key" />
											
									</a></td>
									<td width=73% colspan=3>
										<table width=100% class="order-item-table">
											<tbody>

												<s:iterator value="value">

													<s:set var="itemnums" value="%{value.size}" />

													<s:if test="%{#itemnums==1}">
														<tr class="last">

															<td width=48% title="<s:property value="itemName" />"><s:property value="itemName" /></td>
															<td width=22%><s:property value="itemPrice" /></td>
															<td width=25%><s:property value="status" /></td>
														</tr>
													</s:if>

													<s:else>
														<tr class="">

															<td width=48%><s:property value="itemName" /></td>
															<td width=22%><s:property value="itemPrice" /></td>
															<td width=25%><s:property value="status" /></td>
														</tr>
													</s:else>

												</s:iterator>
											<tbody>
										</table>
									</td>

									<td width=10% class="order-utils"><a href="vieworderdetails?orderNo=<s:property value="key" />">View
											Details</a></td>
								</tr>
							</s:if>
								
							<s:else>
								<tr class="order-item-row even">
									<td width=15%><a href="vieworderdetails?orderNo=<s:property value="key" />"
										title="<b>Date</b>: <s:property value="createdOn"/><br /> 
										<b>Total Amount</b>: Rs. <s:property value="totalPrice"/><br />
										<s:property value="status"/><br />"><s:property
												value="key" /></a></td>
									<td width=73% colspan=3>
										<table width=100% class="order-item-table">
											<tbody>

												<s:iterator value="value">
													<s:set var="itemnums" value="%{value.size}" />

													<s:if test="%{#itemnums==1}">
														<tr class="last">

															<td width=48%><s:property value="itemName" /></td>
															<td width=22%><s:property value="itemPrice" /></td>
															<td width=25%><s:property value="status" /></td>
														</tr>
													</s:if>

													<s:else>
														<tr class="">

															<td width=48%><s:property value="itemName" /></td>
															<td width=22%><s:property value="itemPrice" /></td>
															<td width=25%><s:property value="status" /></td>
														</tr>
													</s:else>
												</s:iterator>
											<tbody>
										</table>
									</td>

									<td width=10% class="order-utils"><a href="vieworderdetails?orderNo=<s:property value="key" />">View
											Details</a></td>
								</tr>
							</s:else>
							</s:iterator>
					</tbody>
				</table>
			</div>
		</div>

	</div>



</body>
</html>