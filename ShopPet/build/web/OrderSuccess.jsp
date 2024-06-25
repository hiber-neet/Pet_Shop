<%-- 
    Document   : OrderSuccess
    Created on : Mar 15, 2024, 6:42:45 PM
    Author     : nhutm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Order</title>
        <style>
              @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap');
          
            body{
                 margin: 0;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #F0F0F0;
            }
           .information{
                margin: 0 20px;
                width: 100%;
                display: grid;
                max-width: 440px;
                background-color: #FFF;
                padding: 20px 40px;
                border-radius: 5px;
                position: relative;
                min-height: 200px;
            }
            .information > span{
                color: #000;
                margin: 0;
                text-align: left;
                font-family: 'Poppins';
                font-size: 14px;
                font-weight: 300;
                margin-top: 20px;
                
            }
            h1{
                color: #000;
                text-align: left;
                font-family: 'Roboto Slab';
                font-weight: 700;
                letter-spacing: 1.12px;
                margin: 0;
                position: relative;
                margin-top: 30px;
                font-size: 28px;
            }
            p{
                color: #000;
                margin: 0;
                text-align: left;
                font-family: 'Poppins';
                font-size: 18px;
                font-weight: 300;
                margin:15px 0 30px 0;
            }
            a{
                font-family: 'Poppins';
                box-sizing: border-box;
                height: 55px;
                border-radius: 5px;
                color: #FFF;
                font-size: 16px;
                width: 180px;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #FFAA00;
                position: relative;
                left: 100%;
                transform: translateX(-100%);
                margin-bottom: 20px;
                cursor: pointer;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="information">
            <span>
                The website will redirect to the Shopping page later : <span id="second"> 10 </span>
            </span>
            <h1>Pet Shop sincerely thanks you</h1>
            <p>Thank you customers for loving and purchasing from pet shop. We wish you good health. If you have any problems with the product,
                please contact shop pet via: shoppet@gmail.com. Please wait for Pet Shop's goods to be delivered to you in the next few days !</p>
            <a href="./Shopping.jsp" >Back To Shopping</a>
        </div>
        <script>
            
            let countdown = 9; 

            const interval = setInterval(() => {
              if (countdown <= 0) {
                clearInterval(interval);
                 window.location.href = "./Shopping.jsp";
              }
              document.querySelector("#second").textContent = countdown;
              countdown = countdown - 1;
            }, 1000);
        </script>
    </body>
</html>
