<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page language="java" import="utils.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Search</title>
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
                $(".resultSetFormat tr").hover( function(){
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
    <%
        DbConn dbc = new DbConn();
        String dbError = dbc.getErr();

        String user = request.getParameter("userSelect");
        String product = request.getParameter("productSelect");
        String type = request.getParameter("typeSelect");
        String date2 = request.getParameter("dateEndSelect");
    %>
    <body>
        <%@ include file= "pre-content.html" %> 

        <h1>Search</h1>

        <form name="search" method="post" action="search.jsp"> 
            <table cellpadding="10px">
                <tr>
                    <td>User: </td>
                    <td>
                        <%=Select.createSelectMenu(dbc, "SELECT user_email FROM web_user", "userSelect", user)%>
                    </td>   
                    <td>Product: </td>
                    <td>
                        <%=Select.createSelectMenu(dbc, "SELECT product_name FROM product_table", "productSelect", product)%>
                    </td>
                </tr>    
                <tr>
                    <td>Product Type: </td>
                    <td>
                        <%=Select.createSelectMenu(dbc, "SELECT product_type FROM product_table", "typeSelect", type)%>
                    </td>
                    <td>Post Date: </td>
                    <td>
                        <%=Select.createSelectMenu(dbc, "SELECT post_date FROM post_table", "dateEndSelect", date2)%>
                    </td>

                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Search" />
                    </td>
                </tr>
            </table>
        </form>


        <h2>Search Results</h2>


        <%
            out.println(Search.performSearch(dbc, user, product, type, date2));
        %>





        <%@ include file= "post-content.html" %> 
    </body>
</html>
