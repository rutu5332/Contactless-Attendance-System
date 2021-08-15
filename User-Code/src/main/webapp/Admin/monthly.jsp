<%@page import="Database.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Alex Grozav">

<title>Attendance</title>

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/smartech.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Animate CSS -->
<link href="css/animate.css" rel="stylesheet">

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
		<%
		int monthNumber = Integer.parseInt(request.getParameter("month"));
		int yr = Integer.parseInt(request.getParameter("year"));
		%>
		
		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-calendar"></i>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<li>&nbsp;&nbsp;&nbsp;<b> Month</b> </li><li class="divider"></li>
										<li><a href="monthly.jsp?month=1&year=<%=yr%>">Jan</a></li>
										<li><a href="monthly.jsp?month=2&year=<%=yr%>">Feb</a></li>
										<li><a href="monthly.jsp?month=3&year=<%=yr%>">Mar</a></li>
										<li><a href="monthly.jsp?month=4&year=<%=yr%>">Apr</a></li>
										<li><a href="monthly.jsp?month=5&year=<%=yr%>">May</a></li>
										<li><a href="monthly.jsp?month=6&year=<%=yr%>">Jun</a></li>
										<li><a href="monthly.jsp?month=7&year=<%=yr%>">Jul</a></li>
										<li><a href="monthly.jsp?month=8&year=<%=yr%>">Aug</a></li>
										<li><a href="monthly.jsp?month=9&year=<%=yr%>">Sep</a></li>
										<li><a href="monthly.jsp?month=10&year=<%=yr%>">Oct</a></li>
										<li><a href="monthly.jsp?month=11&year=<%=yr%>">Nov</a></li>
										<li><a href="monthly.jsp?month=12&year=<%=yr%>">Dec</a></li>
									</ul>
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-calendar-o"></i>
									</button>
									<ul class="dropdown-menu pull-right" role="menu">
										<%Calendar cal = Calendar.getInstance();
										int y=cal.get(Calendar.YEAR); %>
										<li>&nbsp;&nbsp;&nbsp; <b>YEAR</b></li><li class="divider"></li>
										<li><a href="monthly.jsp?month=<%=monthNumber%>&year=<%=y%>"><%=y%></a></li>
										<li><a href="monthly.jsp?month=<%=monthNumber%>&year=<%=y-1 %>"><%=y-1 %></a></li>
										<li><a href="monthly.jsp?month=<%=monthNumber%>&year=<%=y-2 %>"><%=y-2 %></a></li>
										<li><a href="monthly.jsp?month=<%=monthNumber%>&year=<%=y-3 %>"><%=y-3 %></a></li>
										<li><a href="monthly.jsp?month=<%=monthNumber%>&year=<%=y-4 %>"><%=y-4 %></a></li>
									</ul>
								</div>
							</div>
							<h4 class="margin-none">
								<i class="fa fa-desktop fa-fw"></i>
								<%out.println(Month.of(monthNumber).name()); %>
								<%=yr %>'s Attendance Details
							</h4>

						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table" id="dataTables-example"
									style="text-align: center;">
									<thead>
										<tr>
											<th style="text-align: center;">#</th>
											<th style="text-align: center;">Image</th>
											<th style="text-align: center;">Name</th>
											<th style="text-align: center;">Designation</th>
											<th style="text-align: center;">Date</th>
											<th style="text-align: center;">In Time</th>
											<th style="text-align: center;">Out Time</th>
										</tr>
									</thead>
									<tbody>
										<%
											Data dt = new Data();
											dt.st = dt.cn.createStatement();
											LocalDate monthBegin = LocalDate.of(yr, monthNumber, 1);
											LocalDate monthEnd = monthBegin.plusMonths(1).withDayOfMonth(1).minusDays(1);
											String sql = "select * from attendance a inner join user u on a.uid = u.id where attdate >= '"+monthBegin;
											sql+= "' and attdate <='"+ monthEnd+ "'";
											dt.rs = dt.st.executeQuery(sql);
											String img;
											int i = 1;
											while (dt.rs.next()) {
												
													out.println("<tr> <td>" + i++ + "</td>");
													img= "../images\\"+dt.rs.getString("id") + "-1.jpg";
													out.println("<td> <img src=' " +img+ "' style=\"height:25px;width:30px;\"></td>");
													out.println("<td>" + dt.rs.getString("fname") + " " + dt.rs.getString("lname") + "</td>");
													out.println("<td>" + dt.rs.getString("designation") + "</td>");
													out.println("<td>" + dt.rs.getString("attdate") + "</td>");
													out.println("<td>" + dt.rs.getString("inTime") + "</td>");
													out.println("<td>" + (dt.rs.getString("outTime") == null ? "-" : dt.rs.getString("outTime"))
															+ "</td> </tr>");
												

											}
											dt.st.close();
											dt.cn.close();
											dt.rs.close();
										%>

									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
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

	<!-- DataTables JavaScript -->
	<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- Sparkline JavaScript -->
	<script src="js/plugins/sparkline/sparkline.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/smartech.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
</body>


</html>