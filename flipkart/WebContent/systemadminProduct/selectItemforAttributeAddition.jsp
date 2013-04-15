<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript">
	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});

	function onItemChange() {
		var cat = document.getElementById("item");
		var itemId = cat[cat.selectedIndex].value;
		if(itemId != -1){
			
			window.location="adminstoreitemforattribute?selectedItemID="+ cat[cat.selectedIndex].value;
		}
		else{
			cat.selectedIndex=-1;
			alert("Please select an Item.");	
		}
	}
	
</script>
</head>
<body onload="hide()">

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="span6 offset1">
				<br /> <br /> <font size="5" face="Georgia"><b>Choose
						Item</b></font> <br /> <br />

				<div class="input-prepend">
					<span class="add-on"> <i class="icon-shopping-cart"
						style="color: black;"> </i>
					</span>
					<s:select list="itemList" headerKey="-1" headerValue="Choose Item"
						id="item" name="itemName" theme="simple" cssClass="chzn-select"
						title="Choose Item" style="width:257px" onchange="onItemChange()" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>