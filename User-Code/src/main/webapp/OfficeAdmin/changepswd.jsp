<%@page import="Database.Data" %>
<%

		Data dt=new Data();
		
		dt.st=dt.cn.createStatement();
		
		String sql_menu = "select * from user ";
		dt.rs=dt.st.executeQuery(sql_menu);
		
		
		
		String id,pswold,pswnew;
		boolean flag=false;

		
		pswold=request.getParameter("oldpsw");
		pswnew=request.getParameter("password");
		String uid = session.getAttribute("userEmail").toString();
		
		try
		{
			
			
			while(dt.rs.next())
			{
					String eid=dt.rs.getString("email");
					String psw=dt.rs.getString("password");
				
				if(psw.equals(pswold) && uid.equals(eid))
				{
					flag=true;
					String sql_up = "update user SET password='"+pswnew+"'  WHERE email ='"+uid+"' ";
					int c=dt.st.executeUpdate(sql_up);
				    System.out.println(c+" record updated");
					response.sendRedirect("index.jsp");
				}
			}
			if(flag!=true)
			{
				String msg="Invalid Old Password";
				response.sendRedirect("updateprofile.jsp?msg");
				
			}
			
			 
		}

		
		catch(Exception ex)
		{
			out.println(ex);
		}

%>
<script type="text/javascript">window.onload=alertname</script>