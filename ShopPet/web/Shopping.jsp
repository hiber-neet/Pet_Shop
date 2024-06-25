<%-- 
    Document   : Shopping
    Created on : Feb 20, 2024, 11:51:54 PM
    Author     : nhutm
--%>


<%@page import="java.util.List"%>
<%@page import="shoppet.product.productDAO"%>
<%@page import="shoppet.product.productDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="shoppet.registration.registrationDAO"%>
<%@page import="shoppet.validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop pet | Shopping</title>
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
                position: sticky;
                top: 0;
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
            .container{
                margin-bottom: 50px;
            }

            .container > .head-content{
                width: 1180px;
                margin: 70px auto 50px auto;
            }
            .head-content > div{
                display: grid;
                grid-template-columns: repeat(12,80px);
                grid-template-rows: 200px 150px;
                gap: 20px;
            }
            .head-content > div > div:nth-child(1){
                grid-column-start: 1;
                grid-column-end: 8;
                grid-row: 1/3;
            }
            .head-content > div > div:nth-child(2){
                grid-column: 8/13;
                grid-row: 1/2;
            }
            .head-content > div > div:nth-child(3){
                grid-column: 8/13;
                grid-row: 2/3;
            }

            .head-content > div > div{
                border-radius: 5px;
                overflow: hidden;
            }
            .head-content > div > div > img{
                width: 100%;
                min-height: max-content;
            }
            .category{
                width: 1180px;
                margin: 0 auto 50px auto;
                background-color: #FFFFFF;
            }
            .category > div{
                display: flex;
                column-gap: 1px;
            }
            .category > div > div:nth-child(n+1){
                width: 237px;
                height: 330px;
                overflow: hidden;
                cursor: pointer;
                position: relative;
            }
            .category > h3{
                font-family: "Roboto Slab";
                font-size: 24px;
                font-weight: 500;
                letter-spacing: 0.75px;
                color: #4F4A4A;
                padding: 23px 0 22px 20px;
            }
            .category > div > div > a{
                bottom: 0;
                width: 100%;
                position: absolute;
                z-index: 100;
                height: 60px;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: 'Roboto Slab';
                font-weight: 500;
                font-size: 18px;
                line-height: 26px;
                letter-spacing: 0.06em;
                color: #FFFFFF;
                background-color: rgb(0, 0, 0,0.5);
                transition: ease-in-out .5s;
            }
            .category > div > div:hover > a{
                height: 100%;
                transition: ease-in-out .5s;
            }

            .category > div > div > img{
                width: 100%;
                height: 100%;
                object-fit:contain;
                position: relative;
                z-index: 99;
            }
            .suggestion{
                width: 1180px;
                margin: 40px auto 70px auto;
            }
            .suggestion > .textsuggest{
                padding: 20px 0;
                text-align: center;
                color: #FFAA00;
                font-size: 24px;
                font-family: "Roboto Slab";
                background-color: #FFFFFF;
                letter-spacing: 0.125rem;
            }
            .suggestion > .column-suggest{
                margin-top: 20px;
                display: grid;
                grid-template-columns: repeat(4,280px);
                gap: 20px;
                cursor: pointer;
            }
            .column-suggest > div > .img-product-suggestion > img{
                width: 100%;
                min-height: 320px;
                overflow: hidden;
                object-fit: cover;
            }
            .column-suggest > div > .img-product-suggestion{
                height: 320px;
                overflow: hidden;
            }
            .column-suggest > div{
                background-color: #FFFFFF;
                border-radius: 5px;
                overflow: hidden;
                position: relative;
            }
            .column-suggest > div > a{
                position: absolute;
                width: 100%;
                height: 100%;
                left:0;
                top:0;
                background-color: transparent;
                color:transparent;
            }
            .column-suggest > div > div:nth-child(2) > p{
                font-family: "Poppins";
                font-size: 16px;
                letter-spacing: 1px;
                margin: 0;
                grid-column: span 2;
            }
            .column-suggest > div > div:nth-child(2){
                display: grid;
                grid-template-columns: 7fr 5fr;
                padding: 14px 20px 15px 20px;
                row-gap: 20px;
            }
            .column-suggest > div > div:nth-child(2) > span:nth-child(2){
                font-size: 16px;
                font-family: "Poppins";
                color: #F20505;

            }
            #text-black{
                font-size: 14px;
                font-family: "Poppins";
                display: flex;
                justify-content: flex-end;
                align-items: center;
                color: #4F4A4A;

            }
            .textseemore{
                font-family: 'Roboto Slab';
                height: 40px;
                width: 280px;
                background-color: #FFFFFF;
                font-size: 14px;
                border-radius: 5px;
                font-weight: 500;
                border: none;
                color: #4F4A4A;
                letter-spacing: 0.0125rem;
                cursor: pointer;
            }
            .seemore{
                display: flex;
                margin-top: 20px;
                justify-content: center;
            }
            li{
                list-style: none;
            }
            ul{
                padding-inline-start: 0px;
            }
            footer{
                background-color: #000000;
            }
            footer > div{
                width: 1180px;
                margin: 0 auto;
                padding: 143px 0  20px 0;
            }
            footer > div > h2{
                color:#FFFFFF;
                font-family: 'Roboto Slab';
                font-size: 24px;
                letter-spacing: 1px;
                margin-bottom: 70px;
            }
            footer > div > div:nth-child(2){
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
            }
            footer > div > div > ul:nth-child(1){
                grid-column: 1/5;
            }
            footer > div > div > ul > h3 {
                font-family: 'Poppins';
                font-weight: 600;
                font-size: 18px;
                margin-bottom: 35px;
                color: #E0E0E0;
            }
            footer > div > div > ul:nth-child(1) li{
                display: flex;
                align-items: center;
                column-gap: 10px;
            }
            footer > div > div > ul:nth-child(1) li:nth-child(4){
                align-items: flex-start;
            }
            footer > div > div > ul:nth-child(1) li img{
                width: 24px;
                height: auto;
            }
            footer > div > div > ul li{
                font-family: 'Poppins';
                font-weight: 400;
                font-size: 15px;
                color: #E0E0E0;
                margin-bottom: 20px;
            }
            footer > div > div > ul:nth-child(2){
                grid-column: 5/7;
            }
            footer > div > div > ul:nth-child(3){
                grid-column: 7/9;
            }
            footer > div > div > ul:nth-child(4){
                grid-column: 9/11;
            }
            footer > div > div:nth-child(3){
                display: flex;
                justify-content: center;
                column-gap: 15px;
                margin-top: 50px;
            }
            footer > div > div:nth-child(4){
                width: 100%;
                height: 0.5px;
                background-color: #4F4A4A;
                margin-top: 20px;
            }
            footer > div > h5{
                text-align: center;
                font-family: 'Roboto Slab';
                font-size: 16px;
                font-weight: 400;
                color: #F0F0F0;
                letter-spacing: 1.25px;
                margin: 20px 0;
            }
            .hide{
                display: none;
            }
            .show{
                display: block;
            }
               header > div > .login-register > div.user > div.addto-cart{
                position: absolute;
                left:110%;
                top:30%;
                transform: translateY(-50%);
                background-color: transparent;
                color: transparent;
            }
              header > div > .login-register > div.user > div.addto-cart.show{
                position: absolute;
                left:110%;
                top:30%;
                transform: translateY(-50%);
                animation: addToCart 5s ease;
                display: flex;
            }
            
            
            @keyframes addToCart{
                0% {color : transparent; }
                20% {color : #F20505 ; }
                80% {color : #F20505 ; }
                100%  {color : transparent; }
            }
        </style>
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
                    <input type="text" name="txtSearch" placeholder="Search product..." id="searchValue">
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
                         <% 
                            String   id ="";
                            int quantity = 0;
                            String param = request.getParameter("idProduct");
                            if(param != null){
                                String[] params = param.split("_");
                                id = params[0];
                                quantity = Integer.parseInt(params[1]);
                            }
                           
                        %>
                        <div class=" <%=   !id.equals("") && id != null ? "addto-cart show" :"addto-cart"   %>">
                            +<span> <%= quantity != 0 ? quantity:  "" %> </span>
                        </div>
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

            <div class="head-content">
                <div>
                    <div>
                        <img src="./img/dog-shop-banner.png" alt=""/>
                    </div>

                    <div>
                        <img src="./img/hamster-shop banner.png" alt=""/>
                    </div>

                    <div>
                        <img src="./img/cat-shop-banner.png" alt=""/>
                    </div>   
                </div>

            </div>


            <div class="category">
                <h3>CATEGORY</h3>
                <div>
                    <div>
                        <img src="./img/dog-shop.png" alt=""/>
                        <a href="DispatchServlet?btAction=GetType&GetValue=DOG&category=" >Dog</a>
                    </div>

                    <div>
                        <img src="./img/cat-shop.png" alt=""/>
                        <a href="DispatchServlet?btAction=GetType&GetValue=CAT&category=" >Cat</a>
                    </div>

                    <div>
                        <img src="./img/hamster-shop.png" alt=""/>
                        <a href="DispatchServlet?btAction=GetType&GetValue=HAMSTER&category=">Hamster</a>
                    </div>

                    <div>
                        <img src="./img/supplies-shop.png" alt=""/>
                        <a href="DispatchServlet?btAction=GetType&GetValue=SERVICE&category=" class="title2">Pet Supplies</a>
                    </div>

                </div>





            </div>

            <div class="suggestion">
                <% 
                
                  productDAO dao = new productDAO();
                        List<productDTO> listProducts = null;
                        boolean isSearch = false;
                        String searchValue = "";
                        if(request.getAttribute("LIST_PRODUCT") != null){
                                listProducts = ( List<productDTO>)request.getAttribute("LIST_PRODUCT");
                                searchValue = request.getParameter("SearchValue");
                                isSearch = true;
                        }else{
                             listProducts = dao.getProductRandom();
                        }
                
                
                %>
                <h3 class="textsuggest">
                    <%= 
                    
                        isSearch ? "SEARCH FOR " + searchValue.toUpperCase() : "SUGGESTION" 
                    %>
                    
                 </h3>





                <div class="column-suggest">
                    
                    
                    <% 
                        if(listProducts.size() <= 0 ){
                           %> 
                           <h3>
                               <font color="red">
                                    
                                    Find not found a product 
                                    
                               </font>
                           </h3>
                            <%
                        }
                    
                    %>

                    <%                
                     
                        
                        
                        
                      
                      
                        
                  
                        for (int i = 0; i < listProducts.size(); i++) {
                    %>
                    <div class="hide">
                        <div class="img-product-suggestion">
                            <img src="<%= "./img/img-product/" + listProducts.get(i).getImg() %>" alt=""/>
                        </div>
                        <div class="content-suggestion">
                            <p>
                                <%= listProducts.get(i).getName() %>
                            </p>
                            <span><%= listProducts.get(i).getPrice() %> $</span>
                            <span id="text-black"> Available : <%= listProducts.get(i).getQuantity() %></span>
                        </div>
                        <a href="<%= "DispatchServlet?btAction=Detail&ValueDetail="+listProducts.get(i).getId() %>">
                                Click here
                        </a>
                    </div>
                    <%
                        }
                    %>





                </div>

                <div class="seemore">
                    <%
                        int product_length = listProducts.size();
                    %>
                    <% 
                    
                    
                    
                    %>
                       
                    <input class="textseemore" type="submit" name="" value="See more" id="seeMoreButton" onclick="seeMore(<%= product_length %>)" />
                </div> 


                <script>
                    let showElement =0;
                    const suggesstion = document.querySelector('.column-suggest');
                    const children = suggesstion.children;
                    const seeMoreButton = document.getElementById("seeMoreButton");
                    for( let count = 0; count < 12; count++ ){
                           children[showElement].classList.add("show");
                           showElement++;
                           if(showElement >= suggesstion.childElementCount ){
                               break;
                               seeMoreButton.style.display = "none";
                           }
                    }
                    
                    
                    function seeMore(product_length) {
                      
                       for( let count = 0; count < 12; count++ ){
                           children[showElement].classList.add("show");
                           showElement++
                           if(showElement >= suggesstion.childElementCount ){

                               seeMoreButton.style.display = "none";
                              break;
                           }
                       }
                       if(showElement >= product_length){
                           seeMoreButton.style.display = "none";
                       }
                  
                      
                    }
                </script>

            </div>

        </div>

        <footer>
            <div>
                <h2>SHOP PET</h2>
                <div>
                    <ul>
                        <h3>Reach us</h3>
                        <li>
                            <img src="./img/phone.svg" alt="">
                            <span>+843899999999</span>
                        </li>
                        <li>
                            <img src="./img/email.svg" alt="">
                            <span>Shoppet@gmail.com</span>
                        </li>
                        <li>
                            <img src="./img/location.svg" alt="">
                            <span>Long Thanh My, Thu Duc, Ho Chi Minh, Viet Nam</span>
                        </li>
                    </ul>
                    <ul>
                        <h3>Company</h3>
                        <li>
                            About
                        </li>
                        <li>
                            Contact us
                        </li>
                    </ul>
                    <ul>
                        <h3>Legal</h3>
                        <li>Privacy Policy</li>
                        <li>Terms & Services</li>
                        <li>Terms Of Use</li>
                    </ul>
                    <ul>
                        <h3>Useful links</h3>
                        <li>Support</li>
                    </ul>
                </div>
                <div>
                    <img src="./img/face.svg" alt="">
                    <img src="./img/insta.svg" alt="">
                    <img src="./img/twitter.svg" alt="">
                </div>
                <div class="line"></div>
                <h5>Copyright&copy; : shoppet@gmail.com</h5>
            </div>
        </footer>

    </body>
</html>