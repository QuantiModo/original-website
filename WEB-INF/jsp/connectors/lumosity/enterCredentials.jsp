
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ page isELIgnored="false"%><%@ page import="java.util.*" %>
<%
	List<String> required = new ArrayList<String>();
	if (request.getAttribute("required")!=null) required = (ArrayList<String>) request.getAttribute("required");
	
	String username = "";
	if (request.getAttribute("username")!=null) username = (String) request.getAttribute("username");
	
	String errorMessage = null;
	if (request.getAttribute("errorMessage")!=null) errorMessage = (String) request.getAttribute("errorMessage");
%>

<p id="lumosity-text">Please enter your lumosity credentials</p>
<table id="lumosity-credentials-table">
	<% if (errorMessage!=null) { %>
		<tr><td colspan="2"><span class="formError"><%=errorMessage%></span></td></tr>
	<% } %>
	<tr>
	<td>Username:</td><td><input autocorrect="off" autocapitalize="off" class="focushere" id="lumosity-username" value="<%=username%>"></input></td>
	<% if (required.contains("username")) { %>
	<td>
		<span class="formError">* username is required</span>
	</td>
	<% } %>
	</tr>
	<tr>
	<td>Password:</td><td><input autocorrect="off" autocapitalize="off" id="lumosity-password" type="password" onkeypress="if(event.which==13) submitLumosityCredentials()"></input></td>
	<% if (required.contains("password")) { %>
	<td>
		<span class="formError">* password is required</span>
	</td>
	<% } %>
	</tr>
	<tr>
	<td colspan="2"><button class="btn" onclick="Connectors.submitLumosityCredentials()">Send</button></td>
	</tr>
</table>
