<%-- 
    Document   : Payment.jsp
    Created on : Mar 8, 2024, 5:02:41 PM
    Author     : nhutm
--%>

<%@page import="shoppet.product.productDAO"%>
<%@page import="shoppet.product.productDTO"%>
<%@page import="shoppet.registration.registrationDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="shoppet.registration.registrationDAO"%>
<%@page import="shoppet.validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Payment</title>
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Slab:wght@100..900&display=swap');
            ::-webkit-scrollbar{
                display: none;
            }
            body{
                margin: 0;
                scroll-behavior: none;
                background-color: #F0F0F0;
                   -moz-user-select: none !important;
                -webkit-touch-callout: none!important;
                -webkit-user-select: none!important;
                -khtml-user-select: none!important;
                -moz-user-select: none!important;
                -ms-user-select: none!important;
                user-select: none!important;
            }
            *{
                box-sizing: border-box;
            }
            .banner{
                height: 50px;
                background-color: #FFFFFF;
            }

            h3,ul,li,h4,h5{
                margin: 0;
            }
            a{
                text-decoration: none;
            }
            header{
                width: 100%;
                letter-spacing: 1px;
                background-color: #FFFFFF;
                position: relative;
                z-index: 10011;

            }
            header > div{
                width: 1180px;
                height: 70px;
                margin:0 auto;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
                align-items: center;

            }

            header > div > h3{
                grid-column-start:1;
                grid-column-end: 3;
                font-family: "Roboto Slab";
                /*                grid-column: 3;*/
                font-size: 22px;
                font-weight: 500;
                cursor: pointer;
            }
            header > div > ul{

                grid-column-start: 4;
                grid-column-end: 6;
                padding-inline-start: 0px;
                display: grid;
                grid-template-columns: repeat(2,80px);
                column-gap: 20px;
            }
             header > div > ul > li > a{
                text-decoration: none;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                color: rgb(0, 0, 0,0.8);
            }
            header > div > ul > li{
                display: flex;
                justify-content: center;
                font-family: "Roboto Slab";
                list-style: none;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                color: rgb(0, 0, 0,0.8);
            }
            header > div > .search-actived{
                grid-column-start: 6;
                grid-column-end: 10;
                display: flex;
                height: 35px;

            }
            header > div > div > button{
                width: 98px;
                border: none;
                background-color: #FFAA00;
                display: flex;
                border: 1px solid #FFAA00 ;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            header > div > div > button > img {
                margin-top: 2px;
            }
            header > div > .search-actived > input{
                width: 300px;
                outline: none;
                border: 1px solid rgb(0, 0, 0,0.5);
                font-size: 14px;
                font-family: 'Roboto Slab';
                letter-spacing: 1px;
                padding-left: 20px;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                border-right: none;
            }
            header > div > .login-register {
                grid-column: 10/13;
                display: flex;
            }
            header > div > .login-register > div.login-user{
                display: flex;
                width: 100%;
                justify-content: space-between;
            }
            header > div > .login-register > div.logout-user{
                display: flex;
                width: 100%;
                justify-content: space-between;
            }
            header > div > .login-register > div.user{
                display: none;
                justify-content: flex-end;
                position: relative;
                left: 100%;
                transform: translateX(-100%);
                column-gap: 20px;
            }
            header > div > .login-register.logged > div.login-user{
                display: none;
            }
            header > div > .login-register.logged > div.user{
                display: flex;
            }
            header > div > .login-register.logged > div.user >  .user-profile-hover{
                position: absolute;
                left: -10px;
                top:80%;
                padding: 27px 20px;
                display: none;
                z-index: 1000;
            }
            header > div > .login-register.logged > div.user >  .user-profile-hover:hover{
                display: block;
            }
            header > div > .login-register.logged > div.user >  .user-profile-hover.active{
                display: block;
            }
            header > div > .login-register.logged > div.user >  .user-profile-hover > ul{
                width: 140px;
                background-color: #FFFFFF;
                margin: 0 -10px;
                padding: 10px 0;
                border: 1px solid rgba(0,0,0,0.09);
                border-top: none;
                z-index: 100;
                border-radius: 0 0 5px 5px;
            }
            
            header > div > .login-register.logged > div.user >  .user-profile-hover> ul > li{
                margin: 10px;
            }
            header > div > .login-register.logged > div.user >  .user-profile-hover> ul > li > a{
                text-decoration: none;
                font-family: "Roboto Slab";
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
                color: rgb(0, 0, 0,0.7);
            }
            header > div > .login-register.logged > div.user >  .user-profile-hover> ul > li > a:hover{
                 color: rgb(0, 0, 0,0.9);
            }
            header > div > .login-register > div.user > img{
                height:22.5px;
                width: 22.5px;
                cursor: pointer;
            }

            .text{
                font-size: 16px;
                width: 130px;
                height: 40px;
                font-family: "Roboto Slab";
                border-radius: 5px;
                font-weight: 600;
                font-size: 16px;
                cursor: pointer;
                outline: none;
                border: none;
                letter-spacing: 1px;
            }
            .text.regis{
                background-color: transparent;
                border: 1px solid #4F4A4A;
                color: #4F4A4A;
            }
            
            .text.logout{
                background-color: #FFAA00;
                color: #FFFFFF;
            }
            .text.login{
                background-color: #FFAA00;
                color: #FFFFFF;
            }
        </style>
        <style>
            .container{
                width: 1180px;
                margin:  50px auto;
                padding: 50px 0;
                position: relative;
                background-color: #FFFFFF;
            }
            .container > form{
                display: grid;
                grid-template-columns: repeat(12,80px);
                gap: 20px;
            }
            .container > form > div:nth-child(1){
                grid-column: span 12;
                display: flex;
                justify-content: flex-start;
                align-items: center;
                column-gap: 10px;
                margin-bottom: 15px;
            }
            .container > form > div:nth-child(1) > img{
                margin-left: 20px;
                width: 20px;
                height: auto;
            }
            .container > form > div:nth-child(1) > span{
                font-family: 'Roboto Slab';
                font-weight: 500;
                font-size: 18px;
                color: #FFAA00;
            }
            .container > form > .user-info{
                grid-column: span 12;
                display: grid;
                grid-template-columns: 2.5fr 1.5fr 8fr;
                column-gap: 20px;
                align-items: center;
                margin-bottom: 50px;
            }
            .container > form > .user-info > h3:nth-child(1){
             
                margin-left: 20px;
                font-family: 'Roboto Slab';
                font-weight: 500;
                font-size: 16px;
                 color: rgba(0,0,0,0.7);
             
            }
            .container > form > .user-info > h3:nth-child(2){
              
                font-family: 'Roboto Slab';
                font-weight: 500;
                font-size: 16px;
                 color: rgba(0,0,0,0.7);
            }
            .container > form > .user-info > span:nth-child(3){
              font-family: 'Poppins';
              font-weight: 400;
              font-size: 15px;
            }
            .container > form > .user-info > div{
              font-family: 'Poppins';
              font-weight: 400;
              font-size: 15px;
              color: blue;
              cursor: pointer;
            }
            .container > form > .line{
                grid-column: span 12;
                height: 1px;
                background-color: rgba(0,0,0,0.09);
            }
            .container > form > .title-products{
                grid-column:  span 12;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
              
            }
            .container > form > .title-products > li{
                grid-column: span 2;
                font-family: 'Roboto Slab';
                font-weight: 400;
                font-size: 16px;
                color: #4F4A4A;
                letter-spacing: 0.75px;
                text-align: center;
            }
            .container > form > .title-products > li:nth-child(1){
                margin-left: 20px;
                font-weight: 500;
                font-size: 16px;
                 color: rgba(0,0,0,0.8);
            }
            .container > form > .title-products > li:nth-child(2){
                grid-column-start: 7;
                grid-column-end: 9;
            }
            .container > form > .title-products > li:last-child{
                margin-right: 20px;
            }
      
            .container > form > .products{
                grid-column: span 12;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
                align-items: center;
                margin-bottom: 20px;
                position: relative;
            }
            .container > form > .products > .delete{
                width: 30px;
                height: 30px;
                background-color: #E0E0E0;
                display: flex;
                justify-content: center;
                align-items: center;
                position: absolute;
                top:0;
                right:0;
                
            }
            .container > form > .products > .delete > a{
                position: absolute;
                width: 100%;
                height:100%;
                background-color: transparent;
                color:transparent;
            }
            .container > form > .products > div:nth-child(1){
                grid-column: 1/4;
                width: 260px;
                height: 170px;
                margin-left: 20px;
                overflow: hidden;
                position: relative;
            }
            .container > form > .products > div:nth-child(1) > img{
                width:100%;
                min-height: 170px;
                object-fit: cover;
            }
            .container > form > .products > h3{
                grid-column: 4/7;
                font-family: 'Poppins';
                font-size: 16px;
                color:#4F4A4A;
                font-weight: 400;
                letter-spacing: 0.75px;
            }
            .container > form > .products > span:nth-child(3){
                grid-column: 7/9;
                font-family: 'Poppins';
                font-size: 16px;
                font-weight: 500;
                letter-spacing: 0.75px;
                 color: rgba(0,0,0,0.8);
                 text-align: center;
            }
             
            .container > form > .products > div:nth-child(4){
                grid-column: 9/11;
               width:120px;
               height: 30px;
               position: relative;
               left:50%;
               transform: translateX(-50%);
               display: flex;
               justify-content: space-between;
               align-items: center;
            }
            
            .container > form > .products > div:nth-child(4) > span{
                font-family: 'Poppins';
                font-size: 16px;
                font-weight: 500;
                
                letter-spacing: 0.75px;
                color: rgba(0,0,0,0.8);
                text-align: center;
            }
            .container > form > .products > div:nth-child(4) > div{
                width: 30px;
                height: 30px;
                background-color: #E0E0E0;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }
            .container > form > .products > div:nth-child(4) > div > a{
                position: absolute;
                width: 100%;
                height: 100%;
                background-color: transparent;
                color: transparent;
            }
            
            
            
            .container > form > .products > h4{
                grid-column: 11/13;
                font-family: 'Poppins';
                font-weight: 400;
                letter-spacing: 0.75px;
                font-size: 18px;
                margin-right: 20px;
                color: #F20505;
                text-align: center;
            }
            .container > form > .payment_method{
                grid-column:  span 12;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 12px;
                align-items: center;
            }   
            .container > form > .payment_method > h3{
                grid-column: 1/4;
                font-family: 'Roboto Slab';
                font-size: 16px;
                font-weight: 500;
                letter-spacing: 0.75px;
                 color: rgba(0,0,0,0.8);
                margin-left: 20px;
            }
            .container > form > .payment_method > div{
                grid-column: span 2;
                width: 180px;
                height: 40px;
                display: flex;
                justify-content: center;
                color: #FFAA00;
                font-family: 'Poppins';
                font-size: 14px;
                align-items: center;
                border: 1px solid #FFAA00;
                position: relative;
            }
            .container > form > .payment_method > div::after{
                content: '';
                position: absolute;
                bottom: 0;
                right: 0;
                width: 0;
                height: 0;
                border-style: solid;
                border-width: 7px;
                border-color: transparent  #FFAA00  #FFAA00 transparent ;
                
            }
        
            .container > form > .total{
                grid-column: span 12;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
            }
            .container > form > .total > table{
                height: 150px;
                grid-column: 9/13;
                margin-right: 20px;
            }
            .container > form > .total > table  td{
                text-align: right;
                font-family: 'Poppins';
                font-size: 15px;
                font-weight: 500;
                letter-spacing: 0.75px;
                color: #4F4A4A;
            }
            .container > form > .total > table  td > h3{
                color: #F20505;
                font-size: 20px;
                font-weight: 600;
            }
            .container > form > .total > table  th{
                text-align: left;
                font-family: 'Roboto Slab';
                font-size: 15px;
                font-weight: 500;
                color: rgba(0,0,0,0.8);
            }
      
            .container > form > .btOrder{
                grid-column:  span 12;
                display: flex;
                justify-content: flex-end;
            }
            .container > form > .btOrder > input{
                width: 260px;
                height: 60px;
                border: none;
                outline: none;
                background-color: #FFAA00;
                color: #FFFFFF;
                font-family: 'Poppins';
                font-size: 18px;
                font-weight: 500;
                letter-spacing: 0.75px;
                padding-block: 0px;
                padding-inline: 0px;
                margin-right: 20px;
                cursor: pointer;
            }
             .pop-up{
                position: absolute;  
                width: 100%;
                height: 110vh;
                background-color: rgba(255,255,255,0.6);
                z-index: 1;
                display: none;
                justify-content: center;
            }
            .pop-up.show{
                display: flex;
            }
            .pop-up .content-pop-up{
                width: 680px;
                height: 300px;
                background-color: #E0E0E0;
                margin-top: 20vh;
                border-radius: 5px;
                position: relative;
               
            }
            .pop-up .content-pop-up > h3{
                margin: 50px 20px 20px 20px;
                word-wrap: break-word;
                word-break: break-all;
                font-family: 'Poppins';
                font-size: 24px;
                color:#F20505;
                font-weight: 400;
                letter-spacing: 0.75px;
            }
            .pop-up .content-pop-up > div{
                width:30px;
                height: 30px;
                background-color: #FFFFFF;
                position: absolute;
                right:0;
                top:0;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
            }
            .pop-up .content-pop-up > div > img{
                width: 24px;
                height: 24px;
            }
            ul{
                padding-inline-start: 0px;
            }
            li{
                list-style: none;
            }
        </style>
        
         <script>
              let cookie = document.cookie;
              let cookies = cookie.split(";");
              let _e = false;
              let _p = false;
              let _r = false;
              for(let i =0; i < cookies.length; i++){
                  if(cookies[i].substring(1,3) === "_e") _e = !_e;
                   if(cookies[i].substring(1,3) === "_p") _p = !_p;
                    if(cookies[i].substring(1,3) === "_r") _r = !_r;
              }
              if(!_e && !_p && !_r){
                  location.href ="DispatchServlet?btAction=Login";
              }
        </script>
    </head>
    <body>
           <% 
             boolean authenticate =  false;
            try{
                Cookie[] cookie = request.getCookies();
                if(cookie != null){
                    String email = "", password ="";
                    boolean role = false;
                    int emailCount = 0, passwordCount = 0, roleCount = 0;
                    for(int i = cookie.length -1; i >= 0; i-- ){
                        if(cookie[i].getName().equals("_e") && emailCount == 0 ){
                            email = Validation.decoded(cookie[i].getValue());
                            emailCount++;
                        }
                        if(cookie[i].getName().equals("_p") && passwordCount == 0){
                            password = Validation.decoded(cookie[i].getValue());
                            passwordCount++;
                        }
                        if(cookie[i].getName().equals("_r") && roleCount == 0 ){
                            role = Boolean.parseBoolean(Validation.decoded(cookie[i].getValue()));
                            roleCount++;
                        }
                        if(emailCount == 1 && passwordCount == 1 && roleCount == 1 ) break;
                    }
                    if(!email.equals("") && !password.equals("") && !role){
                        registrationDAO dao = new registrationDAO();
                        authenticate = dao.authentication(email, password, role);
                    }
                  
                }
                if (!authenticate) response.sendRedirect("DispatchServlet?btAction=Login");
            }catch(SQLException | NamingException ex){
                 ex.printStackTrace();
            }
           
        
        
        
        %>
        
        
        <div class="banner"></div>
        <header>
            <div>

                <h3 id="logo">
                    SHOP PET
                </h3>
               <script>
                   const logoBehavior = document.getElementById("logo");
                   logoBehavior.addEventListener('click', () => {
                       location.href ="Home.html";
                   })
               </script>
                <ul>
                    <li><a href="Home.html" >Home</a></li>
                    <li><a href="Shopping.jsp" >Shop</a></li>
                </ul>

                <div class="search-actived">
                    <input type="text" name="txtSearch" id="searchValue" placeholder="Search product..." >
                    <button id="btActionSearch">
                        <img src="./img/search_icon white.svg" alt="">
                    </button>
                    <script>
                            const btSearch = document.getElementById("btActionSearch");
                            const searchValue = document.getElementById("searchValue");
                            btSearch.addEventListener('click', ()=>{
                                location.href ="DispatchServlet?btAction=Search&SearchValue="+searchValue.value;
                            })
                     </script>
                </div>
              
               <div  class="<%= authenticate? "login-register logged": "login-register"%>">
                    <div class="user">
                        <img src="./img/user.svg" alt="" id="profile-user">
                        <div class="user-profile-hover" id="user-profile-hover">
                            <ul>
                                <li><a href="DispatchServlet?btAction=Account&item=profile" >Account</a></li>
                                <li><a href="DispatchServlet?btAction=Account&item=purchase" >Purchase Order</a></li>
                                <li><a href="DispatchServlet?btAction=Logout" >Logout</a></li>
                            </ul>
                        </div>
                        <script>
                            
                            
                            
                            const profileUser = document.getElementById("profile-user");
                            const userProfileHover = document.getElementById("user-profile-hover");
                            profileUser.addEventListener('pointerenter', () => {
                                userProfileHover.classList.add("active");
                            })
                            profileUser.addEventListener('pointerleave', () => {
                                userProfileHover.classList.remove("active");
                            })
                            profileUser.addEventListener('click', () => {
                            location.href = "Account.jsp";
                            })
                        </script>
                        <img src="./img/cart-header.svg" alt="" id="cart">
                        <script>
                                    const cart = document.getElementById("cart");
                            cart.addEventListener('click', () => {
                            location.href = "Cart.jsp";
                            })
                        </script>
                    </div>
                    <div class="login-user">
                            <input class="text regis" type="submit" value="Register" id="register"/>
                            <input class="text login" type="submit"  value="Login" id="login" />
                            <script>
                                const btRegister = document.getElementById("register");
                                const btLogin = document.getElementById("login");
                                btRegister.addEventListener('click', () =>{
                                    location.href ="Register.jsp";
                                })
                                btLogin.addEventListener('click', () =>{
                                    location.href ="Login.jsp";
                                })
                            </script>
                    </div>
                </div>

            </div>
        </header>
                    
          <% 
            HttpSession sessionProducts = request.getSession();
            HashMap<String, Integer> listProductsBuy = ( HashMap<String, Integer>)sessionProducts.getAttribute("LIST_PRODUCTS_BUY");
            registrationDTO user = (registrationDTO)sessionProducts.getAttribute("USER");
            int costOfGoods  = 0;
            int transportFree = 20;
          %>
           
          <% 
            HttpSession sessionError = request.getSession();
           
            String ERROR_MESSAGE = (String)sessionError.getAttribute("ERORRMESSAGE");
            if(sessionError.getAttribute("ERORRMESSAGE") != null ) sessionError.removeAttribute("ERORRMESSAGE");
          %>
          <div class="<%= ERROR_MESSAGE != null && !ERROR_MESSAGE.equals("") ? "pop-up show" :"pop-up" %>" id="pop-up"   >
              <div class="content-pop-up">
                  <div id="close">
                      <img src="./img/close.svg" alt="close" />
                  </div>
                  <h3> <%= ERROR_MESSAGE %> </h3>
              </div>
          </div>
          <script>
              const popUp = document.getElementById("pop-up");
              const btClose = document.getElementById("close");
              btClose.addEventListener('click', () =>{
                  popUp.classList.remove('show');
              })
          </script>
          
         <div class="container">
             
             <form action="DispatchServlet" >
                <div>
                    <img src="img/addressdelivery.svg" alt="" />
                    <span>
                        Delivery Address
                    </span>
                </div>
                <div class="user-info">
                    <h3>
                        <%= user.getFullname() %>
                    </h3>
                    <h3>
                        <%= user.getPhone() %>
                    </h3>
                    <span id="address">
                       <%= user.getAddress() %>
                       <input type="hidden" name="txtAddress" value=" <%= user.getAddress() %>" />
                    </span>
                  
               
                </div>
                <div class="line"></div>
                <ul class="title-products">
                    <li>Product</li>
                    <li>Unit price</li>
                    <li>Quantity</li>
                    <li>Amount of money</li>
                </ul>
                <div class="line"></div>
                
                <% 
                    productDAO dao = new productDAO();
                    if(listProductsBuy != null){
                        for(String item : listProductsBuy.keySet()){
                            productDTO product = dao.getProductDetail(item);
                           %>
                                     <div class="products">
                                        <div>
                                            <img src="<%="./img/img-product/" + product.getImg() %>" alt="">
                                        </div>
                                        <h3>
                                            <%= product.getName() %>
                                        </h3>
                                        <span>
                                           <%= product.getPrice() %>$
                                        </span>
                                       
                                           
                                          <div class="quantity">
                                                <div >
                                                   <img src="./img/minus.svg" alt="">
                                                   <a href="<%= "DispatchServlet?btAction=Reduce&idProduct=" +product.getId() +"&currQuantity="+ listProductsBuy.get(item) +"&where=PAYMENT"  %>"   >
                                                       minus
                                                   </a>
                                                </div>
                                                <span ><%= listProductsBuy.get(item)  %></span>
                                                <div >
                                                    <img src="./img/plus.svg" alt="">
                                                    <a href="<%= "DispatchServlet?btAction=Increase&idProduct=" +product.getId() +"&currQuantity="+ listProductsBuy.get(item) + "&where=PAYMENT"  %>"  >
                                                       plus
                                                    </a>
                                                </div>


                                            </div>
                                           
                                       
                                        <h4>
                                            <%
                                                costOfGoods += listProductsBuy.get(item)*product.getPrice();
                                            %>
                                           <%=listProductsBuy.get(item)*product.getPrice() %>$
                                        </h4>
                                        
                                        
                                        
                                        <div class="delete">
                                            <img src="./img/delete.svg" />
                                            <a href="<%= "DispatchServlet?btAction=DeleteInPayment&idProduct=" + product.getId() %>">
                                                delete
                                            </a>
                                        </div>
                                    </div>

                            <% 
                        }
                    }
                %>
               
                
                
                <div class="line"></div>
                <div class="payment_method">
                    <h3>
                        Payment methods
                    </h3>
                    <div>
                        Payment on delivery
                    </div>
                </div>
                <div class="line"></div>
                <div class="total">
                    <table>
                        <tr>
                            <th>Total cost of goods</th><td><%= costOfGoods %> $</td>
                        </tr>
                        <tr>
                            <th>Transport fee</th><td id="transportFee"><%= transportFree %>$</td>
                            <input type="hidden" name="txtTransportFee" value="<%= transportFree %>" />
                        </tr>
                        <tr>
                            <th>Total payment</th><td><h3 id="TotalPrice"><%= costOfGoods + transportFree %>$</h3></td>
                            <input type="hidden" name="txtTotal" value="<%= costOfGoods + transportFree %>" />
                        </tr>
                           
                       
                    </table>
                </div>
                <div></div>
                <div class="btOrder">
                    <input type="submit" name="btAction" value="Order" />
                </div>
            </form>
        </div>
    </body>
</html>
