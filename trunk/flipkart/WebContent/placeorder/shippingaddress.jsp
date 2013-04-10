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
.verticalLine {
	border-left: 1px solid black;
}

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

div[class="tooltip-inner"] {
	white-space: pre-wrap;
	width: 250px;
/* 	color: #f89406;
 */	font-size: 12px;
}
</style>

<!-- ================JavaScript and JQuery functions================ -->
<script>

	function change(orderType) {
		window.location = "shippingaddress?check=" + orderType;
	}

	$(function() {
		$("#tabs").tabs({
			disabled : [ 2, 3 ],
			selected : 1,
			select : function(event, ui) {
				if (ui.index == 0) {
					window.location = "emaillogin";
				}
			}
		});
	});

	function activateTick(val) {
		m = document.getElementById(val);
		m.innerHTML = 'Click to Select<i class="icon-ok icon-2x" style="float: right; margin-right: 5px; margin-top: -4px; color: #99C11D"></i>';
	}
	
	function deactivateTick(val) {
		m = document.getElementById(val);
		m.innerHTML = 'Click to Select';
	}
	
	function mapItemToAddress(itemid,addrid) {
		var str = document.getElementById('mapping');
		
		 if(str.value.charAt(0) == itemid) {
			var temp = str.value.substring(0, 2)+addrid+str.value.substring(3);
			str.value = temp;
		}else if(str.value.charAt(4) == itemid) {
			var temp = str.value.substring(0, 6)+addrid+str.value.substring(7);
			str.value = temp;
		} else {
			str.value += itemid+'-'+addrid+',';
		} 
		
	}
	
</script>

</head>
<body>
	<div>
		<div class="span8">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1"><font style="font-size: 20px;">1</font>&nbsp;<font
							style="font-size: 12px">Email Login</font></a></li>
					<li><a href="#tabs-2"><font
							style="font-size: 20px; color: #FFAD00;">2</font>&nbsp;<font
							style="font-size: 12px">Shipping Address</font></a></li>
					<li><a href="#tabs-3"><font style="font-size: 20px;">3</font>&nbsp;<font
							style="font-size: 12px">Order Summary</font></a></li>
					<li><a href="#tabs-4"><font style="font-size: 20px;">4</font>&nbsp;<font
							style="font-size: 12px">Payment Options</font></a></li>
				</ul>
				<s:set name="checkContent" value="%{check}" />

				<!-- ================Shipping Address tab content================ -->
				<div id="tabs-2">
					<p>
					<div align="center">

						<!-- ================SOS Checked(by default)================ -->
						<s:if test="%{#checkContent==0}">
							<div class="btn-group" data-toggle="buttons-radio">

								<button type="button" class="btn btn-large active"
									name="shippingorder" onclick="change(0)"
									style="vertical-align: middle; margin-top: -2px;">
									Single Order Shipping (SOS)</button>
								<button type="button" class="btn btn-large" name="shippingorder"
									onclick="change(1)"
									style="vertical-align: middle; margin-top: -2px;">Multiple
									Order Shipping (MOS)</button>
							</div>
						</s:if>

						<!-- ================MOS Checked(if clicked)================ -->
						<s:if test="%{#checkContent==1}">
							<div class="btn-group" data-toggle="buttons-radio">

								<button type="button" class="btn btn-large" name="shippingorder"
									onclick="change(0)"
									style="vertical-align: middle; margin-top: -2px;">
									Single Order Shipping (SOS)</button>
								<button type="button" class="btn btn-large active"
									name="shippingorder" onclick="change(1)"
									style="vertical-align: middle; margin-top: -2px;">Multiple
									Order Shipping (MOS)</button>
							</div>
						</s:if>
					</div>

					<hr />
					<br />

					<s:form action="ordersummary">

						<!-- ================SOS Content================ -->
						<s:if test="%{#checkContent==0}">

							<!-- ===========Check if no existing addresses exist=========== -->
							<s:set var="addrnums" value="%{existingAddrList.size}" />
							<s:if test="%{#addrnums == 0}">
								<font style="font-size: 14px; margin-left: 200px;">Enter
									a new shipping addresses</font>
								<br />
								<br />
							</s:if>
							<s:elseif test="#addrnums > 0">
								<font style="font-size: 14px; margin-left: -10px">Select
									from previous shipping addresses</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>OR</b>&nbsp;&nbsp;&nbsp;&nbsp;<font
									style="font-size: 14px">Enter a new shipping addresses</font>
							</s:elseif>

							<div class="row-fluid">

								<!-- ================Display existing addresses================ -->

								<s:if test="%{#addrnums > 0}">
									<div class="span4">
										<font style="font-size: 12px"><s:iterator
												value="addressList" status="tick">
												<a
													href="ordersummary?addressid=<s:property value="addressID" />"
													style="text-decoration: none">
													<div class="customdiv2"
														onload="deactivateTick(<s:property value="#tick.count" />)"
														onmouseover="activateTick(<s:property value="#tick.count" />)"
														onmouseout="deactivateTick(<s:property value="#tick.count" />)">
														<b><s:property value="name" /></b><br />
														<s:property value="streetAddress" />
														<s:property value="landmark" />
														<br />
														<s:property value="city" />
														<br />
														<s:property value="stateName" />
														<br />
														<s:property value="pincode" />
														<br />
														<s:property value="phoneNumber" />
														<br />
														<h5 class="customnav"
															id="<s:property value="#tick.count"/>">Click to
															Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</h5>
													</div> <br />
												</a>
											</s:iterator> </font>
									</div>
									<div
										style="width: 1px; height: 700px; background-color: #000000; float: left; margin-left: 100px; margin-top: 20px"></div>
								</s:if>
								<s:else>
									<div class="span3"></div>
								</s:else>
								<div class="span6">

									<s:if test="hasActionErrors()">
										<s:iterator value="actionErrors">
											<br />
											<div class="alert alert-danger">
												<s:property />
											</div>
											<br />
										</s:iterator>
									</s:if>

									<!-- ================Display shipping address form================ -->
									<table class="table">
										<tr>
											<td><font style="font-size: 12px;">Name</font>&nbsp;<font
												style="color: #ff0000;">*</font></td>
											<td><s:textfield name="shippingName"
													style="font-size: 12px" /></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">Address</font>&nbsp;<font
												style="color: #ff0000;">*</font></td>
											<td><s:textarea name="shippingAddr" rows="4"
													style="resize: none; font-size: 12px;" /><font
												style="font-size: 12px; color: #999999"><br />You
													have 216 characters left</font></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">Landmark</font></td>
											<td><s:textfield name="shippingLm"
													style="font-size: 12px" /></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">City</font>&nbsp;<font
												style="color: #ff0000;">*</font></td>
											<td><s:textfield name="shippingCity"
													style="font-size: 12px" /></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">State</font>&nbsp;<font
												style="color: #ff0000;">*</font></td>
											<td><s:select name="shippingState" list="stateList"
													headerKey="-1" headerValue="--Select State--"
													style="font-size: 12px" /></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">Country</font></td>
											<td><font style="font-size: 12px; font-weight: bold;">India</font>&nbsp;<font
												style="font-size: 12px; color: #999999">(Service
													available only in India)</font></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">Pincode</font>&nbsp;<font
												style="color: #ff0000;">*</font></td>
											<td><s:textfield name="shippingCode"
													style="font-size: 12px" /></td>
										</tr>
										<tr>
											<td><font style="font-size: 12px;">Phone</font>&nbsp;<font
												style="color: #ff0000;">*</font></td>
											<td><s:textfield name="shippingPhone"
													style="font-size: 12px" /></td>
										</tr>
									</table>

									<s:submit value="     Save & Continue     " theme="simple"
										style="margin-left: 100px" name="sosBtn"
										cssClass="btn btn-warning btn-large" />

								</div>
							</div>
						</s:if>

						<!-- ================MOS Content================ -->
						<s:elseif test="%{#checkContent==1}">

							<table class="table table-bordered">
								<s:iterator value="cartList" status="prodTick">
									<tr>
										<td style="width: 50%;"><s:property
												value="itemDescription" /></td>
										<td>
											<div class="btn-group" data-toggle="buttons-radio">
												<s:iterator value="existingAddrList" status="addrTick">
													<s:if test="#addrTick.count == 3">
														<button type="button" class="btn btn-large"
															onclick="mapItemToAddress(<s:property value="#prodTick.count" />,<s:property value="#addrTick.count" />)"
															name="<s:property value="#prodTick.count" />"
															style="vertical-align: middle; margin-top: -2px;">
															<a href="#" data-placement="right" data-toggle="tooltip"
																rel="tooltip" title="<s:property />"
																style="text-decoration: none;">Address <s:property
																	value="#addrTick.count" /></a>
														</button>
														<br />
													</s:if>
													<s:else>
														<button type="button" class="btn btn-large"
															onclick="mapItemToAddress(<s:property value="#prodTick.count" />,<s:property value="#addrTick.count" />)"
															name="<s:property value="#prodTick.count" />"
															style="vertical-align: middle; margin-top: -2px;">
															<a href="#" data-placement="right" data-toggle="tooltip"
																rel="tooltip" title="<s:property />"
																style="text-decoration: none;">Address <s:property
																	value="#addrTick.count" /></a>
														</button>

													</s:else>
												</s:iterator>
											</div>

										</td>
									</tr>

								</s:iterator>

							</table>
							<input type="hidden" id="mapping" name="mapping" value="" /><br />
							<s:submit value="     Save & Continue     " theme="simple"
								name="mosBtn" style="margin-left: 500px"
								cssClass="btn btn-warning btn-large" />

						</s:elseif>
					</s:form>
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
<script type="text/javascript">
    $(function () {
        $("[rel='tooltip']").tooltip();
    });

   /*  $(function () {
    $('.nav-tabs').button();
	
    }); */
	
   
	

	
</script>
</html>