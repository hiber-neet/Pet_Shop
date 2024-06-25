    <%@page import="shoppet.product.productDAO"%>
<%-- 
    Document   : DetailProduct
    Created on : Mar 6, 2024, 12:25:31 PM
    Author     : nhutm
--%>

<%@page import="shoppet.product.productDTO"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="shoppet.registration.registrationDAO"%>
<%@page import="shoppet.validation.Validation"%>
<%@page import="shoppet.validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop pet</title>
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
                list-style: none;
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
            margin: 40px auto 0 auto;
            background-color: #FFFFFF;
        }
        .container .card{
            display: grid;
            grid-template-columns: 560px 560px;
            column-gap: 20px;
            padding: 20px;
        }
        .container .card .img-product{
            display: grid;
        }
        .container .card .big-img-product{
            background-color: red;
            height: 560px;
            overflow: hidden;
        }
        .container .card .big-img-product > img{
            width: 100%;
            min-height: 560px;
            object-fit: cover;
        }
        .container .card .txt-product{
            padding: 40px 0 0 20px;
        }
        .container .card .txt-product h4{
            font-family: 'Poppins';
            font-size: 32px;
            font-weight: 500;
            letter-spacing: 1px;
        }
        .rating-sold{
            margin:10px 0;
            display: flex;
            align-items: center;
        }
   
        .sold{
            font-family: 'Poppins';
            font-size: 16px;
            font-weight: 400;
             color: rgb(0, 0, 0,0.7);
            letter-spacing: 1px;
        }
        .sold > span{
            font-size: 15px;
            margin-left: 5px;
        }
        .txt-product > h3{
            font-family: 'Poppins';
            font-size: 32px;
            font-weight: 400;
            letter-spacing: 1.75px;
            color:#F20505;
            margin: 20px 0 30px 0;
        }
        .txt-product > h3 > span{
            font-size: 26px;

        }
        .transport{
            margin-top: 20px;
            display: flex;
            column-gap: 30px;
        }
        table{
            border-spacing: 0;
            border: none;
            
        }
        table  tr:nth-child(2) td{
            padding-top: 10px;
        }
        .transport > span{
            font-family: 'Poppins';
            font-size: 15px;
            font-weight: 400;
            letter-spacing: 0.7px;
            color:#4F4A4A;
        }
        .transport td{
            font-family: 'Poppins';
            font-size: 15px;
            font-weight: 400;
            letter-spacing: 0.7px;
            color:#4F4A4A;
        }
        .transport td:nth-child(2) {
           padding-left: 29px;
        }
        .transport td:nth-child(3){
            padding-left: 20px;
            font-size: 14px;
            letter-spacing: 0;
        }
        .size{
            display: flex;
            column-gap: 80px;
            align-items: flex-start;
            margin-top: 20px;
        }
        .size > span{
            font-family: 'Poppins';
            font-size: 15px;
            font-weight: 400;
            letter-spacing: 0.7px;
            color:#4F4A4A;
        }
        .size > div {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .size > div > div{
            width: 70px;
            height: 30px;
            border: 1px solid rgba(0,0,0,0.1);
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins';
            color:rgba(0,0,0,0.7);
        }
        .quantity{
            display: flex;
            margin: 20px 0 40px 0; 
            column-gap: 40px;
        }
        .quantity > span{
            font-family: 'Poppins';
            font-size: 15px;
            font-weight: 400;
            letter-spacing: 0.7px;
            color:#4F4A4A;
        }
        .quantity > div{
            display: flex;
            align-items: center;
            width: 120px;
            height: 30px;
            justify-content: space-between;
        }
        .quantity > div > div > img{
            width:14px;
            height: auto;
       
        }
        .quantity > div > span{
            font-family: 'Poppins';
            font-size: 18px;
            font-weight: 400;
            letter-spacing: 0.7px;
            color:#4F4A4A;
        }
        .quantity > div > div{
            position: relative;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #E0E0E0;
            cursor: pointer;
        }
        .bt-buy-addCart {
            display: flex;
            column-gap: 20px;
        }
        .bt-buy-addCart div{
            width: 200px;
            height: 50px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .bt-buy-addCart div > a{
            position: absolute;
            width: 100%;
            height: 100%;
            top:0;
            left:0;
            background-color: transparent;
            color: transparent;
        }
        .bt-buy-addCart div:nth-child(1){
            background-color: transparent;
            border: 2px solid #FFAA00;
           
            font-family: 'Poppins';
            font-size: 16px;
            color: #FFAA00;
            column-gap: 5px;
        }
        .bt-buy-addCart div:nth-child(2){
            background-color: #FFAA00;
            border: none;
            color: #FFFFFF;
            font-family: 'Poppins';
            font-size: 16px;
            font-weight: 600;
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
                   
                    }
              }
         
              if(!_e && !_p && !_r){
                  location.href ="./Login.jsp";
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
             
             
             <%
                 productDTO   product = (productDTO)request.getAttribute("PRODUCT");

                 if(product != null ){
                     
                
             
             %>
        <div class="card">
            <div class="img-product">
                
                
                <div class="big-img-product">
                    <img src="<%= "./img/img-product/" + product.getImg() %>" alt="">
                </div>
               
            </div>
            <div class="txt-product">
                <h4>
                    <%= product.getName() %>
                </h4>
                <div class="rating-sold">
                    <span class="sold">
                        Available : 
                        <span class="span-sold" id="available">
                            <%= product.getQuantity() %>
                        </span>
                    </span>
                </div>
                <h3>
                    <%= product.getPrice() %><span>$</span>
                </h3>
                <div class="transport">
                    <span>
                        Transport
                    </span>
                    <div>
                        <table>
                           
                            <tr>
                               
                                <td> Transport to</td>
                                <td> Long Thanh My Ward, Thu Duc City</td>
                            </tr>
                            <tr>
                              
                                <td> Transport Fee</td>
                                <td> 22.000vnd</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="size">
                    <span>Size</span>
                    <div>
                        <div>
                            <%= product.getSize() %>
                        </div>
                    </div>
                </div>
                <div class="quantity">
                    <span>Quantity</span>
                    <div>
                        <div id="btMinus">
                            <img src="./img/minus.svg" alt="">
                        </div>
                        <span id="quantity">1</span>
                        <div id="btPlus">
                            <img src="./img/plus.svg" alt="">
                        </div>
                        
                        <script>
                             
                        </script>
                    </div>
                </div>
                <div class="bt-buy-addCart">
                    <div>
                        <img src="./img/cart.svg" alt="">
                        Add to cart
                        <a href="<%= "DispatchServlet?btAction=AddToCart&idProduct=" + product.getId() %>" id="addToCart" >Click here</a>
                    </div>
                    <div>
                        Buy Now
                         <a href="<%= "DispatchServlet?btAction=Buy&idProduct=" + product.getId() %> " id="Buy" >Click here</a>
                    </div>
                </div>
            </div>
                    <script>
                               const btMinus = document.getElementById("btMinus");
                               const btPlus = document.getElementById("btPlus");
                               const quantity = document.getElementById("quantity");
                               const available = document.getElementById("available");
                               btMinus.addEventListener('click', ()=>{
                               
                                   if(parseInt(quantity.textContent) > 1 ){
                                       quantity.innerText =  parseInt(quantity.textContent)-1;
                                   }
                               })
                              btPlus.addEventListener('click',()=>{
                                  if(parseInt(quantity.textContent) <  parseInt(available.textContent) ){
                                      quantity.innerText =  parseInt(quantity.textContent)+1;
                                  }
                                  
                              })
                            const buy = document.getElementById("Buy");
                            const addToCart = document.getElementById("addToCart");
                            addToCart.addEventListener('click', () =>{
                                addToCart.href = addToCart.href+"_"+quantity.innerText;
                            })
                            buy.addEventListener('click',()=>{
                                buy.href = buy.href +"_"+quantity.innerText;
                            })
                        
                    </script>
        </div>
                 <% 
                 
                    }
                 %>
                    
                    
                    
    </div>
    </body>
</html>
