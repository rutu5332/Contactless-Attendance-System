<%@page import="Database.Data"%>
<!DOCTYPE html>
<html>
<head>
<title>SmartOffice</title>

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
<body style="font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<br>
	<br>
<%
	if (session.getAttribute("userEmail") == null)
		response.sendRedirect("../login.jsp");
	else{
		int t = Integer.parseInt(session.getAttribute("userType").toString());
		if (t != 2)
			response.sendRedirect("../login.jsp");
	}
%>
	<div id="popup1" class="overlay">
		<%
	
	String mail=(String)session.getAttribute("userEmail"); 
	
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
        img+= dt.rs.getString("id")+"-1.jpg";
        fnm=dt.rs.getString("fname");
        lnm=dt.rs.getString("lname");
        id=dt.rs.getString("id");
        mno=dt.rs.getString("mobileNo");
        des=dt.rs.getString("designation");
        }
        
	}
	catch(Exception ex)
	{
		
	}
	

%>

		<div class="popup">
			<a class="close" href="#" style="background-color: salmon">&times;</a>
			<div id="dialog" class="window">

				<div class="box">
					<div class="newletter-title">
						<h2 style="color: #ef4238;">Change your password</h2>
					</div>
					<div class="box-content newleter-content">

						<div id="frm_subscribe">
							<form name="subscribe" id="subscribe_popup" method="post"
								action="changepswd.jsp">
								<div>

									<input type="password" name="oldpsw" id="oldpsw"
										placeholder="old password"> <br>
									<span id="errorold" style="color: red;"> <%
                            							String msg;
                            							msg=request.getParameter("msg");
					                            		if(msg!=null)
					                            		{
					                            			out.write("<script>");
					                            			   out.write("alert(\"Please do again..Old Password is incorrect" + "\")");
					                            			   out.write("</script>"); 
					                            		}
					                            		%>
									</span> <br>
									<input type="password" name="password" id="password"
										placeholder="new password"><br> <span
										id="errorpswd" style="color: red;"></span> <br>
									<input type="password" name="cpassword" id="cpassword"
										placeholder="confirm password"><br> <span
										id="errorcpsw" style="color: red;"></span>

									<div id="notification"></div>
									<br>
									<input type="button" onclick="checkJS()" class="button"
										value="SUBMIT"
										style="background-color: #fff; color: #ef4238; font-weight: bolder; height: 40px; width: 120px;">

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
			<div class="container" id="show">
				<div class="row gutters-sm">
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<div class="d-flex flex-column align-items-center text-center">
									<br> <img src="<%=img %>" alt="Admin"
										class="rounded-circle" width="150">
									<div class="mt-3">
										<h4>
											<%out.println(fnm); %>
										</h4>

										<br>
										
									</div>
								</div>
							</div>
						</div>

					</div>

					<form class="col-lg-8" method="post" action="updatedetails.jsp"
						name="update">
						<div class="card">
							<div class="card-body">
								<div class="row mb-3" style="display: initial;">
									<div class="col-sm-3">
										<h5 class="mb-0">First Name</h5>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="fname" id="fname"
											class="form-control" value="<%out.println(fnm); %>">
										<span id="fnm"></span>
									</div>
								</div>

								<div class="row mb-3" style="display: initial;">
									<div class="col-sm-3">
										<h5 class="mb-0">Last Name</h5>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="lname" id="lname"
											class="form-control" value="<%out.println(lnm); %>">
										<span id="lnm"></span>
									</div>
								</div>

								<%-- <div class="row mb-3" style="display: initial;">
									<div class="col-sm-3">
										<h5 class="mb-0">Email</h5>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="mail" id="mail" class="form-control"
											value="<%out.println(mail); %>"> <span id="mail"></span>
									</div>
								</div> --%>
								<input type="hidden" name="mail" id="mail" class="form-control"
											value="<%out.println(mail); %>">
								<div class="row mb-3" style="display: initial;">
									<div class="col-sm-3">
										<h5 class="mb-0">Designation</h5>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="des" id="des" class="form-control"
											value="<%out.println(des);%>"> <span id="des"></span>
									</div>
								</div>
								<div class="row mb-3" style="display: initial;">
									<div class="col-sm-3">
										<h5 class="mb-0">Mobile</h5>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="mno" id="mno" class="form-control"
											value="<%out.println(mno);%>"> <span id="mno"></span>
									</div>
								</div>

								<a class="btn btn-primary skip" href="#popup1"
									style="padding: 1px 1px; color: red; background-color: white; border-color: white; font-family: poppins; color: black; margin: 3% 27%; display: inline-block;">change
									password?</a>


								<div class="row" style="display: initial;">
									<div class="col-sm-3"></div>
									<div class="col-sm-9 text-secondary">
										<button type="submit" id="changes"
											class="btn btn-primary px-4">Save Changes</button>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
<script src="js/updateprofile.js"></script>
<script>

function checkJS()
{
	
	
					var code=$("#oldpsw").val();
					var npsw=$("#password").val();
					var cpsw=$("#cpassword").val();
					var re = /[0-9]+/;
					var re2 = /[a-z]+/;
					var re3 = /[A-Z]+/;
					
					 if(code==''){
						$('#errorold').html('please enter old password');
						subscribe.oldpsw.focus();
						return false;
					}
					 else
						{
							$('#errorold').html('');
						}
					 
					 if(npsw==''){
							$('#errorpswd').html('please enter new password');
							subscribe.password.focus();
							return false;
						}
					else if((npsw.length)<8)
					{
						$('#errorpswd').html('minimum 8 characters required');
						subscribe.password.focus();
						return false;
					}
				   	else if(!re.test(npsw)) 
				  	{
				   		$('#errorpswd').html('at least one number(0-9) required');
					        subscribe.password.focus();
					        return false;
			    	}
				      	
				      	
				    else if(!re2.test(npsw)) 
				  	{
				    	$('#errorpswd').html('at least one lowercase letter(a-z) required');
				    	subscribe.password.focus();
					        return false;
					 }
				      	
				    else if(!re3.test(subscribe.password.value)) 
				  	{
				    	$('#errorpswd').html('at least one uppercase letter(A-Z) required');
				    	subscribe.password.focus();
				        	return false;
			    	}
					else
					{
						$('#errorpswd').html('');
					}
					 
					if(cpsw=='')
					{
						$('#errorcpsw').html('please enter confirm password');
						subscribe.cpassword.focus();
						return false;
					}
					else if(npsw!=cpsw)
					{
						$('#errorcpsw').html("password mismatch");
						subscribe.cpassword.focus();
						return false;
					}
					else
					{
						$('#errorcpsw').html('');
					}
					

						//var url="..\assets\index2.jsp";
						window.location.href="changepswd.jsp?oldpsw="+code+"&password="+cpsw;					
						//window.location.assign(" changepswd.jsp");
						
				
					
				

}

</script>

</html>