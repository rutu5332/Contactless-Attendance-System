<%@page import="Database.Data"%>

<!DOCTYPE html>
<html>
<head>



<title>SmartOffice</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link href="css/myprofile.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link href="css/updateprofile.css" rel="stylesheet">
<link href="css/changepswd.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/plugins/social-buttons.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/smartech.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="css/bootstrap.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

</head>

<body style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
<%
	if (session.getAttribute("userEmail") == null)
		response.sendRedirect("../login.jsp");
	else{
		int t = Integer.parseInt(session.getAttribute("userType").toString());
		if (t != 2)
			response.sendRedirect("../login.jsp");
	}
%>
	<br>
	<br>
	<%
	
	String mail="";
	if (session.getAttribute("userEmail") != null)
		mail=session.getAttribute("userEmail").toString(); 
	
	String fnm="",lnm="",id="",mno="",des="",img="../images/";

	//if(uid==null)
	//{
		//response.sendRedirect("login.jsp");
	//}
	Data dt =new Data();
	try
	{
		dt.st=dt.cn.createStatement();
        String select="select * from user where email='"+mail+"' ";
       
        dt.rs=dt.st.executeQuery(select);
        
        while(dt.rs.next())
        {
	        img+=dt.rs.getString("id")+"-1.jpg";
	        fnm=dt.rs.getString("fname");
	        lnm=dt.rs.getString("lname");
	        id=dt.rs.getString("id");
	        mno=dt.rs.getString("mobileNo");
	        des=dt.rs.getString("designation");
        }
        
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	

%>
	<div id="popup1" class="overlay">
		<div class="popup">
			<a class="close" href="#" style="background-color: salmon">&times;</a>
			<div id="dialog" class="window">

				<div class="box">
					<div class="newletter-title">
						<h2 style="color: #ef4238;">Change Profile Picture</h2>
					</div>
					<div class="box-content newleter-content">

						<div id="frm_subscribe">
							<form name="changeImg" id="changeImg" method="post"
								action="../changeImage" enctype="multipart/form-data">
								<div >
									<br><br>
									<input type=hidden name="uid" id="uid" value=<%=id %>>
									<div class="row mb-3" style="display: initial;">
												<div class="col-sm-10" style="text-align:center;">
													<h3 class="mb-0" >Select Image</h3>
												</div><br><br><br><br>
												<div class="col-sm-10 text-secondary">
													<input type="file" class="form-control"
														 name="img1" id="img1">
													<span id="img1-error" style="color:red; font-size:12px;"></span>
												</div>
											</div>
									
											<br><br>
									<div id="notification"></div>
									<br> <input type="submit" onclick="checkJS()"
										class="button" value="SUBMIT"
										style="background-color: #fff; color: #ef4238; 
										font-weight: bolder; height: 40px; width: 120px;">
										<br><br><br>
								</div>
							</form>

						</div>
						<!-- /#frm_subscribe -->
					</div>
					<!-- /.box-content -->
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="main-body">
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<br> <img src="<%=img %>" alt="Admin"
									class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>
										<%out.println(fnm ); %>
									</h4>

									<br>
									
									<button class="b1 btn btn-primary"
										onclick="location.href ='#popup1' ">Change Profile
										Picture</button>
									<br> <br>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<h5 class="mb-0">EmployeeId</h5>
								</div>
								<div class="col-sm-9 text-secondary">
									<%out.println(id); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h5 class="mb-0">Full Name</h5>
								</div>
								<div class="col-sm-9 text-secondary">
									<%out.println(fnm+" "+lnm); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h5 class="mb-0">Email</h5>
								</div>
								<div class="col-sm-9 text-secondary">
									<%out.println(mail); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h5 class="mb-0">Designation</h5>
								</div>
								<div class="col-sm-9 text-secondary">
									<%out.println(des); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h5 class="mb-0">Mobile</h5>
								</div>
								<div class="col-sm-9 text-secondary">
									<%out.println(mno); %>
								</div>
							</div>

							<hr>
							<div class="row">
								<div class="col-sm-12">

									<button class="btn btn-primary"
										onclick="location.href ='updateprofile.jsp'">UpdateProfile</button>
									<button class="btn btn-primary"
										onclick="location.href ='monthlyattendance.jsp'">Monthly
										Attendance</button>
								</div>
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
	<script>

function checkJS()
{
	var img=$('#img1').val();
	var ext=img.substr(img.indexOf('.')+1);
	if(img == ""){
		$("#img1-error").html("* Please Select Image.");
		$('#img1').css('border', '1px solid red');
		changeImg.img1.focus();
		return false;
	}
	else if(!(ext == "jpeg" || ext == "jpg" )){
		$("#img1-error").html("* Please Select jpeg/jpg Images.");
		$('#img1').css('border', '1px solid red');
		changeImg.img1.focus();
		return false;
	}
	else{
		$('#img1-error').html('');
		$('#img1').css('border-color', '');
	}
}
</script>
</body>
</html>