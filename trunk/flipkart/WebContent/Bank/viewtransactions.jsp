<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<br />

	<div class="container-fluid">

		<div class="row-fluid">

			<div class="span10 offset1">

				<div align="center">
					<font size="5" face="Georgia"><b>Transactions</b></font> <br /> <br />
				</div>
				<br />

				<table
					class="table table-bordered table-condensed table-hover-aamir table-aamir"
					id="results">

					<tr>
						<th style="text-align: center"><font size="3" face="Georgia">TransactionID</font></th>

						<th style="text-align: center"><font size="3" face="Georgia">CustomerID</font></th>

						<th style="text-align: center"><font size="3" face="Georgia">OrderID</font></th>

						<th style="text-align: center"><font size="3" face="Georgia">Transaction
								Time</font></th>

						<th style="text-align: center"><font size="3" face="Georgia">Amount</font></th>

						<th style="text-align: center"><font size="3" face="Georgia">Payment
								Mode</font></th>

					</tr>

					<s:iterator value="transactionList">

						<tr>

							<td style="text-align: center"><s:property
									value="transactionID" /></td>

							<td style="text-align: center"><s:property
									value="customerID" /></td>

							<td style="text-align: center"><s:property value="orderID" /></td>

							<td style="text-align: center"><s:property
									value="transactionTime" /></td>

							<td style="text-align: center"><s:property value="amount" /></td>

							<td style="text-align: center"><s:property
									value="paymentType" /></td>

						</tr>

					</s:iterator>

				</table>

				<div id="pageNavPosition" align="center"></div>

				<br />

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