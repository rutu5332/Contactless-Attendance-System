<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="IndiaNIC">

<title>Smart Office</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/plugins/social-buttons.css" rel="stylesheet">


<!-- MetisMenu CSS -->
<link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Timeline CSS -->
<link href="css/plugins/timeline.css" rel="stylesheet">

<!-- Custom CSS -->

<link href="css/index.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/plugins/social-buttons.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/smartech.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Animate CSS -->
<link href="css/animate.css" rel="stylesheet">


<style>
#post-social-1 {
	background-image: url('img/image-8.jpg');
}

#post-social-2 {
	background-image: url('img/image-1.jpg');
}

#post-social-3 {
	background-image: url('img/image-3.jpg');
}

#post-social-4 {
	background-image: url('img/image-4.jpg');
}

#post-social-5 {
	background-image: url('img/image-5.jpg');
}

#post-social-6 {
	background-image: url('img/image-6.jpg');
}

#post-social-7 {
	background-image: url('img/image-7.jpg');
}

#post-social-8 {
	background-image: url('img/image-2.jpg');
}
</style>

</head>

<body onload="nxt()">
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="page-wrapper">
			<div style="height:110vh">
				<div class="box2">
					<div class="slider" id="slide"></div>

					<button id="prew" onclick="prew()"> < </button>
					<button id="nxt" onclick="nxt()">></button>
				</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-body">
									Smart office Limited <br>
									A-102, XYZ Complex,<br>
									near bus stand, Naranpura,<br>
									Ahmedabad-382265<br>
									
									<br> 
									
									<a href="mailto:contactless2021@gmail.com"> <i class="fa fa-envelope-open"></i>
									contactless2021@gmail.com</a><br><br>
									<i class="fa fa-phone"></i> +123 99659856
								</div>
								<div class="panel-footer">
									<a class="btn btn-block"> All the rigths are reserved to
										smart office </a>
								</div>
							</div>
						</div>
					</div>
				
			</div>
		</div>
	</div>
	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/plugins/metisMenu/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/demo/dashboard.js"></script>

	<!-- Masonry JavaScript -->
	<script src="js/plugins/masonry/masonry.js"></script>

	<!-- Sparkline JavaScript -->
	<script src="js/plugins/sparkline/sparkline.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/smartech.js"></script>

	<script src="js/demo/index.js"></script>
</body>
</html>
