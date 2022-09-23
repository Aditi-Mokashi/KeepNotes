<%@ page import = "java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
    <nav class="collapse navbar-collapse justify-content-end">
  <a class="navbar-brand" href="index.html">Home</a>
</nav>  
      
</nav>
 <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/keep_notes"
         user = "root"  password = "root1234"/>

         <sql:query dataSource = "${snapshot}" var = "result">
            select * from notes order by id desc
         </sql:query>
         <ul>
         <c:forEach var = "row" items = "${result.rows}">
            <li>
   			 <a>
             <h1> <c:out value = "${row.id}"/></h1>
               <p> <c:out value = "${row.notecolumn}"/></p>
               </a>
               </li>
         </c:forEach>
         </ul>
</body>
</html>