<html>
<%@ include file="DriversFile.jsp" %>
<%

try{
	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	} 
	if ((Integer)session.getAttribute("role")==2) {
		Statement statementvar = connectionvar.createStatement();
		
		String usernametoedit=request.getParameter("username");
		String passwordvar=request.getParameter("passwordedit");
		
		statementvar.executeUpdate("UPDATE users set Password='"+passwordvar+"' WHERE Accno='"+usernametoedit+"'");

	} else {
		out.println("access denied");	
	}
	response.sendRedirect("admin.jsp");
} catch (Exception gener1){
	out.println("access denied");
}

%>
</html>