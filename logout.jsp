<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Log Out</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>

    </head>

    <body>
        <%@ include file= "pre-content.html" %> 

        <h1>Log Out</h1>
    <%
        String msg = "You are now logged off!"; // first display will show nothing on screen.
        try {
          session.invalidate();
        }
        catch (Exception e) {
          msg += " ... but an exception was thrown: " + e.getMessage();
        }

    %>

    <br/>
    <br/>
    <h3><%=msg%></h3>
        <%@ include file= "post-content.html" %> 
    </body>
</html>
