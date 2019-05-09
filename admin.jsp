<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriversFile.jsp" %>
<%@ include file="websiteformat.jsp" %>

<body>

<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;">
<Center>
<h1>Admin Page</h1>
</center>
<%
int serialnumber=1;
try{
	if ((Integer)session.getAttribute("role")==2) {
		try{

			Statement statementvar1 = connectionvar.createStatement();
			Statement statementvar2 = connectionvar.createStatement();
			ResultSet accountstable=statementvar1.executeQuery("select * from accounts");
			out.print("<Table Border='1'>");
			out.print("<TR><TD>S.No</TD><TD>AccNo</TD><TD>Name</TD><TD>Address</TD><TD>Operations</TD>");
			while (accountstable.next()){
				ResultSet userstable=statementvar2.executeQuery("select password from users where AccNo='"+accountstable.getString(1)+"'");
				userstable.next();
				out.print("<TR><TD>"+serialnumber++ +"</TD><TD><A href='http://localhost:8080/Bank/Home.jsp?username="+accountstable.getString(1)+"'>"+accountstable.getString(1)+"</A></TD><TD>"+accountstable.getString(2)+"</TD><TD>"+accountstable.getString(3)+"</TD><TD><A href=''>edit</A>,<A href=''>block</A>,<A href=''>delete</A>");
			}
		} catch (Exception gener1){
			out.println(gener1);
		}
	} else {
		out.println("access denied");	
	}
} catch (Exception gener1){
	out.println("access denied");
}
%>
</body>
</div>
</html>