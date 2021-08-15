
<!DOCTYPE html>
<html>
<head>
<title>Add User</title>

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link href="css/addUser.css" rel="stylesheet">
<!--  <link href="css/changepswd.css" rel="stylesheet"> -->

<script src="js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Poppins"
	rel="stylesheet">

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/plugins/social-buttons.css" rel="stylesheet">
<link href="css/smartech.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
</head>
<body
	style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<%
			if(session.getAttribute("userEmail") == null){
				response.sendRedirect("../login.jsp");
			}
			else{
				int t=Integer.parseInt(session.getAttribute("userType").toString());
				if(t != 1)
					response.sendRedirect("../login.jsp");
			}
	
		%>
		<div id="outer-box">
			<div class="container">
				<div class="main-body">
					<div class="container" id="show">
						<div class="row gutters-sm">
						<h1 class="form-heading">ADD USER</h1>
							<div class="col-md-4 mb-3">
								<img src="img/add.png" alt="image"
									style="height: 100%; width: 100%" /><br>
								
							</div>
							
							<div class="col-lg-8">
								
								<div class="card">
									<div class="card-body">
									 <!--  Add User Form -->
										<form action="../AddUser" method="post" name="AddUserForm" enctype="multipart/form-data">
											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">User Type</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<select class="form-control" id="user" name="user">
														<option value="0">-- Select --</option>
														<option value="1">Super Admin</option>
														<option value="2">Office Admin</option>
														<option value="3">Employee</option>
													</select>
													<span id="user-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>

											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">First Name</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="First Name *" name="fname" id="fname">
													<span id="fname-error" style="color:red; font-size:12px;"></span>
												</div>
												
											</div>

											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Last Name</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="Last Name *" name="lname" id="lname">
													<span id="lname-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>
											
											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Gender</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<label style="font-size:15px;font-weight:normal;">Male</label>
													<input type="radio" name="gen" id="gen" value="M">
													<label style="font-size:15px;font-weight:normal;">Female</label>
													<input type="radio" name="gen" id="gen" value="F">
													<span id="gen-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>

											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Email</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="john@example.com" name="email" id="email">
													<span id="email-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>

											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Mobile</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="text" class="form-control"
														placeholder="+91 9999999999" name="mob" id="mob">
													<span id="mob-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>
											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Designation</h5>
												</div>
												<div class="col-sm-9 text-secondary" >
													<select class="form-control" id="des" name="des">
														<option value="">-- Select --</option>
														<option value="Manager">Manager</option>
														<option value="Sales Person">Sales Person</option>
														<option value="Project Manager">Project Manager</option>
														<option value="Developer">Developer</option>
														<option value="HR">HR</option>
														<option value="Admin">Admin</option>
														<option value="Office Admin">Office Admin</option>
													</select>
													<span id="des-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>
											
											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Image1</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control"
														 name="img1" id="img1">
													<span id="img1-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>
											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Image2</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control"
														 name="img2" id="img2">
													<span id="img1-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>
											<div class="row mb-3" style="display: initial;">
												<div class="col-sm-3">
													<h5 class="mb-0">Image3</h5>
												</div>
												<div class="col-sm-9 text-secondary">
													<input type="file" class="form-control"
														 name="img3" id="img3">
													<span id="img1-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>

											<div class="row" style="display: initial;">
												<div class="col-sm-3"></div>
												<div class="col-sm-9 text-secondary">
													<input type="submit" class="btn btn-primary px-4"
														value="Submit" id="addUser">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

 <script src="js/adduser.js"> </script> 

</html>