<%@page language="java" import="dataPostTable.*" %>
<%@page language="java" import="utils.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Register</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>
        <style>
            .error {color:red; font-weight:bold}
        </style>
    </head>

    <%

        /*
         * you can use the log utility like this... LogUtil log = new LogUtil();
         * log.append("hello"); log.append("goodbye"); out.print(log.read());
         */

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



        String formMsg = "";
        PostTable wuData = new PostTable();  // all properties of a new WebUser object are "" (empty string)

        PostTableValidate wuValidate;
        if (request.getParameter("date") == null) {
            // first display.  All form fields are null, if and only iff any one form field is null.
            wuValidate = new PostTableValidate(); // no error messages
            wuData.userID = session.getAttribute("userIntID").toString();
            wuData.prodID = request.getParameter("insertPK");
        } else {
            // postback -- fill WebUserData object with form data.
            wuData.userID = request.getParameter("userID");
            wuData.prodID = request.getParameter("prodID");
            wuData.date = request.getParameter("date");
            wuData.post = request.getParameter("post");

            wuValidate = new PostTableValidate(wuData); // populate error messages from user inputs

            if (wuValidate.isAllGood()) {

                // get an OPEN db connection.  Using default constructor (no inputs)
                // means the dbconn object will try to determine where it's running
                // and use the right connection string.
                DbConn dbc = new DbConn();
                //out.print("<h4>Connection Msg: "+dbc.getConnectionMsg()+"</h4>");
                String dbError = dbc.getErr();
                if (dbError.length() == 0) {
                    PostTableSql wus = new PostTableSql(dbc);

                    // insert the validated web user object
                    formMsg = wus.insert(wuValidate);
                    if (formMsg.length() == 0) { //trying to insert from a web user validation object.
                        formMsg = "Record inserted. ";
                    }
                } else {
                    formMsg = dbError; // db connection error
                }
            } else {
                formMsg = "Please try again."; // user data entry error
            }
        } // postback

    %>
    <body>
        <%@ include file= "pre-content.html" %> 

        <h1>Create a post</h1>
        <form name="myForm" action="insert_post.jsp" method="POST">
            <table style="text-align:left;padding:10px;">
                <tbody>
                    <tr>
                        <td>User ID</td>
                        <td><input type="text" name="userID" value="<%= wuData.userID%>" /></td>
                        <td class="error"><%=wuValidate.getuserIDMsg()%></td>
                    </tr>
                    <tr>
                        <td>Product ID</td>
                        <td><input type="text" name="prodID" value="<%= wuData.prodID%>" /></td>
                        <td class="error"><%=wuValidate.getprodIDMsg()%></td>
                    </tr>
                    <tr>
                        <td>Date Added</td>
                        <td><input type="text" name="date" value="<%= wuData.date%>" /></td>
                        <td class="error"><%=wuValidate.getdateMsg()%></td>                   
                    </tr>
                    <tr>
                        <td>Post Message</td>
                        <td><input type="text" name="post" value="<%= wuData.post%>" /></td>
                        <td class="error"><%=wuValidate.getpostMsg()%></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td class="error"><%=formMsg%></td>
                        <td><a href="post_table.jsp">list posts</a></td>
                    </tr>
                </tbody>
            </table>
        </form>

        <%@ include file= "post-content.html" %> 
    </body>
</html>
