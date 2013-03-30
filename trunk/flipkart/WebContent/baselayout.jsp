<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="Team 404">
<meta name="keywords" content="shopping">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel='shortcut icon' href='ViewResources/img/favicon.ico' />
<link rel="stylesheet"
	href="ViewResources/jQuery/css/smoothness/jquery-ui-1.9.2.custom.css" />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>
<script src="ViewResources/jQuery/js/jquery-ui-1.9.2.custom.js"></script>
<script src="ViewResources/js/bootstrap.js"></script>
<link href="ViewResources/css/bootstrap.css" rel="stylesheet">
<link href="ViewResources/css/font-awesome.css" rel="stylesheet">

<title><tiles:insertAttribute name="title" ignore="true" /></title>
<style>
#subheading {
	-moz-border-radius-topleft: 5px;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>

<script>
	function GetCurrentPageName() {
		var PageURL = document.location.href;
		var PageName = PageURL.substring(PageURL.lastIndexOf('/') + 1);

		return PageName;
	}

	$(document).ready(function() {
		var CurrPage = GetCurrentPageName();
		console.log(CurrPage);

		switch (CurrPage) {
		case 'home':
			$('#li_home').addClass('active');
			break;
		case 'accountPage':
			$('#li_account').addClass('active');
			break;
		case 'passwordPage':
			$('#li_account').addClass('active');
			break;
		}
	});
</script>
</head>
<body>

	<div
		style="background: rgb(0, 35, 50); background: -moz-linear-gradient(top, rgba(0, 35, 50, 1) 0%, rgba(0, 83, 115, 1) 15%, rgba(0, 85, 119, 1) 50%, rgba(0, 83, 115, 1) 50%, rgba(0, 83, 115, 1) 76%, rgba(0, 47, 60, 1) 100% ); background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 35, 50, 1) ), color-stop(15%, rgba(0, 83, 115, 1) ), color-stop(50%, rgba(0, 85, 119, 1) ), color-stop(50%, rgba(0, 83, 115, 1) ), color-stop(76%, rgba(0, 83, 115, 1) ), color-stop(100%, rgba(0, 47, 60, 1) ) );">

		<div class="container" style="width: 900;">
			<tiles:insertAttribute name="header" />
		</div>
		<hr size="6" color="#C8EBF7" />
	</div>
	<div class="container">
		<tiles:insertAttribute name="body" />


		<hr />
	</div>
	<div class="container">
		<hr />
	</div>
	<div class="container">
		<tiles:insertAttribute name="footer" />
	</div>
</body>

</html>