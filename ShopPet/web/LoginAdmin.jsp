<%-- 
    Document   : LoginAdmin
    Created on : Mar 2, 2024, 9:47:53 PM
    Author     : nhutm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Login Admin</title>
        <style>
            
             @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap');

        a{
            color:#5A86BF;
        }
        body{
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form{
            margin: 0 20px;
            width: 100%;
            display: grid;
            max-width: 440px;
        }
        form h1{
            color: #000;
            text-align: center;
            font-family: 'Roboto Slab';
            font-weight: 700;
            letter-spacing: 1.12px;
        }

        form div{
            display: grid;
            margin-bottom: 10px;
        }
        form div input{
            box-sizing: border-box;
            height: 45px;
            border-radius: 5px;
            border: 0.5px solid rgba(0, 0, 0, 0.70);
            background: #FFF;
            outline: none;

            color: rgba(0, 0, 0, 0.70);
            padding-left: 20px;
            font-size: 16px;
        
        }
        form div label{
            color: rgba(0, 0, 0, 0.70);
            font-family: 'Poppins';
            font-size: 16px;
            font-weight: 300;
            letter-spacing: 0.64px;
        }
        form div:nth-child(3) label:nth-child(4){
            width: 100%;
            text-align: right;
        }
        form div > label:nth-child(3){
            color:#F20505;
        }
        form > input{
            height: 50px;
            border-radius: 5px;
            background: #FFAA00;
            color: #FFF;
            font-family: 'Roboto Slab';
            font-size: 18px;
            font-weight: 700;
            letter-spacing: 0.72px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }
        form p{
            color: #000;

            text-align: center;
            font-family: 'Poppins';
            font-size: 18px;
            font-weight: 300;
            letter-spacing: 0.72px;
            margin-top: 50px;
            margin-bottom: 10px;
        }
       
        
        </style>
    </head>
    <body>
        <% 
            String ERROR_EMAIL = (String)request.getAttribute("ERROR_EMAIL");
            String ERROR_PASSWORD = (String)request.getAttribute("ERROR_PASSWORD");
            
        %>
         <form action="DispatchServlet" method="post">
                <h1>Login Admin </h1>
                <div>
                    <label for="Email">Email</label>
                    <input type="text" name="txtEmail" />
                    <label><%= ERROR_EMAIL != null ? ERROR_EMAIL : "" %></label>
                </div>
                <div>
                    <label for="Password">Password</label>
                    <input type="password" name="txtPassword" />
                    <label><%= ERROR_PASSWORD != null ? ERROR_PASSWORD : "" %></label>
                    <label><a href="ForgotPassword.jsp">Forgot password?</a></label>
                </div>
                <input type="hidden" name="txtRole" value="true" />
                <input type="submit" name="btAction" value="Login" />
                <p>Customer ? <a href="./Login.jsp">Login to shopping</a></p>
          </form>
    </body>
</html>
