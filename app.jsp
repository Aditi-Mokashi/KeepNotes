<%@page import="java.sql.*"%>
<html>
<%
String title = request.getParameter("notetitle");
String content=request.getParameter("name");
if(content.length()==0){
	%>
	<script>
  alert("Note is empty");
</script>
	<%
}
else{ 
try
{
	final String DB_URL = "jdbc:mysql://localhost:3306/keep_notes";
	final String DB_USER = "root";
	final String DB_PASS = "root1234";
	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
	Statement st=conn.createStatement();
	st.executeUpdate("insert into notes(notecolumn)values(' "+content+"')");
%>
<jsp:include page="note.jsp" /> 
<% 
}
catch(Exception e){
	System.out.print(e);
	e.printStackTrace();
}
}
%>
</html>