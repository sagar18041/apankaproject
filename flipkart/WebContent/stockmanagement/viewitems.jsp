<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script type="text/javascript">
setTimeout(function() {
	    $('#mydiv').fadeOut('slow');
	}, 3000);
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<body>
	<div class="span9">


		<s:set name="itemNameUpdated" value="%{itemNameUpdated}" />
		<s:if test="%{itemNameUpdated != null}">

			<div id="mydiv" align="center" class="alert alert-info">
				The quantity of item <b><s:property value="%{itemNameUpdated}" /></b>
				has been updated.
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
					<td><input type="text" name="newQuantity" style="width: 45px;" /></td>
					<td><a
						href="updateQuantityInStock?itemID=<s:property value="itemID"/>&itemNameUpdated=<s:property value="%{itemName}" />"
						class="btn">Save</a></td>
				</tr>

			</s:iterator>
		</table>
	</div>
</body>
</html>