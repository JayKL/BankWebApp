<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriversFile.jsp" %>
<%@ include file="websiteformat.jsp" %>

<body>
<%
String usernamevar=request.getParameter("username");
	if (null==session.getAttribute("username")){
		session.setAttribute("username","invalid");
	}
	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	}  
try{

	if ((Integer)session.getAttribute("role")==2){
		out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid black thin\">");
		out.println("access denied admin cannot withdraw");
		out.println("</div>");
	}else{
		if (session.getAttribute("username").equals(usernamevar)){
			Statement statementvar = connectionvar.createStatement();
			ResultSet checkbalance = statementvar.executeQuery("SELECT (select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='D') -(select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='W') as result");
			checkbalance.next();
			
			out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid black thin\">");
			out.println("<form action=\"http://localhost:8080/Bank/depositact.jsp?username="+usernamevar+"&check=W\"  method=\"post\">");
			out.println("<center>");
			out.println("Withdraw Amount: <input type=\"number\" min=\"0\" name=\"amount\" style=\"margin:3px;border: solid black thin\"> <BR>");
			out.println("Current Balance: "+checkbalance.getFloat(1)+"<BR>");
			out.println("<input type=\"submit\">");
			out.println("</center>");
			out.println("</form>");
			out.println("</div>");
		} else{
			out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid black thin\">");
			out.println("access denied");
			out.println("</div>");
		}
	}
} catch (Exception gener1){
	//out.println(gener1);
	out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid black thin\">");
	out.println("<A href='http://localhost:8080/Bank/Index.html'> Serious error</A>");
	out.println("<div>");
}


%>
</body>
</html>