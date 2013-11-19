<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Zhan's Blog - Labs</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <SCRIPT language="JavaScript" SRC="myjavascript.js"></SCRIPT>

    </head>

    <body>
        <%@ include file= "pre-content.html" %> 

        <h1>Labs</h1>
        <h2>Lab Challenge #2 - 4/20/12 - jQuery</h2>
        <p>In this challenge, I added a jQuery function to all my tables that displays a table row in a different color when hovered over with the mouse. This makes it a bit easier for users to read a whole row of data from the table.</p>
        <p>I also finished the <a href="hideshow.html">hideshow.html</a> excercise.</p>
        <h2>Lab Challenge #1 - 4/20/12 - CSS Drop Down Menu</h2>
      <p>In this lab challenge, I created a new web page called <a href="menu.jsp">Menu</a> that has a drop down menu for all my navigation links.</p>
        <p>Since I am not a big fan of drop down menus, I did not incorporate it into my main website.</p>
        <h2>Lab #9 - 4/16/12 - Search</h2>
        <p>In this lab, I added search functionality to my <a href="search.jsp">Search page</a>. Users can filter results about other users by user name, product name, product type, or a post date of a message.</p>
<h2>Lab #8 - 4/10/12 - Associative Table</h2>
    <p>In this lab, I created my associative table called &quot;post_table&quot; on the MySQL database. I also implemented insertion of posts for my associative table through the <a href="product_table.jsp">Product</a> page. </p>
        <p> A user must log in first using a username and password from the list on the <a href="web_user.jsp">Web User</a> page. Once logged in, the user can then go to the <a href="product_table.jsp">Product</a> page and click on the icon to the right to create a post. The page will automatically load the user's ID and product ID of whichever product they are inserting a post for.</p>
        <p>Once the user has created a post, they can view the post on the <a href="post_table.jsp">View Posts</a> page.</p>
        <p>I also made a data model of my three tables. <a href="images/table.png">Here is the screen shot of it</a>.</p>
        <h2>Lab #7 - 3/26/12 - Log In/Security</h2>
<p>In this lab, I created several new pages listed below.</p>
        <p><a href="login.jsp">Log in</a><br />
          <a href="logout.jsp">Log out</a><br />
          <a href="admin.jsp">Admin page</a><br />
          <a href="edit.jsp">Edit page</a><br />
          <a href="view.jsp">View page</a><br />
        <a href="deny.jsp">Deny page</a></p>
        <p>There are 3 default usernames and passwords that visitors will be able to log in with: </p>
        <p>Admin : Admin<br />
        User : User<br />
        Guest : Guest</p>
        <p>Visitors can also log in with any of the registered accounts listed on the <a href="web_user.jsp">Web_User</a> page or <a href="register.jsp">Register</a> a new account and then loging in with the new account.</p>
        <p>Accounts can have 3 different roles, 1 for Admin, 2 for Users, and 3 for Guests.</p>
    <p> For now, these pages only restrict the users to certain pages depending on their user role. Admins have access to every page, while Users have access to the Edit and View pages, and Guests only have access to the View page. Visitors will also be thrown to the Deny page if they attempt to acess a page which they are forbidden from.        </p>
        <h2>Lab #6 - 3/18/12 - Delete</h2>
      <p>In this lab, I edited by Web User and Product pages to allow delete functionality to records. By clicking on the red x button, the user can delete that entire row of data from the table. The pages can be accessed through the &quot;Web User&quot; and &quot;Product&quot; pages on the nav bar, or from the links below.</p>
        <p><a href="web_user.jsp">Web User</a><br />
        <a href="product_table.jsp">Product</a></p>
        <h2>Lab #5 - 3/10/12 - Insert</h2>
        <p>In this lab, I edited my registration and add entertainment   pages to actually implement insertion into a MySQL database table when   they click on the submit button. The pages can be accessed through the   &quot;Register&quot; and &quot;Add&quot; links in the nav bar, or from the links below.</p>
      <p><a href="register.jsp">Register</a><br />
        <a href="add_product.jsp">Add Product</a></p>
<h2>Lab #4 - 2/19/12 - Display Data</h2>
      <p>In this lab, I created two new pages that reads information from a MySQL database table and displays them on the webpage. The pages reads information from the web_user and product_table tables from the cis-linux2 database. The pages can be accessed through the &quot;Web User&quot; and &quot;Product&quot; links on my navigation bar, or from the links below.</p>
        <p><a href="web_user.jsp">web_user</a><br />
            <a href="product_table.jsp">product_table</a></p>
        <h2>Lab #3 - 2/13/12 - JSP &amp; MySQL</h2>
        <p>In this lab, I created a web_user table and a product_table to the MySQL database both on my local machine and on cis-linux2. Here are some screenshots and links to my registration and add entertainment page:</p>
        <p><a href="images/web_user_local.jpg">Local web_user</a><br />
            <a href="images/web_user.jpg">Linux2 web_user</a><br />
            <a href="images/product_table.jpg">Linux2 product_table</a></p>
        <p><a href="register.jsp">Registration</a><br />
            <a href="add_product.jsp">Add Product</a></p>
        <p>I also converted all my .html files into .jsp files, added a user registration page, and added a post creation page. Both these new pages uses a java class called ValidationUtils.java to validate user input.</p>
        <h2>Lab #2 - 2/6/12 - Javascript &amp; Cookies</h2>
        <p>In this lab, I implemented a couple of Javascript features to the website. </p>
        <p>The first is a completely new Contacts page that uses Javascript to input a bunch of information from a viewer. It has features such as radio boxes, drop down menus, a date selector, text box inputs, etc. The page itself is also fully aligned and positioned using a table.</p>
        <p>The second feature I added to this site was a Javascript cookie added to the index page. Any first time viewer of the website will be asked to input their name upon viewing the index page. After the user has inputted their name, a pop up box will appear displaying something like &quot;Welcome back to the website, (insert name).&quot; The pop up box will show up everytime the viewer goes back to the index page. I feel like this will get annoying after a while, so I will change the cookie feature to something more subtle and less glaring in the future.</p>
        <p>I mostly used Netbeans and Google to solve my Javascript syntax errors. Netbeans is pretty good at this since if you have an error, it will show up as a red error message.</p>
        <p>To debug Javascript functions, I just used alerts to check what was going on and what values were currently being stored in my functions.</p>
        <h2>Lab #1 - 1/29/12 - Introduction</h2>
        <p>1) The topic of this website will be an entertainment blog. Users can create posts about any type of entertainment media they wish to discuss, such as games, movies, books, music, etc.</p>
        <p>2) The &quot;users&quot; will be any registered member of the website who can create a post about anything they want to write about.</p>
        <p>3) The &quot;other&quot; table will be the product that the user writes about. It can be anything from a game, movie, book, an album, etc.</p>
        <p>4) The &quot;associative&quot; table will be the posts left by the users about the product. For example, it can be a post about reviewing the product.</p>
        <p>5) Viewers of the site can read posts made by users. They can also leave comments and view other comments left by other viewers.</p>

        <%@ include file= "post-content.html" %> 
    </body>
</html>
