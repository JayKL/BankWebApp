<html>
<body>
<%@ page import="java.sql.*"%>
<%
Connection connectionvar=null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connectionvar = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp","root", "");
} catch (Exception gener1){
	out.println("error in connection");
}
%>
</body>
</html>