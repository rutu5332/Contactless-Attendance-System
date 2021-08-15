<%@page import="server.ContactMail" %>

<%
	String id, text,sub,add;
	
	id = request.getParameter("email");
	add = request.getParameter("text");
	String subject = "Help this user";
	sub="Greetings !..This Message is sent from userID :"+id+"..Please look into given doubts/questions of this user =>";
	text=sub+add;
	ContactMail m = new ContactMail(subject,text);
	response.sendRedirect("index.jsp");
%>