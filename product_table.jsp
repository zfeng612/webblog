<%@page language="java" import="dataProductTable.*" %>
<%@page language="java" import="utils.DbConn" %>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - product_table</title>
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
        <script type="text/javascript">
            function deleteRow (primaryKey) {
                document.myForm.deletePK.value=primaryKey;
                document.myForm.submit();
            }
        </script>

        <script type="text/javascript">
            function insertPost (primaryKey){
                document.insertPost.insertPK.value=primaryKey;
                document.insertPost.submit();
            }
        </script>

    </head>

    <body>
        <%@ include file= "pre-content.html" %>

        <form name="myForm" action="product_table.jsp" method="get">
            <input type="hidden" name="deletePK">
        </form>

        <form name="insertPost" action="insert_post.jsp" method="get">
            <input type="hidden" name="insertPK"/>
        </form>

        <h1>Product_table</h1>
        <%

            String msg = "Who are you?";
            String redirectMsg = "";
            String user_Name = (String) session.getAttribute("userName");
            String user_Role = (String) session.getAttribute("userRole");
            if (user_Name == null) {
                redirectMsg = "Sorry you cannot access this page because you are not logged in.";
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

            DbConn dbc = new DbConn();
            String dbError = dbc.getErr();
            if (dbError.length() == 0) { // got open connection
                ProductTableSql wus = new ProductTableSql(dbc);
                String delKey = request.getParameter("deletePK");

                String insKey = request.getParameter("insertPK");
                if (delKey != null) {
                    // try to delete the row that has PK = delKey
                    if (wus.delete(delKey)) {
                        out.println("<h4>Web User " + delKey + " has been deleted.</h4>");
                    } else {
                        out.println("<h4>Not able to delete Web User " + delKey + ". " + wus.getErrorMsg() + "</h4>");
                    }
                }
                out.print(wus.listAllUsers("resultSetFormat", "deleteRow", "images/delete.png", "insertPost", "images/view.png"));
                dbc.close();
            } else {
                out.print(dbError);
            }
        %>
        <%@ include file= "post-content.html" %> 
    </body>
</html>
