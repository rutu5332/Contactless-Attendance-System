<html>
<head>

        <!-- Favicon -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/smartech.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <title>SmartOffice</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
		if(session.getAttribute("userEmail") == null)
			response.sendRedirect("../login.jsp");
		else{
			int t=Integer.parseInt(session.getAttribute("userType").toString());
			if(t != 3)
				response.sendRedirect("../login.jsp");
		}
%>
	
	<br> Your Today's Attendance in Time : 9:06:34 AM
	
        <script src="js/jquery-1.11.0.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>