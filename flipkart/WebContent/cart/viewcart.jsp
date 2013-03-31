<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	/* alert(y); */
	document.getElementById(x).style.display='block';
	document.getElementById(y).style.display='none';
	
	}
	function update(x,y)
	{
	
		var z = document.getElementById(y).value;
		window.location = "updateCart?itemID=" + x +"&newQuantity=" + z;
		/* alert(z);  */
	}
	
	setTimeout(function() {
	    $('#mydiv').fadeOut('slow');
	}, 10000);
	
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<div class="container-fluid" id="panel"
		style="background-image: url(ViewResources/img/paperfiber.png); width: 1300px; height: 500px; margin-left: -20px;">
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<div align="center">
			<font style="font-size: 35px; color: red;"></font>
		</div>

		<form name="myForm">
			<div id="ritumodal" class="ritumodal hide fade">
				<div class="modal-header">

					<h3 id="myModalLabel">
						<i class="icon-shopping-cart icon-large"></i> <b>Cart (<s:property
								value="%{cartCount}" />)
						</b>
					</h3>
				</div>
				<%-- <s:property value="%{#session.checkDisplay}" /> --%>
				
				<s:set name="count" value="%{cartCount}"/>
				<s:if test="%{#count>0}">

					<%-- <s:set name="checkDelete" value="%{#session.checkDeleteDisplay}" /> --%>
					<s:if test="%{#checkDelete=='true'}">
						<div style="background-color: #FDF7DF; height: 50px;" id="mydiv">
							The item <b><s:property value="movedToWishlistName" /></b> has
							been moved deleted from your cart. </br>Your cart has
							<s:property value="%{cartCount}" />
							items now.
						</div>
						<s:set name="checkDeleteDisplay" scope="session" value="false" />
					</s:if>

					<s:set name="check" value="%{#session.checkDisplay}" />
					<s:if test="%{#check=='true'}">
						<div style="background-color: #FDF7DF; height: 50px;" id="mydiv">
							The item <b><s:property value="movedToWishlistName" /></b> has
							been moved to your WishList.</br> Your cart has
							<s:property value="%{cartCount}" />
							items now.
						</div>
						<s:set name="checkDisplay" scope="session" value="false" />
					</s:if>

					<div STYLE="height: 300px; overflow: auto;">
						<br />
						<table class="table table-striped table-hover ">
							<tr>
								<th style="text-align: center"></th>
								<th style="text-align: center">Item Description</th>
								<th style="text-align: center">Delivery Time</th>
								<th style="text-align: center">Price</th>
								<th style="text-align: center">Qty</th>
								<th style="text-align: center">Subtotal</th>
								<th></th>

							</tr>
							<s:iterator value="cartItems" status="i">
								<tr>
									<td style="text-align: center"><img
										src="images/<s:property
										value="%{imgURL}" />"
										width="100" height="40" /></td>
									<td style="text-align: center"><s:property
											value="%{itemDescription}" /><br /> <font
										style="font-size: 12px;"><a
											href="moveToWishlist?itemID=<s:property value="itemID"/>">Move
												to wishlist</a></font></td>
									<td style="text-align: center"><s:property
											value="%{deliveryTime}" /></td>
									<td style="text-align: center"><s:property
											value="%{price}" /></td>


									<td style="text-align: center">

										<div id="<s:property value="status2" />">
											<s:property value="quantity" />
											<font style="font-size: 12px;"> <a href="#"
												onClick="showTextBox(<s:property value="%{#i.count}" />,<s:property value="%{status2}" />)">Change</a></font>
										</div>

										<div id="<s:property value="%{#i.count}" />"
											style="display: none">
											<input type="text" name="newQuantity"
												id="<s:property value="statusQuantity" />"
												value="<s:property value="quantity"/>"
												style="width: 16px; height: 11px;" /> <font
												style="font-size: 12px;"> <a href="#"
												onClick="update(<s:property value="itemID"/>,<s:property value="statusQuantity" />)">Save</a></font>
										</div>
									</td>


									<td style="text-align: center"><font style="color: red;"><s:property
												value="%{subTotal}" /></font></td>
									<td><a
										href="deleteCart?itemID=<s:property value="itemID"/>"
										style="text-decoration: none;"><i class="icon-remove-sign"></i></a></td>
								</tr>
							</s:iterator>
						</table>
						<br /> <br />

						<div class="row-fluid">
							<div align="left" class="span12">
								Delivery Charge: <font style="color: red;"> <s:property
										value="%{deliveryCharge}" /></font>
							</div>
						</div>


						<div class="row-fluid">
							<div align="right">
								<b>Amount Payable: Rs. <font style="color: red;"><s:property
											value="%{amountPayable}" /></font></b>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<div align="center">

							<div class="row-fluid">
								<div align="left" class="span12">
									<a href="#" class="btn btn-primary">Close and Continue
										Shopping</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="#" class="btn btn-warning">Place Order</a>
								</div>
							</div>
						</div>

					</div>
				</s:if>
				<s:else>
				
				<div class="modal-footer">
						<div align="center">
					<b>	There are no items in this cart.</b>
							<div class="row-fluid">
								<div align="center" class="span12">
									<a href="#" class="btn btn-primary">Continue
										Shopping</a>
									
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