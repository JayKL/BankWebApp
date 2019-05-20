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
String block="";
try{
	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	} 
	if ((Integer)session.getAttribute("role")==2) {
		try{

			Statement statementvar1 = connectionvar.createStatement();
			Statement statementvar2 = connectionvar.createStatement();
			ResultSet accountstable=statementvar1.executeQuery("select * from accounts");
			%>
			<div style="overflow:auto;height:200px;">
			<Table Border='0'>
			<TR><TD>S.No</TD><TD>AccNo</TD><TD align="center">Name</TD><TD align="center" >Address</TD><TD align="center" >Operations</TD>
			<%
			while (accountstable.next()){
				ResultSet userstable=statementvar2.executeQuery("select password,active from users where AccNo='"+accountstable.getString(1)+"'");
				userstable.next();
				if (userstable.getString(2).equals("1")){
					block="block";
				} else {
					block="unblock";
				}
				%>
				<TR><TD><%= serialnumber++ %></TD><TD><A href='http://localhost:8080/Bank/Home.jsp?username=<%=accountstable.getString(1)%>' ><%= accountstable.getString(1) %></A></TD><TD><%= accountstable.getString(2) %></TD><TD><%= accountstable.getString(3) %></TD><TD><A href='http://localhost:8080/Bank/Operations.jsp?operation=E&username=<%=accountstable.getString(1)%>'>edit</A>,<A href='http://localhost:8080/Bank/Operations.jsp?operation=B&username=<%=accountstable.getString(1)%>'><%=block%></A>,<A href='http://localhost:8080/Bank/Operations.jsp?operation=D&username=<%=accountstable.getString(1)%>'>delete</A>
				<%
			}
			%>
			</div>
			<%
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