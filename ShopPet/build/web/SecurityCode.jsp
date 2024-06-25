<%-- 
    Document   : SecurityCode
    Created on : Mar 2, 2024, 9:58:12 PM
    Author     : nhutm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Verify Code</title>
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
            background-color: #F0F0F0;
        }
       
        form{
            margin: 0 20px;
            width: 100%;
            display: grid;
            max-width: 440px;
            background-color: #FFF;
            padding: 20px 40px;
            border-radius: 5px;
            position: relative;
        }
        form h1{
            color: #000;
            text-align: left;
            font-family: 'Roboto Slab';
            font-weight: 700;
            letter-spacing: 1.12px;
            margin: 0;
            position: relative;
            margin-bottom: 20px;
            font-size: 24px;
        }
        form > div:nth-child(1){
            border-bottom: 1px solid rgba(0, 0, 0, 0.10);
            margin: 0 -40px;
            padding: 0 20px;
        }
     
        form input{
            box-sizing: border-box;
            height: 45px;
            border-radius: 5px;
            border: 1px solid rgba(0, 0, 0, 0.30);
            background: #FFF;
            outline: none;
            color: rgba(0, 0, 0, 0.70);
            padding-left: 20px;
            font-size: 16px;
            
        
        }
        form > input{
            margin: 0 -20px;
        }
        form > input.error{
              border: 0.5px solid #F20505;
        }
        form p{
            color: #000;
            margin: 0;
            text-align: left;
            font-family: 'Poppins';
            font-size: 18px;
            font-weight: 300;
            margin:20px -20px 20px -20px;
            
        }
        form p:nth-child(4){
            font-size: 14px ;
            margin: 10px -20px 20px -20px;
        }
        form > div:nth-child(5){
            border-top: 1px solid rgba(0, 0, 0, 0.10);
            margin: 0px -40px 0 -40px ;
            padding: 10px 20px;
            display: flex;
            column-gap: 20px;
            justify-content: flex-end;
        }
        form > div:nth-child(5) > input{
            min-width: 130px;
            padding: 0;
            font-family: 'Roboto Slab';
            font-weight: 500;
            font-size: 16px;
            letter-spacing: 0.04em;
            color: #000;
            border: 1px solid rgba(0, 0, 0, 0.70);
            cursor: pointer;
            
        }
        form > div:nth-child(5) > input:nth-child(2){
            color: #FFFFFF;
            background-color: #FFAA00;
            border: none;
        }
    </style>
    
    
        
    </head>
    <body>
        <form action="DispatchServlet" method="post" class="form-forgot-password">
            <div>
                <h1>Enter the security code</h1>
            </div>
            <% 
                boolean error =  false;
                if(request.getAttribute("messageError") != null){
                    error = true;
                }
            %>
            <p>Please check your email for a message with the code. Your code has 8 characters.</p>
            <input type="text" name="txtCode" id="code" placeholder="<%= error ? request.getAttribute("messageError") : "Insert code here"  %>"  /> 
            <p>We sent you the code to: <%= request.getParameter("txtEmail") %></p>
            <div>
                <input type="submit" name="btAction"  value="Cancel" />
                <input type="submit" name="btAction" value="Continue" />
            </div>

        </form>
    </body>
</html>
