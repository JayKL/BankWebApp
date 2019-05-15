<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriversFile.jsp" %>
<%@ include file="websiteformat.jsp" %>


<body>
<div>
<%
String usernamevar=request.getParameter("username");
String passwordvar=request.getParameter("password");
if (null==session.getAttribute("loggedin")){
		session.setAttribute("loggedin",0);
}
if ((Integer)session.getAttribute("loggedin")==1){
if (usernamevar==null){
	usernamevar=(String)session.getAttribute("username");
} else {
	if (usernamevar.equals((String)session.getAttribute("username"))){
	} else{
		usernamevar="DENIED";
	}
}


if (passwordvar==null){
	passwordvar=(String)session.getAttribute("password"); 
}
}

try{
	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	} 
	Statement statementvar = connectionvar.createStatement();
	Statement statementvar2 = connectionvar.createStatement();
	Statement statementvar3 = connectionvar.createStatement();
	Statement statementvar4 = connectionvar.createStatement();
	ResultSet userrowfromusers = statementvar.executeQuery("select * from users where Accno='"+usernamevar+"'");
	ResultSet userrowfromusersounts = statementvar2.executeQuery("select * from accounts where Accno='"+usernamevar+"'");
	ResultSet userrowfromtransactions = statementvar3.executeQuery("select * from transactions where Accno='"+usernamevar+"'");
	ResultSet checkbalance = statementvar4.executeQuery("SELECT (select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='D') -(select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='W') as result");
	checkbalance.next();
	userrowfromusersounts.next();
	if (userrowfromusers.next()){
		if (userrowfromusers.getString(2).equals(passwordvar) || (Integer)session.getAttribute("role")==2){
			if (userrowfromusers.getInt(3)==2){
				response.sendRedirect("admin.jsp");
				session.setAttribute("username",usernamevar);
				session.setAttribute("role",2);
				session.setAttribute("name",userrowfromusersounts.getString(2));
			} else {
				if (userrowfromusers.getInt(4)==0){
					session.setAttribute("username",usernamevar);
					
						if ((Integer)session.getAttribute("role")==2){

						} else {
							session.setAttribute("role",1);
						}
					session.setAttribute("name",userrowfromusersounts.getString(2));
					session.setAttribute("active",0);
					%>
					you are blocked
					<%
				} else {
					session.setAttribute("username",usernamevar);
					if ((Integer)session.getAttribute("role")==2){

						}
						else{
							session.setAttribute("role",1);
						}
					
					session.setAttribute("name",userrowfromusersounts.getString(2));
					session.setAttribute("active",1);
					session.setAttribute("loggedin",1);
					session.setAttribute("password",passwordvar);
					%>
					<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
					<center> <h2>Welcome to QA Banking Services </h2></center><BR>
					<div style="float:left">
					
					AccountNo: <%=userrowfromusers.getString(1) %><BR>
					Name: <%=userrowfromusersounts.getString(2) %><BR>
					Address: <%=userrowfromusersounts.getString(3) %><BR> <BR>
			
								Balance: <%=checkbalance.getFloat(1)%> <BR> <BR>

			
					Transaction History: <BR>
					<div style="overflow:auto;height:200px;">
					<Table Border='0'>
					<TR><TD>Amount</TD><TD align="center">Date</TD><TD>Type</TD>
					<%
					while (userrowfromtransactions.next()){
						%>
						<TR><TD><%=userrowfromtransactions.getFloat(2) %> </TD> <TD> <%=userrowfromtransactions.getString(3).substring(2,10) %> </TD> <TD align="right"> <%= userrowfromtransactions.getString(4) %></TD></TR>
						<%
					}
					%>
					</Table>
					</div>
					
				
					</div>
					
					<div style="float:right">
					<%
						if ((Integer)session.getAttribute("role")==2){

						} else{
							out.println("<input type=\"button\" value=\"Deposit\" onclick=\"parent.location='http://localhost:8080/Bank/deposit.jsp?username="+usernamevar+"'\" style=\"color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px;margin-left:12px;margin-top:2px;margin-bot:2px\">"  +"<BR>");
							out.println("<input type=\"button\" value=\"Withdraw\" onclick=\"parent.location='http://localhost:8080/Bank/withdraw.jsp?username="+usernamevar+"'\"  style=\"color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px;margin-left:12px;margin-top:2px;margin-bot:2px\" >"  +"<BR>");
						}
						%>
					</div>
					</div>
					<%
				}
			}
		} else {
			out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin\">");
			out.println("Password is wrong<BR><center><A href='http://localhost:8080/Bank/Index.html'> Return</A></center>");
			out.println("<div>");
		}
	} else{
			out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin\">");
			out.println("Username is not in the system<BR><Center><A href='http://localhost:8080/Bank/Index.html'> Return</A></center>");
			out.println("<div>");
	}
} catch (Exception gener1) {
	//out.println(gener1);
	out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin\">");
	out.println("<A href='http://localhost:8080/Bank/Index.html'> Serious error login failed go back </A>");
	out.println("<div>");
}


%>
</div>
</body>
</html>