<%@page import="java.sql.*"%>
<html>
<%
String delete_id =request.getParameter("search"); 
try
{
	final String DB_URL = "jdbc:mysql://localhost:3306/keep_notes";
	final String DB_USER = "root";
	final String DB_PASS = "root1234";
	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
	int d_id = Integer.parseInt(delete_id);
Statement st=conn.createStatement();
st.executeUpdate("delete from notes where id = " + d_id);
%>
<jsp:include page="note.jsp" /> 
<% 
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</html>