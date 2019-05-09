<html>
<%@ page import="java.sql.*"%>

<body>
<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid black thin">

User logged out <BR>
<center>
<A href='http://localhost:8080/Bank/Index.html'> Return</A>
</center>
</div>
<%
session.removeAttribute("role");
session.removeAttribute("username");
session.removeAttribute("name");
session.removeAttribute("active");

%>
</body>

</html>