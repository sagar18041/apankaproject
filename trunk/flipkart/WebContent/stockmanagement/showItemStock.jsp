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


</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span6 offset1">

				<s:if test="hasActionErrors()">
					<br />
					<s:iterator value="actionErrors">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<s:property />
						</div>
					</s:iterator>
				</s:if>

				<s:if test="itemsBelowThreshold.size()!=0">
					<br />
					<br />
					<br />
					<div align="center">
						<font size="5" face="Georgia"><b>Items below Re-order
								Level</b></font> <br /> <br />
					</div>
					<br />

					<s:form action="orderitemstock" theme="simple" method="post">

						<!-- display existing items  -->
						<table class="table table-bordered" id="results">
							<tr>
								<th style="text-align: center">Select</th>
								<th style="text-align: center">Item Name</th>
								<th style="text-align: center">Available Quantity</th>

							</tr>

							<s:iterator value="itemsBelowThreshold">

								<tr>
									<td style="text-align: left"><s:checkbox name="checkItems"
											fieldValue="%{itemID}" value="%{itemID in checkItems}" /></td>
									<td style="text-align: center"><s:property
											value="itemName" /></td>
									<td style="text-align: center"><span style="color: red"><s:property
												value="availableQuantity" /></span></td>
								</tr>

							</s:iterator>
						</table>

						<div id="pageNavPosition" align="center"></div>

						<s:if test="sellers.size()!=0">
							<br />
							<div align="left">
								<font size="3" face="Georgia"><b>Select a Seller</b></font> <br />
								<br />
							</div>


							<s:radio theme="simple" name="checkedSeller" list="sellers" listKey="sellerID"
								listValue="sellerName" />
								
						</s:if>
						<s:elseif test="sellers.size()==0">
							<br />
							<br />
							<br />
							<div class="alert alert-info" align="center">

								<button type="button" class="close" data-dismiss="alert"></button>
								<font size="3" color="orange"><b>Currently there are
										no sellers.</b></font>
							</div>
						</s:elseif>

						<!-- 'Submit' button -->
						<s:submit cssClass="btn btn-primary" value="REORDER" align="left" />
					</s:form>

				</s:if>

				<s:elseif test="itemsBelowThreshold.size()==0">
					<br />
					<br />
					<br />
					<div class="alert alert-info" align="center">

						<button type="button" class="close" data-dismiss="alert"></button>
						<font size="3" color="orange"><b>There are no items
								below the reorder-level.</b></font>

					</div>
				</s:elseif>

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