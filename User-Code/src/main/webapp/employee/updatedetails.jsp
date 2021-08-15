<%@page import="Database.Data"%>
<%
try
{
	String userEmail=(String)session.getAttribute("userEmail");
	String email,fname,lname,des,mno;
	fname=request.getParameter("fname");
	lname=request.getParameter("lname");
	email=request.getParameter("mail");
	des=request.getParameter("des");
	mno=request.getParameter("mno");
	
	Data dt=new Data();
	
	dt.st=dt.cn.createStatement();
	String sql_menu = "select * from user ";
	dt.rs=dt.st.executeQuery(sql_menu);
	
	
	while(dt.rs.next())
	{
			
			String e=dt.rs.getString("email");
		
		if(userEmail.equals(e))
		{
			
			String sql_up = "update user SET fname='"+fname+"',lname='"+lname+"',email='"+email+"',designation='"+des+"',mobileNo='"+mno+"'  WHERE email='"+userEmail+"' ";
			int c=dt.st.executeUpdate(sql_up);
		    System.out.println(c+" record updated");
			response.sendRedirect("index.jsp");
		}
	}
	
}
catch(Exception e)
{
	
}


%>
