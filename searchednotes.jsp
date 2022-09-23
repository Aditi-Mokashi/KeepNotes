<%@ page import = "java.sql.*"%>
<html>
<head>
  <title>YOUR NOTES</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="styles.css">
<link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
    <form class="navbar-form navbar-left" action="deletenote.jsp">
    Enter the number of the note to be deleted
      <div class="form-group">
        <input type="text" class="form-control" name="search">
      </div>
      <button type="submit" class="btn btn-default">Delete</button>
    </form>
</nav>
<%
String searchword = request.getParameter("search");
final String DB_URL = "jdbc:mysql://localhost:3306/keep_notes";
	final String DB_USER = "root";
	final String DB_PASS = "root1234";
	Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
try
{	
PreparedStatement pstmt = conn.prepareStatement("select * from notes where notecolumn like '%" + searchword +"%' " );
ResultSet rs = pstmt.executeQuery();
%> <ul> <% 
while(rs.next()){	 
%>
  	<li>
    <a href = "#">
    <h1> <% out.print(rs.getString(1)); %></h1>
    <p> <% out.print(rs.getString(2)); %> </p> 
    </a>
  </li>
<%	
}
%> </ul> <%
 }
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

</body>
</html>