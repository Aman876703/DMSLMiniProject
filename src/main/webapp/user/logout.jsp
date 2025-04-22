<%@page import="com.mysql.cj.Session"%>
<% 
session.removeAttribute("email");
out.println("<script>window.location='../index.jsp'</script>");

%>