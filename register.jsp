<%@page language="java" import="dataWebUser.*" %>
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
                you can use the log utility like this...
                LogUtil log = new LogUtil();
                log.append("hello");
                log.append("goodbye");
                out.print(log.read());
                 */

                String formMsg = "";
                WebUser wuData = new WebUser();  // all properties of a new WebUser object are "" (empty string)

                WebUserValidate wuValidate;
                if (request.getParameter("userEmail") == null) {
                    // first display.  All form fields are null, if and only iff any one form field is null.
                    wuValidate = new WebUserValidate(); // no error messages
                } else {
                    // postback -- fill WebUserData object with form data.
                    wuData.userEmail = request.getParameter("userEmail");
                    wuData.userPw = request.getParameter("userPw");
                    wuData.userPw2 = request.getParameter("userPw2");
                    wuData.membershipFee = request.getParameter("membershipFee");
                    wuData.birthday = request.getParameter("birthday");
                    wuData.userRole = request.getParameter("userRole");

                    wuValidate = new WebUserValidate(wuData); // populate error messages from user inputs

                    if (wuValidate.isAllGood()) {

                        // get an OPEN db connection.  Using default constructor (no inputs)
                        // means the dbconn object will try to determine where it's running
                        // and use the right connection string.
                        DbConn dbc = new DbConn();
                        //out.print("<h4>Connection Msg: "+dbc.getConnectionMsg()+"</h4>");
                        String dbError = dbc.getErr();
                        if (dbError.length() == 0) {
                            WebUserSql wus = new WebUserSql(dbc);

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

        <h1>Register</h1>
        <form name="myForm" action="register.jsp" method="POST">
            <table style="text-align:left;padding:10px;">
                <tbody>
                    <tr>
                        <td>User Email</td>
                        <td><input type="text" name="userEmail" value="<%= wuData.userEmail%>" /></td>
                        <td class="error"><%=wuValidate.getUserEmailMsg()%></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="userPw" value="<%= wuData.userPw%>" /></td>
                        <td class="error"><%=wuValidate.getUserPwMsg()%></td>
                    </tr>
                    <tr>
                        <td>Re-type Password</td>
                        <td><input type="password" name="userPw2" value="<%= wuData.userPw%>" /></td>
                        <td class="error"><%=wuValidate.getUserPw2Msg()%></td>
                    </tr>
                    <tr>
                        <td>Membership Fee</td>
                        <td><input type="text" name="membershipFee" value="<%= wuData.membershipFee%>" /></td>
                        <td class="error"><%=wuValidate.getMembershipFeeMsg()%></td>
                    </tr>
                    <tr>
                        <td>User Role</td>
                        <td><input type="text" name="userRole" value="<%= wuData.userRole%>" /></td>
                        <td class="error"><%=wuValidate.getUserRoleMsg()%></td>
                    </tr>
                    <tr>
                        <td>Date Added</td>
                        <td><input type="text" name="birthday" value="<%= wuData.birthday%>" /></td>
                        <td class="error"><%=wuValidate.getBirthdayMsg()%></td>                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td class="error"><%=formMsg%></td>
                        <td><a href="web_user.jsp">list users</a></td>
                    </tr>
                </tbody>
            </table>
        </form>

        <%@ include file= "post-content.html" %> 
    </body>
</html>
