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

	$(function() {
		$("#options").tabs({
			disabled : [ 0, 1 ]
		});
	});

	function show() {
		document.getElementById('newdetail').style.display = "block";
		document.getElementById('addRow').style.display = "none";
	}

	function hide() {

		document.getElementById('newdetail').style.display = "none";
		document.getElementById('addRow').style.display = "block";
	}

	function showSuccessMsg() {
		window.location = "adminsuccessproduct";
	}

	function Validator() {

		var level = /^[0-2]$/;

		if (myform.attribute.value == "") {
			alert("Please enter attribute name.");
			myform.attribute.focus();
			return (false);
		}

		if (myform.value.value == "") {
			alert("Please enter attribute value.");
			myform.value.focus();
			return (false);
		}

		if (myform.priorityLevel.value == "") {
			alert("Please enter a priority.");
			myform.priorityLevel.focus();
			return (false);
		}

		if (!(myform.priorityLevel.value.match(level))) {

			alert("Priority can be 0, 1 or 2 only.");
			myform.priorityLevel.focus();
			return (false);

		}

		return (true);
	}
</script>
</head>
<body onload="hide()">

	<div class="container-fluid">
		<div class="row-fluid">

			<div class="span6 offset1">

				<br />

				<table class="table table-bordered">
					<tr>
						<td style="text-align: center"><font style="font-size: 28px;">
								<b>Item Name :</b> <s:property value="selectedItemName" />
						</font></td>
					</tr>
				</table>
				<br /> <br />

				<p>
					<b></b>
					<s:label value="NOTE:" />
					</b> <br />
					<s:label
						value="Kindly enter following three attributes (<b>mandatory</b>):" />

					<s:label
						value="Delivery Time (level-0), Warranty Details (level-1), Price (level-2)" />
				</p>

				<br />
				<s:if test="existingAttributeList.size()!=0">
					<br />
					<br />
					<br />
					<div align="center">
						<font size="5" face="Georgia"><b>Item Attributes</b></font> <br />
						<br />
					</div>
					<br />

					<!-- display existing items  -->

					<table class="table table-bordered" id="results">
						<tr>
							<th style="text-align: center">Attribute Name</th>
							<th style="text-align: center">Attribute Value</th>
							<th style="text-align: center">Priority Level</th>
							<th style="text-align: center">Delete</th>

						</tr>
						<s:iterator value="existingAttributeList">

							<tr>
								<td style="text-align: center"><s:property
										value="attribute" /></td>
								<td style="text-align: center"><s:property value="value" /></td>
								<td style="text-align: center"><s:property
										value="priorityLevel" /></td>
								<td style="text-align: center"><a
									href="admindeleteitemattributes?attribute=<s:property value="attribute"/>">
										<i class="icon-trash"></i>
								</a></td>
							</tr>

						</s:iterator>
					</table>

					<div id="pageNavPosition" align="center"></div>
				</s:if>

				<s:if test="existingAttributeList.size()==0">
					<br />
					<br />
					<br />
					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="3" color="orange"><b>Currently there are no
								attributes in the database for this item.</b></font>

					</div>
				</s:if>

				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>

				<div align="left">
					<form action="admininsertitemattributes" class="form-inline"
						id="newdetail" name="myform" onsubmit="return Validator()">

						<input type="text" placeholder="Attribute Name" name="attribute"
							style="width: 140px"> <input type="text"
							placeholder="Attribute Value" name="value" style="width: 140px">
						<input type="number" placeholder="Priority Level"
							name="priorityLevel" min="0" max="2" style="width: 70px">

						<button type="submit" class="btn btn-small">Save</button>
						<a href="#" class="btn btn-small btn-danger" onclick="hide()">
							Cancel</a>
					</form>
				</div>
				<button class="btn btn-small btn-primary pull-right" type="button"
					onclick="show()" id="addRow">Add Attribute</button>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		var pager = new Pager('results', 5);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		pager.showPage(1);
	</script>
	<br />
	<br />
	<br />
</body>
</html>