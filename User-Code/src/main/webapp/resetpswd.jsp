<%@page import="Database.Data"%>
<%@page import="server.Mail" %>



<%
	Data dt = new Data();

	dt.st = dt.cn.createStatement();
	String sql_menu = "select * from user";
	dt.rs = dt.st.executeQuery(sql_menu);

	String id=request.getParameter("val");
	
	//id=coming from login page(from popup)
	String er=request.getParameter("er");
	//er=coming from resetsubmit.jsp when entered otp is wrong
	boolean flag = false;
	String text="";
	
	//if(id != null)
	//{
		try {

			while (dt.rs.next()) {
				String eid = dt.rs.getString("email");

				if (eid.equals(id)) {
					flag = true;
					String sub = "your generated random number : ";
					double r = Math.random();
					
					String temp = Double.toString(r);
					
					text=(temp.substring(2,7));
					Mail m = new Mail(eid, sub, text);
				
				}
			}
			if (flag != true) {
				String msg = "Invalid Email Id.";
				response.sendRedirect("login.jsp?msg="+msg);

			}

		}

		catch (Exception ex) {
			out.println(ex);
		}		
	//}
	


%>




<html lang="en">
<head>
  
  <title>SmartOffice</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
  <div class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
           <div class="col-md-5">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="img/logo.png" alt="logo" class="logo">
              </div>
              <p class="login-card-description">Reset your password</p>
              <form action="resetsubmit.jsp" name="resetform" id="resetform" method="post">
                  <div class="form-group">
                    <input type="hidden" value=<%=text %> id="code">
                    <input type="hidden" value=<%=id %> id="email" name="email">
                    <input type="text" name="otp" id="otp" class="form-control" placeholder="Otp">
                     <span id="errorotp" style="color:red;">
                     <%
                     
 						if (er != null) {
 							out.println("<font color=red size=3>" + "Invalid OTP" + "</font>");
 						}
 					%>
                    
                     </span>
                  </div>
                  <div class="form-group mb-4">
                    
                    <input type="password" name="password" id="password" class="form-control" placeholder="New password">
					<span id="errorpswd" style="color:red;"></span>                  
					
					<input type="password" name="cpassword" id="cpassword" class="form-control" placeholder="Confirm password">
					<span id="errorcpsw" style="color:red;"></span>    
                  </div>
                  
                  <input name="submit" id="submit" class="btn btn-block login-btn mb-4" type="submit" value="submit">
                </form>

                <p class="login-card-footer-text"></p>
              
            </div>
          </div>
          
          <div class="col-md-5">
            <img src="img/reset2.jpg" alt="resetImage" class="login-card-img">
          </div>
         
        </div>
      </div>
      
    </div>
  </div>
  
  
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	
</body>
<script src="js/resetjs.js"></script>
</html>