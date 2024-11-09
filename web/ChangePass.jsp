<%-- 
    Document   : ChangePass
    Created on : Oct 29, 2024, 7:06:14 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/nigga.css.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

        <style>
            /* Add some basic styling */
            body {
                 background-color: gray;
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                padding-left: 2em;
                padding-right: 2em;
                padding-bottom: 0.4em;
                background-color: #171717;
                border-radius: 25px;
                transition: .4s ease-in-out;
            }

            input {
                width: 100%;
                padding: 8px;
                margin: 8px 0;
            }
            button {
                padding: 0.5em;
  padding-left: 1.1em;
  padding-right: 1.1em;
  border-radius: 5px;
  margin-right: 0.5em;
  border: none;
  outline: none;
  transition: 0.4s ease-in-out;
  background-color: #252525;
  color: white;
            }
            .form:hover {
  transform: scale(1.05);
  border: 1px solid black;
}
input-field {
  background: white;
  border: none;
  outline: none;
  width: 100%;
  color: #d3d3d3;
}
 label {
            color: white;
        }
         .page-title {
            color: white;
            font-size: 24px;
            text-align: center;
        }
        </style>
    </head>
    <body>
         <c:if test="${not empty errorMessage}">
        <div class="error-message">
            ${errorMessage}
        </div>
    </c:if>
        <form action="ChangePassController" method="post" class="form" style="
    padding-right: 50px;
">
            <h1 class="page-title">Change Password</h1>
            <label for="email">Email:</label>
            <input class="input-field" type="text" id="email" name="email" required="">

            <label for="newPassword">New Password:</label>
            <input class="input-field" type="password" id="password" name="password" required="">

            <label for="confirmPassword">Confirm Password:</label>
            <input class="input-field" type="password" id="confirmPassword" name="confirmPassword" required="">

            <button class="button1" type="submit">Change Password</button>
        </form>
       
    </body>
</html>
