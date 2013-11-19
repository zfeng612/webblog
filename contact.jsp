<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Contact</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>

        <style>


            /* the div that holds the date picker calendar */
            .dpDiv {
            }


            /* the table (within the div) that holds the date picker calendar */
            .dpTable {
                font-family: Tahoma, Arial, Helvetica, sans-serif;
                font-size: 12px;
                text-align: center;
                color: #505050;
                background-color: #ece9d8;
                border: 1px solid #AAAAAA;
            }


            /* a table row that holds date numbers (either blank or 1-31) */
            .dpTR {
            }


            /* the top table row that holds the month, year, and forward/backward buttons */
            .dpTitleTR {
            }


            /* the second table row, that holds the names of days of the week (Mo, Tu, We, etc.) */
            .dpDayTR {
            }


            /* the bottom table row, that has the "This Month" and "Close" buttons */
            .dpTodayButtonTR {
            }


            /* a table cell that holds a date number (either blank or 1-31) */
            .dpTD {
                border: 1px solid #ece9d8;
            }


            /* a table cell that holds a highlighted day (usually either today's date or the current date field value) */
            .dpDayHighlightTD {
                background-color: #CCCCCC;
                border: 1px solid #AAAAAA;
            }


            /* the date number table cell that the mouse pointer is currently over (you can use contrasting colors to make it apparent which cell is being hovered over) */
            .dpTDHover {
                background-color: #aca998;
                border: 1px solid #888888;
                cursor: pointer;
                color: red;
            }


            /* the table cell that holds the name of the month and the year */
            .dpTitleTD {
            }


            /* a table cell that holds one of the forward/backward buttons */
            .dpButtonTD {
            }


            /* the table cell that holds the "This Month" or "Close" button at the bottom */
            .dpTodayButtonTD {
            }


            /* a table cell that holds the names of days of the week (Mo, Tu, We, etc.) */
            .dpDayTD {
                background-color: #CCCCCC;
                border: 1px solid #AAAAAA;
                color: white;
            }


            /* additional style information for the text that indicates the month and year */
            .dpTitleText {
                font-size: 12px;
                color: gray;
                font-weight: bold;
            }


            /* additional style information for the cell that holds a highlighted day (usually either today's date or the current date field value) */ 
            .dpDayHighlight {
                color: 4060ff;
                font-weight: bold;
            }


            /* the forward/backward buttons at the top */
            .dpButton {
                font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;
                font-size: 10px;
                color: gray;
                background: #d8e8ff;
                font-weight: bold;
                padding: 0px;
            }


            /* the "This Month" and "Close" buttons at the bottom */
            .dpTodayButton {
                font-family: Verdana, Tahoma, Arial, Helvetica, sans-serif;
                font-size: 10px;
                color: gray;
                background: #d8e8ff;
                font-weight: bold;
            }

        </style>
    </head>



    <body>
        <%@ include file= "pre-content.html" %> 

        <h1>Contact</h1>
        <form name="myForm" method="post" action="http://www.temple.edu/cgi-bin/mail?tuc71760@temple.edu">
            <!--Start of the table--> 
            <table cellpadding="10">
                <tr>
                    <td>
                        What is Your Name?
                    </td>
                    <td>
                        <input type="text" name="userName"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select a date
                    </td>
                    <td>
                        <input name="ADate"> <input type=button value="select" onclick="displayDatePicker('ADate');">
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                        What is your Sex?
                                    </td>
                                    <td>
                                        <input type="radio" name="userSex" value="M"/>   Male
                                        <input type="radio" name="userSex"  value="F"/>    Female
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Are you a registered user?
                                    </td>
                                    <td>
                                        <input type="checkbox" name="isUser"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Which category are you emailing about?
                                    </td>
                                    <td>
                                        <select name="category" >
                                            <option value="Games" >Games</option>
                                            <option value="Music">Music</option>
                                            <option value="Movies">Movies</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Comments or Suggestions?
                                    </td>
                                    <td>
                                        <textarea name="inputcomments" cols="45" rows="5"></textarea> <br/> <br/>
                                        <input type="submit" value="Send Email"/>
                                    </td>
                                </tr>
                                </table> 
                                <!-- End of the table--> 
                                </form>

                                <%@ include file= "post-content.html" %> 
                                </body>
                                </html>
