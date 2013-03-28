<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Twitter Bootstrap Modals Example</title>
<meta name="description"
	content="Creating Modal Window with Twitter Bootstrap">
<link
	href="/twitter-bootstrap/twitter-bootstrap-v2/docs/assets/css/bootstrap.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2>Example of creating Modals with Twitter Bootstrap</h2>
		<div id="example" class="modal hide fade in" style="display: none;">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">�</a>
				<h3>This is a Modal Heading</h3>
			</div>
			<div class="modal-body">
				<h4>Text in a modal</h4>
				<p>You can add some text here.</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn btn-success">Call to action</a> <a href="#"
					class="btn" data-dismiss="modal">Close</a>
			</div>
		</div>
		<p>
			<a data-toggle="modal" href="#example"
				class="btn btn-primary btn-large">Launch demo modal</a>
		</p>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script
		src="/twitter-bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>
</body>
</html>
