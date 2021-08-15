<html>
<head>
<title>Smart Office</title>	
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/smartech.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="css/login.css">

<link href="css/plugins/social-buttons.css" rel="stylesheet">
<!-- Custom CSS -->

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
</head>
<body>
		
		<div class="d-flex align-items-center min-vh-100 py-3 py-md-0">
			<div class="container">
				<div class="card login-card">
					<div class="row no-gutters">
						<div class="col-md-5">
							<img src="img/add.png" alt="login" class="login-card-img">
						</div>
						<div class="col-md-7">
							<div class="card-body">
								<div class="brand-wrapper">
									<a href="index.jsp"><img src="img/logo.png" alt="logo" class="logo"></a>
								</div>
								<p class="login-card-description">Sign into your account</p>
								<form action="Login" name="loginform" id="loginform"
									method="post">
									<div class="form-group">

										<input type="email" name="email" id="email"
											class="form-control" placeholder="Email address"> <span
											id="errormail" style="color: red;"></span>
									</div>
									<div class="form-group mb-4">
										<label for="password" class="sr-only">Password</label> <input
											type="password" name="password" id="password"
											class="form-control" placeholder="***********"> <span
											id="errorpswd" style="color: red;"> <%
 						String msg;
 						msg = request.getParameter("msg");
 						if (msg != null) {
 							out.println("<font color=red size=3>" +msg + "</font>");
 						}
 					%>

										</span>
									</div>
									<input name="login" id="login"
										class="btn btn-block login-btn mb-4" type="submit"
										value="Login">
								</form>
								<a href="#" class="forgot-password-link text-reset"
									onclick="myFunction(); return false;">Forgot password?</a>

								<p class="login-card-footer-text"></p>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	


	<script>
		function myFunction() {
			var txt;
			var data = prompt("Please enter your Email:");
			if (data == null || data == "") {
				alert("Please provide proper input");
				return true;
			}
			else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(data)))
			{
				alert("Please provide proper input");
				return true;
			}
			else {
			
				window.location.replace("resetpswd.jsp?val="+data);
			}
			
		}
	</script>

</body>
<script src="js/loginjs.js"></script>
<script src="js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

</html>