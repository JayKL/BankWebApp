<html>
<%@ include file="DriversFile.jsp" %>
<%
try{
	if (null==session.getAttribute("role")){
		session.setAttribute("role",1);
	} 
	if ((Integer)session.getAttribute("role")==2) {

		String usernamevar=request.getParameter("operation");
		String passwordvar=request.getParameter("username");


	} else {
		out.println("access denied");	
	}
} catch (Exception gener1){
	out.println("access denied");
}

%>
</html>