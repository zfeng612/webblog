<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Deny: session.setAttribute(), session.getAttribute(), response.redirect()</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>

    </head>
    <body>
        <%@ include file= "pre-content.html" %> 

        <h1>Deny</h1>

        <h2>Security Sample Project - Page Access Denied (unauthorized)</h2>
        <h5><a href="index.jsp">Home Page</a> (open to all)</h5>
        <h5><a href="view.jsp">View Something</a></h5>
        <h5><a href="edit.jsp">Edit Something</a></h5>
        <h5><a href="admin.jsp">Admin Page</a></h5>
        <h5><a href="login.jsp">Log In</a> (simulated)</h5>
        <h5><a href="logout.jsp">Log Out</a></h5>

        <%
            String errorMessage = request.getParameter("errorMsg");
            if (errorMessage == null) {
                errorMessage = "Apparently you are not allowed to access that page...";
            }
        %>

        <br/>
        <br/>
        <h3><%=errorMessage%></h3>
        <%@ include file= "post-content.html" %> 
    </body>
</html>
