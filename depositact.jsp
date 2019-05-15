<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriversFile.jsp" %>
<%@ include file="websiteformat.jsp" %>



<body>
<%
String usernamevar=request.getParameter("username");
String amounttoins=request.getParameter("amount");
String withordep=request.getParameter("check");
String withordeptext="";
if (withordep.equals("D")) withordeptext="Deposit";
if (withordep.equals("W")) withordeptext="Withdraw";

	if (null==session.getAttribute("username")){
		session.setAttribute("username","invalid");
	}
	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	}  
try{

	if ((Integer)session.getAttribute("role")==2){
		%>
		<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
		access denied admin cannot deposit
		</div>
		<%
	}else{
		if (session.getAttribute("username").equals(usernamevar)){
			Statement statementvarcheckbal = connectionvar.createStatement();
			ResultSet checkbalance2 = statementvarcheckbal.executeQuery("SELECT (select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='D') -(select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='W') as result");
			checkbalance2.next();
			if (withordep.equals("D") || checkbalance2.getFloat(1)>=Float.parseFloat(amounttoins)) {
				
				Statement statementvar1 = connectionvar.createStatement();
				Statement statementvar2 = connectionvar.createStatement();
				statementvar2.executeUpdate("INSERT INTO transactions (Accno,Amount,Date,Type) values ('"+usernamevar+"','"+amounttoins+"',now(),'"+withordep+"')"); 
				ResultSet checkbalance = statementvar1.executeQuery("SELECT (select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='D') -(select ifnull(sum(Amount),0) as sum from transactions where Accno='"+usernamevar+"' and Type ='W') as result");
				checkbalance.next();
				%>
				
				<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
				<center>
				<BR>
				<%=withordeptext%> Successful <BR> <BR>
				Old Balance: <%=checkbalance2.getFloat(1)%> <BR> <BR>
				New Balance: <%=checkbalance.getFloat(1)%> <BR> <BR>
				<input type="button" value="Go Back" onclick="location.href='http://localhost:8080/Bank/Home.jsp'" style="color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px">
				<BR> <BR>
				</center>
				
				</div>
				<%
			
			} else{
				%>
				<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
				Insufficient funds
				</div>
				<%
			}
		} else{
			%>
			<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
			access denied
			</div>
			<%
		}
	}
} catch (Exception gener1){
	//out.println(gener1);
	out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin\">");
	out.println("<A href='http://localhost:8080/Bank/Index.html'> Serious error</A>");
	out.println("<div>");
}
%>
</body>
</html>