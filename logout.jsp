<html>
<%@ page import="java.sql.*"%>

<body>
admin logged out
<%
session.removeAttribute("role");
session.removeAttribute("username");
session.removeAttribute("name");
session.removeAttribute("active");

%>
</body>

</html>