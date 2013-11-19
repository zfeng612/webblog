<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - View: session.setAttribute(), session.getAttribute(), response.redirect()</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>

    </head>
    <body>
        <%@ include file= "pre-content.html" %> 
        
        <h1>View</h1>
        <h2>Security Sample Project - VIEW</h2>
        <h5><a href="index.jsp">Home Page</a> (open to all)</h5>
        <h5><a href="view.jsp">View Something</a></h5>
        <h5><a href="edit.jsp">Edit Something</a></h5>
        <h5><a href="admin.jsp">Admin Page</a></h5>
        <h5><a href="login.jsp">Log In</a> (simulated)</h5>
        <h5><a href="logout.jsp">Log Out</a></h5>

        <%
            String msg = "Who are you?";
            String redirectMsg = "";
            String user_Name = (String) session.getAttribute("userName");
            String user_Role = (String) session.getAttribute("userRole");
            if (user_Name == null) {
                redirectMsg = "Sorry you cannot access the VIEW page because you are not logged in.";
            } else if (!user_Role.equalsIgnoreCase("guest")
                    && !user_Role.equalsIgnoreCase("user")
                    && !user_Role.equalsIgnoreCase("admin")) {
                redirectMsg = "Sorry you are not authorized to access this VIEW page.";
            }
            if (redirectMsg.length() != 0) {
                try {
                    response.sendRedirect("deny.jsp?errorMsg=" + redirectMsg);
                } catch (Exception e) {
                    msg += " Exception was thrown: " + e.getMessage();
                }
            }
            msg = "Hello " + user_Name + " (your role is " + user_Role + ")";
        %>

        <br/>
        <br/>
        <%=msg%>
        <br/>
        <br/>
        <h3>You are allowed to access this VIEW page.</h3>
        
        <%@ include file= "post-content.html" %> 
    </body>
</html>
