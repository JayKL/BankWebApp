<html>
<%@ page import="java.sql.*"%>
<%@ include file="DriversFile.jsp" %>

<body>
<%
String namevar=request.getParameter("name");
String addressvar=request.getParameter("address");
String gendervar=request.getParameter("gender");
String accounttype=request.getParameter("accounttype");
String passwordvar=request.getParameter("password");
String accountnumber="";
String SQLinsertaccounts="";
String SQLinsertusers="";
try{
	Statement strefvar1 = connectionvar.createStatement();
	Statement strefvar2 = connectionvar.createStatement();
	Statement strefvar3 = connectionvar.createStatement();
	ResultSet resultsfromtableaccounts = strefvar1.executeQuery("select IFNULL(LPAD(max(substring(Accno,3,5))+1,3,'0'),'001') from (select * from accounts where Accno like '"+ accounttype+"%') as T1" );
	resultsfromtableaccounts.next();
	accountnumber=resultsfromtableaccounts.getString(1);
	SQLinsertaccounts ="INSERT INTO accounts (Accno,Name,Address) VALUES ('"+accounttype+gendervar+accountnumber+"' , '"+namevar+"' , '"+addressvar+"' )";
	SQLinsertusers="INSERT INTO users (Accno,Password,Active,Role) VALUES ('"+accounttype+gendervar+accountnumber+"' , '"+passwordvar+"' , 1,1 )";
	strefvar2.executeUpdate(SQLinsertaccounts);
	strefvar3.executeUpdate(SQLinsertusers);
}
catch (Exception gener1){
	out.println("general error 1 ->" + gener1.toString());
}

out.println("<div style=\"position:fixed;top:50%;left:50%;transform:translate(-50%,-50%); padding:10px;border: solid black thin\">");
out.println("Account created with username: "+accounttype+gendervar+accountnumber + "<BR>");
out.println("<A href='http://localhost:8080/Bank/Index.html'> Return</A>");
out.println("</div>");

%>


</body>
</html>