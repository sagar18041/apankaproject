<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">
	function updateQuantityInStock(x, y) {

		var z = document.getElementById(x).value;
		window.location = "updateQuantityInStock?itemID=" + y + "&newQuantity="
				+ z;

	}

	setTimeout(function() {
		$('#mydiv').fadeOut('slow');
	}, 5000);
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<body>
	<div class="span9">

<s:if test="hasActionErrors()">
						<div align="center">
							<s:iterator value="actionErrors">
								<div class="alert alert-info">
									<br /> <i class="icon-remove icon-2x"></i>&nbsp;&nbsp;
									<s:property/>
								</div>
							</s:iterator>

						</div>
					</s:if>

		<table class="table table-striped table-bordered">
			<tr>
				<th style="text-align: left">Item Name</th>
				<th style="text-align: left">Available Quantity</th>
				<th style="text-align: left">Price</th>
				<th style="text-align: left">Edit Quantity</th>
				<th></th>

			</tr>
			<s:iterator value="allItems" status="i">

				<tr>
					<td><s:property value="%{itemName}" /></td>
					<td><s:property value="%{availableQuantity}" /></td>
					<td><s:property value="%{price}" /></td>
					<td><input type="text" name="newQuantity" id="<s:property value="%{#i.count}" />"
						style="width: 45px;" /></td>
					<td><a href="#"
						onclick="updateQuantityInStock(<s:property value="%{#i.count}" />,<s:property value="%{itemID}" />);"
						class="btn">Save</a></td>

				</tr>

			</s:iterator>
		</table>
		<br /> <br /> <a href="home.action" class="btn btn-primary">Go
			To Flipkart Home</a>
	</div>
</body>
</html>