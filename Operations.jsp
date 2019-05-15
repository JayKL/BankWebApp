<html>
<%@ include file="DriversFile.jsp" %>
<%@ include file="websiteformat.jsp" %>

<body>

<%
try{
	String operationvar=request.getParameter("operation");
	String usernamevar=request.getParameter("username");

	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	} 
	if ((Integer)session.getAttribute("role")==2) {
		Statement statementvar = connectionvar.createStatement();
		Statement statementvar2 = connectionvar.createStatement();
		Statement statementvar3 = connectionvar.createStatement();
		Statement statementvar4 = connectionvar.createStatement();
		Statement statementvar5 = connectionvar.createStatement();
		Statement statementvar6 = connectionvar.createStatement();
		Statement statementvar7 = connectionvar.createStatement();
		Statement statementvar8 = connectionvar.createStatement();

		ResultSet userrowfromusers = statementvar.executeQuery("select * from users where Accno='"+usernamevar+"'");
		ResultSet userrowfromusersounts = statementvar2.executeQuery("select * from accounts where Accno='"+usernamevar+"'");
		ResultSet userrowfromtransactions = statementvar3.executeQuery("select * from transactions where Accno='"+usernamevar+"'");
		userrowfromusers.next();
		userrowfromusersounts.next();
		userrowfromtransactions.next();
		if (operationvar.equals("D")){
			statementvar6.executeUpdate("DELETE FROM users WHERE Accno='"+usernamevar+"'");
			statementvar7.executeUpdate("DELETE FROM accounts WHERE Accno='"+usernamevar+"'");
			statementvar8.executeUpdate("DELETE FROM transactions WHERE Accno='"+usernamevar+"'");

			response.sendRedirect("admin.jsp");
	} else if (operationvar.equals("B")){
		if (userrowfromusers.getString(4).equals("1")){
			statementvar4.executeUpdate("UPDATE users SET Active= 0 WHERE Accno='"+usernamevar+"'");
		} else {
			statementvar5.executeUpdate("UPDATE users SET Active= 1 WHERE Accno='"+usernamevar+"'");
		}
		response.sendRedirect("admin.jsp");
	} else if (operationvar.equals("E")){
		%>
		<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
		<center>
		<h3> ADMIN EDIT PAGE </h3>
		<form name="editform" action="http://localhost:8080/Bank/Edit.jsp" method="post" >
		Username: <input type="text" name="usernameedit" style="margin:3px;border: solid #0062AE thin"> <BR>
		Password: <input type="text" name="passwordedit" style="margin:3px;border: solid #0062AE thin"> <BR>
		Address: <input type="text" name="passwordedit" style="margin:3px;border: solid #0062AE thin"> <BR> <BR>
		<input type="submit" style="color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px">

		</form>
		</center>
		</div>
		<%
	}
	}else {
				%>
		<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
		ACCESS DENIED
		</div>
		<%
	}
	
}catch (Exception gener1){
	
	
}
%>
</body>
</html>