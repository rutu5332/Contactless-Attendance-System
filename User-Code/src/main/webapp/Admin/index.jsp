<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Database.Data"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="IndiaNIC">

<title>Admin</title>
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

<!-- Timeline CSS -->
<link href="css/plugins/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/smartech.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">

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

<body>
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
		<% Data dt=new Data();
		 	dt.st =dt.cn.createStatement();
		 	String sql = "select count(id) from user where type = 2";
		 	dt.rs = dt.st.executeQuery(sql);
		 	int oa=0,emp=0;
		 	while(dt.rs.next()){
		 		oa=Integer.parseInt(dt.rs.getString(1));
		 	}
		 	dt.st.close();
		 	dt.st =dt.cn.createStatement();
		 	sql = "select * from user where type = 3";
		 	dt.rs = dt.st.executeQuery(sql);
		 	while(dt.rs.next()){
		 		emp++;
		 	}
		 	dt.st.close();
		 	
		 	Calendar cal = Calendar.getInstance();
			int yr=cal.get(Calendar.YEAR);
		 	dt.st =dt.cn.createStatement();
		 	sql ="select presence,Emp_No,working_days from monthrecords where year = " +yr;
		 	dt.rs = dt.st.executeQuery(sql);
		 	String mPre="";
		 	int p;
		 	while(dt.rs.next()){
		 		String tmp=dt.rs.getString("Emp_No");
				//p=Integer.parseInt(tmp) *30;
				p=Integer.parseInt(tmp) * Integer.parseInt(dt.rs.getString("working_days"));
		 		tmp=dt.rs.getString("presence");
		 		int x = Integer.parseInt(tmp) *100;
		 		p=x/p;
		 		mPre += p + "/";
		 		
		 	}
		 %>

		<div id="page-wrapper">
			<div>
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb text-xs">
							<li><a href="#">Home</a></li>
							<li class="active">Dash Board</li>
							<li class="pull-right"><a href="AddUser.jsp"
								style="background-color: #ef4238; color: white; text-decoration: none; padding: 5px;">
									ADD USER </a></li>
						</ol>
					</div>
				</div>

				<input type="hidden" id="pre" value=<%out.println(mPre); %>>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div id="maingraph"></div>
							</div>
							<div class="panel-footer">
								<a class="btn btn-block"> Yearly Attendance Chart - <%=yr %>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="panel panel-default  box-white panel-status">
							<div class="panel-body padding-none">
								<a href="OfficeAdmin.jsp">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-desktop fa-5x panel-status-icon"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge"><%=oa %></div>
											<div class="text-uppercase text-xs">Office Admin</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="panel panel-default box-white panel-status panel-info">
							<div class="panel-body padding-none">
								<a href="Employees.jsp">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-user fa-5x panel-status-icon"></i>
										</div>
										<div class="col-xs-9 text-right text-info">
											<div class="huge"><%=emp %></div>
											<div class="text-uppercase text-xs">Employees</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div
							class="panel panel-default  box-white panel-status panel-warning">
							<div class="panel-body padding-none">
								<a href="Attendance.jsp">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-bar-chart-o fa-5x panel-status-icon"></i>
										</div>
										<div class="col-xs-9 text-right text-warning">
											<div class="huge">
												<% out.println(new SimpleDateFormat("MMM").format(cal.getTime()));
													out.println(cal.get(Calendar.DATE));%>
											</div>
											<div class="text-uppercase text-xs">Attendance</div>
										</div>

									</div>
								</a>
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
