<html>
<%@ page import="java.sql.*"%>

<body>
<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">

User logged out <BR> <BR>
<center>
<input type="button" value="Return" onclick="location.href='http://localhost:8080/Bank/Index.html'" style="color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px"> <BR>
</center>
</div>
<%
session.removeAttribute("role");
session.removeAttribute("username");
session.removeAttribute("name");
session.removeAttribute("active");
session.removeAttribute("loggedin");
session.removeAttribute("password");

%>
</body>

</html>