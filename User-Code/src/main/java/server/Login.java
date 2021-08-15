package server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.Data;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Data dt = new Data();

		String id, psw;
		boolean flag = false;

		id = request.getParameter("email");
		psw = request.getParameter("password");

		try {
			dt.st = dt.cn.createStatement();
			String sql_data = "select * from user";
			dt.rs = dt.st.executeQuery(sql_data);

			while (dt.rs.next()) {
				String eid = dt.rs.getString("email");
				String psw1 = dt.rs.getString("password");

				if (eid.equals(id) && psw1.equals(psw)) {
					flag = true;
					HttpSession session = request.getSession(true);
					session.setAttribute("userEmail", id);
					if (dt.rs.getString("type").equals("1")) {
						session.setAttribute("userType", 1);
						response.sendRedirect("Admin/index.jsp");
					} else if (dt.rs.getString("type").equals("2")) {
						session.setAttribute("userType", 2);
						response.sendRedirect("OfficeAdmin/index.jsp");
					} else {
						session.setAttribute("userType", 3);
						response.sendRedirect("employee/index.jsp");
					}
				}
			}
			if (flag != true) {
				String msg = "Invalid Username Or Password";
				response.sendRedirect("login.jsp?msg=" + msg);

			}

		}

		catch (Exception ex) {
			System.out.println(ex);
		}
	}

}
