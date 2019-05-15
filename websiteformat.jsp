<html>
<body>
<script>
	function hamburgericonshowf(inputvar){
		window.document.getElementById(inputvar).style.visibility="visible";
	}	
	function hamburgericonhidef(inputvar){
		window.document.getElementById(inputvar).style.visibility="hidden";
	}
	function mouseentermenui(inputvar){
		window.document.getElementById(inputvar).style.color="white";
		window.document.getElementById(inputvar).style.backgroundColor="#0062AE";
	}
	function mouseleavemenui(inputvar){
		window.document.getElementById(inputvar).style.color="#0062AE";
		window.document.getElementById(inputvar).style.backgroundColor="white";
	}
</script>




<div style="position:absolute;top:2%;left:2%;">
<img src="QAlogofinal.png" width="22%" height="8%" alt="Error 342" style="border:1px solid #0062AE">
</div>


<div style="position:absolute;top:2%;left:89%;width:35%;" onmouseleave="hamburgericonhidef('visspan')" >
<span onmouseover="hamburgericonshowf('visspan')" > 
<img src="Hamburgermenu.png"   alt="Error 266" width="25%" height="7%"  style="border:1px solid #0062AE">
</span >
<span id="visspan" style="visibility:hidden" >
<%
String homeadmin="";
if (null==session.getAttribute("role")){
	session.setAttribute("role",1);
} 
if ((Integer)session.getAttribute("role")==2){
	homeadmin="Admin Page";
	%>
	<div id="home"  onclick="parent.location='http://localhost:8080/Bank/admin.jsp'" onmouseover="mouseentermenui('home')" onmouseleave="mouseleavemenui('home')" style="color:#0062AE;background-color:white;font-size:16pt;height:14%;width:25%;  border: solid #0062AE thin">
	<%
}else{
	homeadmin="Home";
	%>
	<div id="home"  onclick="parent.location='http://localhost:8080/Bank/Home.jsp'" onmouseover="mouseentermenui('home')" onmouseleave="mouseleavemenui('home')" style="color:#0062AE;background-color:white;font-size:16pt;height:14%;width:25%;  border: solid #0062AE thin">
<%
}
%>
<center>
<%=homeadmin%>
</center>
</div>
<div id="logout" onclick="parent.location='http://localhost:8080/Bank/logout.jsp'" onmouseover="mouseentermenui('logout')" onmouseleave="mouseleavemenui('logout')" style="color:#0062AE;background-color:white;font-size:16pt;height:14%;width:25%; border: solid #0062AE thin">
<center>
Logout
</center>
</div>
</span>
</div>



</body>
</html>