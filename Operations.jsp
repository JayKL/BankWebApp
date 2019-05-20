<html>
<%@ include file="DriversFile.jsp" %>
<%@ include file="websiteformat.jsp" %>

<body>
<script>
function formcheckeditaddress(){
	let addresstf=window.document.editformaddress.addressedit.value;


	if ( addresstf===""){
		window.document.getElementById("textforcheck").innerHTML="address is missing";
		return false;
	}else {

	}

}
function formcheckeditpw(){
	let passwordtf=window.document.editformpw.passwordedit.value;
	let passwordchecktf=window.document.editformpw.passwordreedit.value;
	
	if ( passwordtf===""){
		window.document.getElementById("textforcheck2").innerHTML="password is missing";
		return false;
	}else if (passwordtf!=passwordchecktf) {
		window.document.getElementById("textforcheck2").innerHTML="passwords do not match";
		return false;
	}
}

</script>
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

		ResultSet userrowfromusers = statementvar.executeQuery("select * from users where Accno='"+usernamevar+"'");
		
		
		userrowfromusers.next();

		if (operationvar.equals("D")){
			statementvar4.executeUpdate("DELETE FROM users WHERE Accno='"+usernamevar+"'");
			statementvar5.executeUpdate("DELETE FROM accounts WHERE Accno='"+usernamevar+"'");
			statementvar6.executeUpdate("DELETE FROM transactions WHERE Accno='"+usernamevar+"'");

			response.sendRedirect("admin.jsp");
	} else if (operationvar.equals("B")){
		if (userrowfromusers.getString(4).equals("1")){
			statementvar2.executeUpdate("UPDATE users SET Active= 0 WHERE Accno='"+usernamevar+"'");
		} else {
			statementvar3.executeUpdate("UPDATE users SET Active= 1 WHERE Accno='"+usernamevar+"'");
		}
		response.sendRedirect("admin.jsp");
	} else if (operationvar.equals("E")){
		%>
		<div style="position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid #0062AE thin">
		<center>
		<h3> ADMIN EDIT PAGE </h3>
		<form name="editformaddress" action="http://localhost:8080/Bank/Editaddress.jsp?username=<%= usernamevar %>" onsubmit="return formcheckeditaddress()" method="post" >
		Username: <input type="text" value="<%=usernamevar%>" name="usernameedit" style="margin:3px;border: solid #0062AE thin" readonly> <BR>
		Address: <input type="text" name="addressedit" style="margin:3px;border: solid #0062AE thin"> <BR> 
		<div id="textforcheck" style="color:red" ></div><BR>
		<input type="submit" style="color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px">

		</form>
		<form name="editformpw" action="http://localhost:8080/Bank/Editpw.jsp?username=<%= usernamevar %>" onsubmit="return formcheckeditpw()" method="post" >
		Password: <input type="password" name="passwordedit" style="margin:3px;border: solid #0062AE thin"> <BR>
		Re-Type Password: <input type="password" name="passwordreedit" style="margin:3px;border: solid #0062AE thin"> <BR><BR>
		<input type="submit" style="color:white;border:1px solid #0062AE ;background-color: #0062AE;border-radius:4px">
		<div id="textforcheck2" style="color:red" ></div><BR>

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