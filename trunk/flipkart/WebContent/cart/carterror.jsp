<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
jQuery(document).ready(function($) {
    $('#myModal').modal({
    	'show':true,
    	'backdrop'  : 'static'
    
    });
    
});

  </script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<div class="container-fluid" id="panel"
		style="background-image: url(ViewResources/img/paperfiber.png); width: 1300px; height: 500px">
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<div align="center">
			<font style="font-size: 35px; color: red;">Some error has occured !!!</font>
		</div>

		<form name="myForm">
			<div id="myModal" class="modal hide fade" class="span9">
				<div class="modal-header">

					<h3 id="myModalLabel">
						<s:property value="userName" />
					</h3>
				</div>

				<div style="padding-left: 20px; padding-right: 10px">
					<br /> Oops !!! Looks like you are not a registered user. Please
					sign in or Register to continue. Happy Shopping !!! <br /> 
					 <br />

				</div>

				<div class="modal-footer">
					<div align="center">

						<div class="span2">
							<a href="home"
							class="btn btn-small btn-primary">Return to home</a>
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>

</body>
</html>