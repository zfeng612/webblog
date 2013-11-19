<%@ page language="java" import="java.sql.*"%>
<%@page language="java" import="dataWebUser.*" %>
<%@page language="java" import="utils.DbConn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Web_user</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>
        <style>
            body {background-color:lightgray;}
            .resultSetFormat {background-color:white; padding-left: 10px; text-align: left;}
            .resultSetFormat th {border: medium solid black; background-color:Black; padding:5px; color: white;}
            .resultSetFormat td {border: thin solid black; padding:5px;}
        </style>
        <script type="text/javascript">
            function deleteRow (primaryKey) {
                document.myForm.deletePK.value=primaryKey;
                document.myForm.submit();
            }
        </script>
        <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("tr").hover( function(){
                    $(this).css('background-color', 'grey');
                    $(this).css('color', 'blue');
                },
                function(){
                    $(this).css('background-color', 'white');
                    $(this).css('color', 'black');
                });
            });
        </script>
    </head>

    <body>
        <%@ include file= "pre-content.html" %> 

        <form name="myForm" action="web_user.jsp" method="get">
            <input type="hidden" name="deletePK">
        </form>

        <h1>Web_user</h1>
        <%
            DbConn dbc = new DbConn();
            String dbError = dbc.getErr();
            if (dbError.length() == 0) { // got open connection
                WebUserSql wus = new WebUserSql(dbc);
                String delKey = request.getParameter("deletePK");
                if (delKey != null) {
                    // try to delete the row that has PK = delKey
                    if (wus.delete(delKey)) {
                        out.println("<h4>Web User " + delKey + " has been deleted.</h4>");
                    } else {
                        out.println("<h4>Not able to delete Web User " + delKey + ". " + wus.getErrorMsg() + "</h4>");
                    }
                }
                out.print(wus.listAllUsers("resultSetFormat", "deleteRow", "images/delete.png"));
                dbc.close();
            } else {
                out.print(dbError);
            }
        %>
        <%@ include file= "post-content.html" %> 
    </body>
</html>
