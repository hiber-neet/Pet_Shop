<%-- 
    Document   : Account.jsp
    Created on : Mar 3, 2024, 6:48:25 PM
    Author     : nhutm
--%>

<%@page import="shoppet.product.productDAO"%>
<%@page import="shoppet.cookie.CookieService"%>
<%@page import="shoppet.order.OrderDetailDTO"%>
<%@page import="shoppet.order.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="shoppet.order.OrderDTO"%>
<%@page import="shoppet.registration.registrationDTO"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="shoppet.registration.registrationDAO"%>
<%@page import="shoppet.validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | <%= "User name" %></title>
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Slab:wght@100..900&display=swap');
             body{
                margin: 0;
                scroll-behavior: none;
                background-color: #F0F0F0;
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
                margin: 30px auto 0 auto;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
            }
            .container .user-profile-nav{
                grid-column: 1/4;

            }
            .container .user-profile-nav .user-avatar{
                display: flex;
                align-items: center;
                column-gap: 10px;
                margin-bottom: 30px;
            }
            .container .user-profile-nav .user-avatar > ._img{
                width: 50px;
                height: 50px;
                background-color: #4F4A4A;
                border-radius: 50%;
            }
            .container .user-profile-nav .user-avatar > span{
                font-family: 'Roboto Slab';
                font-weight: 300;
                font-size: 14px;
                line-height: 18px;
                color: #000000;
            }
            .container .user-profile-nav > div:nth-child(2){
                height:1px;
                background-color: rgb(0, 0, 0,0.3);
            }
            
            ul{
                padding-inline-start: 0px;
            }
            li{
                list-style: none;
            }
            .container .user-profile-nav >  ul:nth-child(3){
                margin-top: 40px;
            }
            .container .user-profile-nav >  ul:nth-child(3) > li{
                margin-bottom: 15px;
                display: flex;
                align-items: center;
                column-gap: 15px;
                /* My Account */

                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 500;
                font-size: 14px;
                line-height: 18px;
                color: #4F4A4A;

                cursor: pointer;
            }
            .container .user-profile-nav >  ul:nth-child(3) > li.active{
                color:#F20505;
            }
            .container .user-profile-nav >  ul:nth-child(3) > li.active > img.red{
                display: block
            }
            .container .user-profile-nav >  ul:nth-child(3) > li.active > img.non-red{
                display: none;
            }
             .container .user-profile-nav >  ul:nth-child(3) > li > img.red{
                display: none;
            }
             .container .user-profile-nav >  ul:nth-child(3) > li > img.non-red{
                display: block;
            }
            .container .user-profile-nav >  ul:nth-child(3) > li > img{
                width: 24px;
                height: 24px;
            }
            .container .content{
                grid-column: 4/13;
            }
            .container .content .head-content{
                height: 50px;
                background-color: #FFFFFF;
                margin-bottom: 20px;
            }
            .container .content .head-content > ul{
                display: grid;
                grid-template-columns: repeat(9,80px);
                column-gap: 20px;
                height: 100%;
            }
            .container .content .head-content > ul > li{
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 400;
                font-size: 15px;
                line-height: 18px;
                color: #4F4A4A;
                grid-column: span 2;
                
            }
            .container .content  > main {
                margin-bottom: 20px;
            }
            .container .content  > main > section{
                background-color: #FFFFFF;
                display: grid;
                grid-template-columns: repeat(9,80px);
                column-gap: 20px;
                padding: 10px 0 20px 0;
            }
            .container .content  > main > section .status{
                grid-column-start: 5;
                grid-column-end: 10;
                display: grid;
                grid-template-columns: repeat(5,80px);
                column-gap: 20px;
                position: relative;
                height: 40px;
                align-items: center;
            }
            .container .content  > main > section .status > span:nth-child(1){
                grid-column: span 3;
                /*  The order has been delivered successfully */
                font-family: 'Poppins';
                font-style: normal;
                font-weight: 500;
                font-size: 13px;
                line-height: 20px;
                display: flex;
                color: #4BB47F;


            }
            .container .content  > main > section .status > div{
                position: absolute;
                width: 1px;
                height: 20px;
                background-color: rgb(0, 0, 0,0.3);
                grid-column-start: 4;
            }
            .container .content  > main > section .status > span:nth-child(3){
                grid-column: span 2;
                text-align: center;
                /* COMPLETE */
                font-family: 'Poppins';
                font-weight: 500;
                font-size: 13px;
                line-height: 20px;
                letter-spacing: 0.04em;

                color: #FFAA00;


            }
            .container .content  > main > section > .line{
                grid-column: span 9;
                height: 1px;
                background-color: rgb(0, 0, 0,0.3);
            }
            
            .container .content  > main > section > .products-section{
                grid-column-start: 1;
                grid-column-end: 10;
                display: grid;
                grid-template-columns: repeat(9,80px);
                column-gap: 20px;
                margin: 20px 0;
                align-items: center;
            }
            .container .content  > main > section > .products-section > div:nth-child(1){
                height: 160px;
                width: 160px;
                grid-column: span 2;
                background-color: #4F4A4A;
                margin-left: 20px;
                position: relative;
                overflow: hidden;
            }
            .container .content  > main > section > .products-section > div:nth-child(1) > img{
                position: relative;
                width: 100%;
                min-height: 160px;
                object-fit: cover;
            }

            .container .content  > main > section > .products-section > div:nth-child(2){
                grid-column:  span 4;
                /* Chó Husky Siêu To Khổng Lồ - Chó Husky Cao Cấp - Chó Xinh - G02 */
            }
            .container .content  > main > section > .products-section > div:nth-child(2) > h3{
                font-family: 'Poppins';
                font-weight: 500;
                font-size: 15px;
                line-height: 22px;
                letter-spacing: 0.04em;
                color: #4F4A4A;
                margin-bottom: 20px;
            }
            .container .content  > main > section > .products-section > div:nth-child(2) >  span{
                font-family: 'Poppins';
                font-weight: 300;
                font-size: 14px;
                line-height: 22px;
                letter-spacing: 0.04em;
                color: #4F4A4A;
            }
            .container .content  > main > section > .products-section > h4{
                grid-column: 8/10;
                text-align: right;
                margin-right: 20px;
                /* 2.000.000vnd */
                font-family: 'Poppins';
                font-weight: 400;
                font-size: 15px;
                line-height: 22px;
                letter-spacing: 0.04em;

                color: #F20505;


            }
            .container .content  > main > section > .into-money{
                grid-column: 7/10;
                display: flex;
                justify-content:space-between;
                /* Into money */
                font-family: 'Poppins';
                font-weight: 400;
                font-size: 15px;
                line-height: 22px;
                letter-spacing: 0.04em;
                margin-top: 20px;
                color: #000000;


            }
            .container .content  > main > section > .into-money > span{
                margin-right: 20px;
                /* 2.000.000vnd */

                font-family: 'Poppins';
                font-style: normal;
                font-weight: 500;
                font-size: 18px;
                line-height: 27px;
                letter-spacing: 0.04em;

                color: #F20505;
            }
            .container .content{
                display: none;
            }
            .container .account{
                display: none;
            }
             .container .content.active{
                display: block;
            }
            .container .account.active{
                display: block;
            }
            .container .account{
                grid-column: 4/13;
                background-color: #FFFFFF;
            }
            .container .account > main{
                display: grid;
                grid-template-columns: repeat(9,80px);
                column-gap: 20px;
             
            }
            .container .account > main > h1{
                grid-column: span 9;
                margin: 30px 0 20px 20px;
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 600;
                font-size: 24px;
                line-height: 18px;
                letter-spacing: 0.75px;
            }
            .container .account > main > p{
                grid-column:  span 9;
                margin:0 0 20px 20px;
                font-family: 'Poppins';
                font-style: normal;
                font-weight: 400;
                font-size: 14px;
                line-height: 18px;
                letter-spacing: 0.75px;
            }
            .container .account > main > div {
                height: 1px;
                background-color: rgb(0, 0, 0,0.2);
                grid-column: span 9;
            }
            .container .account > main > form{
                grid-column-start: 3;
                grid-column-end: 8;
                
            }
            .container .account > main > form > table{
                width: 100%;
                margin-top: 50px;
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 400;
                font-size: 14px;
                line-height: 18px;
                color: #4F4A4A;
            }
            .container .account > main > form > table tr{
                height: 50px;
            }
            .container .account > main > form > table tr:last-child{
                height: 90px;
            }
           
            .container .account > main > form > table td > input{
                width: 100%;
                height: 40px;
                padding: 0;
                padding:0 10px;
                border-radius: 5px;
                outline: none;
                border: 1px solid rgb(0, 0, 0,0.2);
                font-family: 'Roboto Slab';
                font-style: normal;
                font-weight: 400;
                font-size: 14px;
                line-height: 18px;
                color: #4F4A4A;
            }
            .container .account > main > form > table td > input.error{
                 border: 1px solid #F20505;
            }
            .container .account > main > form > table tr:last-child td > input{
                width: 130px;
                background-color: #FFAA00;
                border: none;
                color: #FFFFFF;
                cursor: pointer;
            }
        </style>
        
        <script>
               let cookie = document.cookie;
              let cookies = cookie.split(";");
              let _e = false;
              let _p = false;
              let _r = false;
              let isAdmin = "";
              for(let i =0; i < cookies.length; i++){
                  if(cookies[i].substring(1,3) === "_e") _e = !_e;
                   if(cookies[i].substring(1,3) === "_p") _p = !_p;
                    if(cookies[i].substring(1,3) === "_r"){
                        _r = !_r;
                     isAdmin = atob(cookies[i].substring(5,cookies[i].length-1));
                    }
              }
              if(isAdmin === "true"){
                   location.href ="./Login.jsp";
              }
              if(!_e && !_p && !_r){
                  location.href ="./Login.jsp";
              }
        </script>
    </head>
    <body>
         
        <% 
            
           boolean authenticate =  false;
           boolean isAccount = true;
           registrationDTO user_infor  = null;
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
                        user_infor = dao.getUserInfor(email);
                    }
                }else{
                    user_infor = (registrationDTO)request.getAttribute("USER_INFOR");
                }
                
                String item = request.getParameter("item") != null ? request.getParameter("item") : (String)request.getAttribute("item");
                if(item != null && !item.equals("profile") ){
                    isAccount = false;
                }
                
                
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
                 
        <div class="container">
             <div class="user-profile-nav">
                 <div class="user-avatar">
                     <div class="_img">
                         
                     </div>
                     <span>
                         <%= user_infor.getEmail() %>
                     </span>
                 </div>
                 <div></div>
                 <ul class="nav-account">
                     <li class="<%= isAccount?"active":"" %>" id="bt-account">
                         <img src="./img/user-account.svg" alt=""  class="non-red"/>
                         <img src="./img/user-red.svg" alt="" class="red" />
                         <a>My Account</a>
                     </li>
                     <li id="bt-purchase" class="<%= !isAccount?"active":"" %>">
                         <img src="./img/purchase-red.svg" alt="" class="red" />
                         <img src="./img/purchase.svg" alt=""  class="non-red" />
                         <a>Purchase Order</a>
                     </li>
                 </ul>
             </div>
             <div class="<%= !isAccount?"content active":"content" %>" id="content">
                 <div class="head-content">
                     <ul>
                         <li><a>COMPLETE</a></li>
                     </ul>
                 </div>
                 
                 
                 <% 
                    CookieService cookieService = new CookieService();
                    Cookie cookie = cookieService.getCookieByName(request,"_e");
                    String email = Validation.decoded(cookie.getValue());
                    OrderDAO dao = new OrderDAO();
                    List<OrderDTO> list = dao.getPurchaseOrder(email);
                    for(OrderDTO item : list){
                      %>
                        
                        <main>
                            <section>
                                <div class="status">
                                    <span>The order has been success waiting for delivery</span>
                                    <div></div>
                                    <span>COMPLETE</span>
                                </div>
                                <div class="line">

                                </div>
                                
                                
                                <% 
                                
                                    for(OrderDetailDTO productInOrder : item.getProductsOrder()){
                                        productDAO daoImg = new productDAO();
                                        String img = daoImg.getImg(productInOrder.getIDProduct());
                                        
                                 %>
                                     <div class="products-section">
                                        <div class="section-img">
                                            <img src="<%= "./img/img-product/" + img %>" alt="" />
                                        </div>
                                        <div>
                                           <h3>
                                               <%= productInOrder.getNameProduct() %>
                                           </h3>
                                            <span>x<%= productInOrder.getQuantity()  %></span>
                                        </div>
                                        <h4>
                                            <%=  productInOrder.getTotalPrice() %>$
                                        </h4>
                                    </div>
                                 
                                 <%
                                    }
                                
                                
                                %>
                                
                               
                                
                                
                                
                                
                                
                                
                                <div class="line"></div>
                                <div class="into-money">
                                    Into money <span><%= item.getTotal() %>$</span>
                                </div>
                            </section>
                        </main>
                      
                      
                      <%
                    }
                 %>
                 
             </div>
             <div class="<%= isAccount?"account active":"account" %>" id="account">
                <main>
                        <h1>My profile</h1>
                        <p>Manage profile information for account security</p>
                        <div></div>
                        <form action="DispatchServlet" method="post">
                        <table>
                            

                                <tr>
                                    <td>Email</td>
                                    <td><%= user_infor.getEmail() %></td>
                                <input type="hidden"  name="txtEmail" value="<%= user_infor.getEmail() %>" />
                                </tr>
                                <tr>
                                    <td>Full name</td>
                                    <td>
                                        <input type="text" class="" id="name" name="txtName" value="<%= user_infor.getFullname() %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phone number</td>
                                    <td>
                                        <input type="number" class=""  name="txtPhone" id="phoneNumber" value="<%= user_infor.getPhone() %>" />
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>
                                        <input type="txt" class="" id="address" name="txtAddress" value="<%= user_infor.getAddress() %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                    <td>
                                        <input type="submit" name="btAction" id="btSave" value="Save" />
                                    </td>
                                </tr>
                                 
                        </table>
                                    <script>
                                            const phoneNumber = document.getElementById("phoneNumber");
                                            const btSave = document.getElementById("btSave");
                                            const name = document.getElementById("name");
                                            const address = document.getElementById("address");
                                            
                                            
                                            address.addEventListener('blur',()=>{
                                                const value = event.target.value;
                                                if(value === "" ){
                                                    address.classList.add("error");
                                                    btSave.disabled = true;
                                                }else{
                                                    address.classList.remove("error");
                                                    btSave.disabled = false;
                                                }
                                            })
                                            
                                             name.addEventListener('blur',()=>{
                                                const value = event.target.value;
                                                
                                                if(value === ""  ){
                                         
                                                    name.classList.add("error");
                                                    btSave.disabled = true;
                                                }else{
                                                    name.classList.remove("error");
                                                    btSave.disabled = false;
                                                }
                                            })
                                            
                                            
                                            
                                            phoneNumber.addEventListener('blur',()=>{
                                                const value = event.target.value;
                                                if(value.length !== 10 ){
                                                    phoneNumber.classList.add("error");
                                                    btSave.disabled = true;
                                                }else{
                                                    phoneNumber.classList.remove("error");
                                                    btSave.disabled = false;
                                                }
                                            })
                                            
                                            btSave.addEventListener('click', ()=>{
                                                if(name.value === "" || address.value === "" || phoneNumber === "" ){
                                                    btSave.disabled = true;
                                                }
                                            })
                                            
                                            
                                            
                                            
                                 </script>
                    </form>
                </main>
            </div>
         </div> 
         <script>
            const myAccountBT = document.getElementById("bt-account");
            const purchaseBT = document.getElementById("bt-purchase");

            const myAccount = document.getElementById("account");
            const purchase = document.getElementById("content");
            
            myAccountBT.addEventListener('click', ()=>{
                myAccountBT.classList.add("active");
                myAccount.classList.add("active");
                purchaseBT.classList.remove("active");
                purchase.classList.remove("active");
            })
            purchaseBT.addEventListener('click', ()=>{
                purchaseBT.classList.add("active");
                purchase.classList.add("active");
                myAccountBT.classList.remove("active");
                myAccount.classList.remove("active");
            })
         </script>
    </body>
</html>
