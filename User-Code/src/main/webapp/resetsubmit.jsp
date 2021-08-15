<%@page import="Database.Data"%>
<%
	Data dt = new Data();

	dt.st = dt.cn.createStatement();

	String sql_menu = "select * from user";
	dt.rs = dt.st.executeQuery(sql_menu);

	String sid = " ";
	String id, pswnew;
	
	sid = request.getParameter("email");
	pswnew = request.getParameter("cpassword");
	
	try {

		while (dt.rs.next()) {

			String eid = dt.rs.getString("email");

			if (eid.equals(sid)) {

				String sql_up = "update user SET password='" + pswnew + "'  WHERE email='" + sid + "' ";
				int c = dt.st.executeUpdate(sql_up);
				System.out.println(c + " record updated.");
				response.sendRedirect("login.jsp");
			}
		}

	}

	catch (Exception ex) {
		out.println(ex);
	}
%>
