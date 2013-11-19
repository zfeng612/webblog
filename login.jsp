<%@page import="java.sql.*"%>
<%@page import="utils.*"%>
<%@page import="Encryption.Encrypt"%>
<%@page language="java" import="dataWebUser.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Zhan's Blog Log in: session.setAttribute(), session.getAttribute(), response.redirect()</title>
            <link href="style.css" rel="stylesheet" type="text/css" />
            <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>

    </head>
    <%
        String msg = ""; // first display will show nothing on screen.
        String user_Name = request.getParameter("uname");
        String user_Role = "";
        String pwEncrypted = "";

        if (user_Name == null) {
            user_Name = ""; // surpress "NULL" (first display) from showing up in the username text field.
        } // postback, check username and password
        else {
            String passW = request.getParameter("pw");

            Login l = new Login();
            l.getUserRole(user_Name, passW);

            if (l.getUserRole(user_Name, passW) == 3) {
                user_Role = "guest";  // can view private pages (no edit)
                msg = "Hello " + user_Name + " (your role is " + user_Role + ")" + " and User ID = " + l.getUserID(user_Name, passW);
            } else if (l.getUserRole(user_Name, passW) == 2) {
                user_Role = "user"; // can edit (but not admin)
                msg = "Hello " + user_Name + " (your role is " + user_Role + ")" + " and User ID = " + l.getUserID(user_Name, passW);
            } else if (l.getUserRole(user_Name, passW) == 1) {
                user_Role = "admin"; // can access admin page
                msg = "Hello " + user_Name + ".  You are almost God (your role is " + user_Role + ")" + " and User ID = " + l.getUserID(user_Name, passW);
            } else {
                msg = "That username and password were not found in our database."; // log on not sucessful
            }


            // if username/password is OK, user_Role will have received a value.
            if (user_Role.length() > 0) {
                session.setAttribute("userName", user_Name);
                session.setAttribute("userRole", user_Role);
                session.setAttribute("userIntID", l.getUserID(user_Name, passW));
            } // successful log in

            pwEncrypted = Encrypt.encryptPw(passW);
        } // postback
    %>

    <body>
        <%@ include file= "pre-content.html" %> 
        <h1>Log In</h1>

        <form method="post" action="login.jsp" >
            Please enter your email: <input type="input" name="uname" value="<%=user_Name%>">
                <br/>
                Please enter your password: <input type="password" name="pw">
                    <br/>
                    Your password encrypts to this: <%= pwEncrypted%>
                    <br/>
                    <br/>
                    <input type = "submit" value = "Log On" > <br/>
                        <br/>
                        For this simple/sample code, there are 3 choices for username and password:
                        Guest(view), User (edit), Admin(admin)  AND  the password must match the user name.
                        <br/>
                        <br/>
                        <h3>  <%=msg%></h3>
                        </form>

                        <h2>Security Sample Project</h2>
                        <h5><a href="index.jsp">Home Page</a> (open to all)</h5>
                        <h5><a href="view.jsp">View Something</a></h5>
                        <h5><a href="edit.jsp">Edit Something</a></h5>
                        <h5><a href="admin.jsp">Admin Page</a></h5>
                        <h5><a href="login.jsp">Log In</a> (simulated)</h5>
                        <h5><a href="logout.jsp">Log Out</a></h5>

                        <%@ include file= "post-content.html" %> 
                        </body>
                        </html>
