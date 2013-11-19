<%@page language="java" import="dataProductTable.*" %>
<%@page language="java" import="utils.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Add Product</title>
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
                ProductTable wuData = new ProductTable();  // all properties of a new WebUser object are "" (empty string)

                ProductTableValidate ptValidate;
                if (request.getParameter("productName") == null) {
                    // first display.  All form fields are null, if and only iff any one form field is null.
                    ptValidate = new ProductTableValidate(); // no error messages
                } else {
                    // postback -- fill WebUserData object with form data.
                    wuData.productName = request.getParameter("productName");
                    wuData.productPrice = request.getParameter("productPrice");
                    wuData.productDate = request.getParameter("productDate");
                    wuData.productType = request.getParameter("productType");

                    ptValidate = new ProductTableValidate(wuData); // populate error messages from user inputs

                    if (ptValidate.isAllGood()) {

                        // get an OPEN db connection.  Using default constructor (no inputs)
                        // means the dbconn object will try to determine where it's running
                        // and use the right connection string.
                        DbConn dbc = new DbConn();
                        //out.print("<h4>Connection Msg: "+dbc.getConnectionMsg()+"</h4>");
                        String dbError = dbc.getErr();
                        if (dbError.length() == 0) {
                            ProductTableSql wus = new ProductTableSql(dbc);

                            // insert the validated web user object
                            formMsg = wus.insert(ptValidate);
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

        <h1>Add Product</h1>
        <!-- Start of the form -->
        <form name="myForm" action="add_product.jsp" method="POST">
            <table style="text-align:left; padding: 10px;">
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="productName" value="<%= wuData.productName%>" /></td>
                        <td class="error"><%=ptValidate.getProductNameMsg()%></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="productPrice" value="<%= wuData.productPrice%>" /></td>
                        <td class="error"><%=ptValidate.getProductPriceMsg()%></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><input type="text" name="productType" value="<%= wuData.productType%>" /></td>
                        <td class="error"><%=ptValidate.getProductTypeMsg()%></td>
                    </tr>
                    <tr>
                        <td>Release Date</td>
                        <td><input type="text" name="productDate" value="<%= wuData.productDate%>" /></td>
                        <td class="error"><%=ptValidate.getProductDateMsg()%></td>                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td class="error"><%=formMsg%></td>
                        <td><a href="product_table.jsp">list products</a></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <!-- End of the form -->

        <%@ include file= "post-content.html" %> 
    </body>
</html>
