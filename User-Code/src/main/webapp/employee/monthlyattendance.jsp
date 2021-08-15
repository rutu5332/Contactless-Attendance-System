<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Database.Data"%>
<%@page import="java.time.*" %>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/smartech.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        
        <!-- Animate CSS -->
        <link href="css/animate.css" rel="stylesheet">
        <title>SmartOffice</title>

</head>
<body>

<%
		if(session.getAttribute("userEmail") == null)
			response.sendRedirect("../login.jsp");
		else{
			int t=Integer.parseInt(session.getAttribute("userType").toString());
			if(t != 3)
				response.sendRedirect("../login.jsp");
		}
	%>
<%
	String mail=(String)session.getAttribute("userEmail");
	Data dt = new Data();
	String[] days = new String[12];
	String empID="",sel="";
		
		dt.st = dt.cn.createStatement();
		String q2 = "select id from user where email='"+mail+"' ";
		dt.rs = dt.st.executeQuery(q2);
		
		while(dt.rs.next()){
	 		
	 	empID=(dt.rs.getString("id"));
	 	
		}
		
		
		dt.st.close();
		
		dt.st = dt.cn.createStatement();
		String select = "select working_days from monthrecords";
		dt.rs = dt.st.executeQuery(select);
		int j=0;
		while (dt.rs.next()) {      
		   days[j] = dt.rs.getString("working_days");
	       if(j>0)
		   	sel += days[j-1] + "/";      
	       
		   j++;
		}
		
		for(int i=j-1; i<12 ;i++)
		{
			days[i]="0";
		}
		
		dt.st.close();
		
		Calendar cal = Calendar.getInstance();
		int yr=cal.get(Calendar.YEAR);
		int count=0;
		int month=1;
		
		dt.st=dt.cn.createStatement();
		LocalDate monthBegin = LocalDate.now().withDayOfMonth(1);
		String q4="select count(attdate) AS cnt, MONTH(attdate) AS mon from attendance where uid='"+empID+"' AND YEAR(attdate)='"+yr+"' AND attdate < '"+monthBegin+"' GROUP BY MONTH(attdate) order by MONTH(attdate)";
		dt.rs = dt.st.executeQuery(q4);
			
		
		j=0;
		String mcount="";
		while(dt.rs.next())
		{
			//System.out.println(" Count : "+dt.rs.getString("cnt") + "\tMonth : "+dt.rs.getString("mon"));
			mcount += dt.rs.getString("cnt");
			mcount += "/";
			
		}
		
		
		
	%>

			<input type="hidden" id="att" value=<%out.println(mcount); %> >
			<input type="hidden" id="working" value=<%out.println(sel); %> >
 				<div class="row">
                    <div class="col-lg-12">
                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                
                                <h4 class="margin-none" style="color:#ef4238;">
                                    <i class="fa fa-bar-chart-o fa-fw" ></i> Monthly Attendance
                                </h4>
                                <p class="margin-none text-xs text-muted">About the current year</p>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div id="morris-bar-chart-2"></div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div><br><br>
                <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover table-striped" style=" font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 22px;">
                                                <thead style="color:#ef4238">
                                                    <tr>
                                                        <th style="color:grey;">Month</th>
                                                        <th>January</th>
                                                        <th>February</th>
                                                        <th>March</th>
                                                        <th>April</th>
                                                        <th>May</th>
                                                        <th>June</th>
                                                        <th>July</th>
                                                        <th>August</th>
                                                        <th>September</th>
                                                        <th>October</th>
                                                        <th>November</th>
                                                        <th>December</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                    	<th style="color:grey;">Wrorking<br>days</th>
                                                        <td><%out.println(days[0]); %></td>
                                                        <td><%out.println(days[1]); %></td>
                                                        <td><%out.println(days[2]); %></td>
                                                        <td><%out.println(days[3]); %></td>
                                                        <td><%out.println(days[4]); %></td>
                                                        <td><%out.println(days[5]); %></td>
                                                        <td><%out.println(days[6]); %></td>
                                                        <td><%out.println(days[7]); %></td>
                                                        <td><%out.println(days[8]); %></td>
                                                        <td><%out.println(days[9]); %></td>
                                                        <td><%out.println(days[10]); %></td>
                                                        <td><%out.println(days[11]); %></td>
                                                    </tr>
                  
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /.table-responsive -->
                                    </div>


</body>
<!-- jQuery Version 1.11.0 -->
        <script src="js/jquery-1.11.0.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="js/plugins/morris/raphael.min.js"></script>
        <script src="js/plugins/morris/morris.min.js"></script>
        <script src="js/trial.js"></script>

        <!-- Sparkline JavaScript -->
        <script src="js/plugins/sparkline/sparkline.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/smartech.js"></script>
</html>