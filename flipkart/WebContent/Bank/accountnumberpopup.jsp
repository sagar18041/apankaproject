<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Account Number</title>
<script type="text/javascript">
	function show() {
		document.getElementById('result').style.display = "block";
	}
	function hide() {
		var accountSelected = '${accountSelected}';
		if (accountSelected != 1) {
			document.getElementById('result').style.display = "none";
		}
	}
</script>
</head>
<body onload="hide()">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span10 offset1">

				<s:form class="form-inline" action="searchAction">
					<table>
						<tr>
							<td><input type="text" class="input-large"
								placeholder="Account Number" name=accountNumber></td>
							<td valign="top"><button type="submit"
									class="btn btn-primary" onclick="show()">Search</button></td>
						</tr>
					</table>
				</s:form>

				<div id="result">

					<s:if test="searchList.size()!=0">

						<table
							class="table-bank table-bank-bordered table-bank-condensed table-bank-hover table-bank-striped"
							id="results">
							<tr>
								<th style="text-align: center"><font size="3"
									face="Georgia">Customer Name</font></th>
								<th style="text-align: center"><font size="3"
									face="Georgia">Account Number</font></th>
								<th style="text-align: center"><font size="3"
									face="Georgia">Select</font></th>
							</tr>
							<s:iterator value="searchList">
								<tr>
									<td style="text-align: center"><s:property
											value="customerName" /></td>
									<td style="text-align: center"><s:property
											value="accountNumber" /></td>
									<td style="text-align: center"><a
										href="selectAction?accountNumber=<s:property
									value="accountNumber" />">
											<i><img src="ViewResources/img/selectIcon.png"
												height="20" width="20" /></i>
									</a></td>
								</tr>
							</s:iterator>
						</table>

						<div id="pageNavPosition" align="center"></div>

					</s:if>

					<s:if test="searchList.size()==0">
						<br />
						<br />
						<br />
						<div class="alert alert-info" align="center">

							<button type="button" class="close" data-dismiss="alert"></button>
							<font size="5" face="Gerogia" color="orange"><b>Sorry!
									No records found.</b></font>

						</div>
					</s:if>

					<br />

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var pager = new Pager('results', 10);
		pager.init();
		pager.showPageNav('pager', 'pageNavPosition');
		pager.showPage(1);
	</script>
	<br />
	<br />
	<br />

</body>
</html>