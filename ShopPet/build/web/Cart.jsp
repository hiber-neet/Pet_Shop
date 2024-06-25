<%-- 
    Document   : Cart
    Created on : Mar 5, 2024, 12:33:17 AM
    Author     : nhutm
--%>

<%@page import="shoppet.cookie.CookieService"%>
<%@page import="shoppet.cart.cartDAO"%>
<%@page import="shoppet.product.productDAO"%>
<%@page import="shoppet.product.productDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="shoppet.registration.registrationDAO"%>
<%@page import="shoppet.validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Cart</title>
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
            li{
                list-style: none;
            }
            ul{
                padding-inline-start: 0px;
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
            width: 1180px;
            margin: 0 auto 150px auto;
        }
        .header-product{
            width: 100%;
            display: grid;
            grid-template-columns: repeat(12,80px);
            column-gap: 20px;
            margin-top: 40px;
            height: 50px;
            background-color: #FFFFFF;
            align-items: center;
        }
        .header-product > div{
            grid-column-start: 1;
            grid-column-end: 3;
            margin-left: 20px;
            display: flex;
            align-items: center;
            column-gap: 10px;
        }
        .header-product  input{
            width: 20px;
            height: 20px;
            cursor: pointer;
            margin: 0;

        }
       
        .header-product span{
            font-family: 'Poppins';
            font-size: 15px;
            color:#4F4A4A;
        }
        .header-product > span{
            text-align: center;
        }
        .header-product > span:nth-child(2){
            grid-column-start: 7;
            grid-column-end: 9;
        }
        .header-product > span:nth-child(3){
            grid-column-start: 9;
            grid-column-end: 11;
        }
        .header-product > span:nth-child(4){
            grid-column-start: 11;
            grid-column-end: 13;
            margin-right: 20px;
        }
        .product-card{
            margin-top: 20px;
            display: grid;
            background-color: #FFFFFF;
            grid-template-columns: repeat(12,80px);
            column-gap: 20px;
            align-items: center;
            border-radius: 5px;
            position: relative;
        }
        .product-card > div:nth-child(1){
            grid-column-start: 1;
            grid-column-end: 4;
            display: flex;
            align-items: center;
            margin: 20px 0 20px 20px;
            column-gap: 20px;
        }
        .product-card > div:nth-child(1) > input{
            width: 20px;
            height:20px;
        }
        .product-card > .delete{
            width: 40px;
            height: 30px;
            background-color: #E0E0E0;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            top:0;
            right: 0;
            border-bottom-left-radius: 5px;
            cursor: pointer;
        }
        .product-card > .delete > a{
            position: absolute;
            width: 100%;
            height:100%;
            background-color: transparent;
            color: transparent;
        }
        .product-card > div:nth-child(1) > div{
            width: 220px;
            height: 160px;
            background-color: #4F4A4A;
            overflow: hidden;
        }
        .product-card > div:nth-child(1) > div > img{
            position: relative;
            min-width:100%;
            height: 100%;
            object-fit: cover;
        }
        .product-card > h3:nth-child(2){
            grid-column-start: 4;
            grid-column-end: 7;
            font-family: 'Poppins';
            font-size: 16px;
            color:#4F4A4A;
            font-weight: 400;
            letter-spacing: 0.75px;
        }
        .product-card > p:nth-child(3){
            grid-column-start: 7;
            grid-column-end: 9;
            text-align: center;
            font-family: 'Poppins';
            font-weight: 400;
            letter-spacing: 0.25px;
            font-size: 16px;
        }
     
        .product-card > h3:nth-child(5){
            grid-column-start: 11;
            grid-column-end: 13;
            text-align: center;
            font-family: 'Poppins';
            font-weight: 400;
            letter-spacing: 0.25px;
            font-size: 18px;
            color: #F20505;
        }
        .product-card > div:nth-child(4){
            position: relative;
            left:50%;
            transform: translateX(-50%);
            grid-column-start: 9;
            grid-column-end: 11;
            display: flex;
            align-items: center;
            width: 120px;
            height: 30px;
            justify-content: space-between;
        }
        .product-card > div:nth-child(4)  > div{
            position: relative;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #E0E0E0;
            cursor: pointer;
        }
        .product-card > div:nth-child(4)  > div > a{
            position: absolute;
            width: 100%;
            height: 100%;
            color: transparent;
            background-color: transparent;
        }
        .product-card > div:nth-child(4)  > span{
            font-family: 'Poppins';
            font-size: 18px;
            font-weight: 400;
            letter-spacing: 0.7px;
            color:#4F4A4A;
            text-align: center;
        }
        
         .btAction-buy{
            position: fixed;
            background-color: #FFFFFF;
            width: 100%;
            left:0;
            bottom: 0;
            height: 100px;
            
        }
        .btAction-buy > div{
            width: 1180px;
            height:100%;
            margin: 0 auto;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .btAction-buy > div > input{
            background-color: #FFAA00;   
            font-family: 'Poppins';
            font-size: 16px;
            color: #FFFFFF;
            width: 200px;
            height: 50px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            border: none;
            outline: none;
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
        <div class="header-product">
           <div>
               <input type="checkbox" name="" id="checkAllProducts" />
            <span>Products</span>
           </div>
            <span>Unit price</span>
            <span>Quantity</span>
            <span>Amount of money</span>
        </div>
            <form action="DispatchServlet" method="post">
            <% 
               cartDAO daoCart = new cartDAO();
               productDAO dao = new productDAO();
               CookieService cookieService = new CookieService();
               String email = Validation.decoded(cookieService.getCookieByName(request,"_e").getValue());
               HashMap<String,Integer> listProductsCard = daoCart.getCartOnEmail(email);
                System.out.println(listProductsCard);
                if(listProductsCard != null){
                for(String item : listProductsCard.keySet()){    
                    productDTO product = dao.getProductDetail(item);
                    if(product != null){
            %>
        <div class="product-card">
            
            <div>
                <input type="checkbox" name="txtCheckBox" id="" class="checkProduct" value="<%= product.getId() + "_" +  listProductsCard.get(item)  %>" />
                <div class="img-product">
                    <img src="<%= "./img/img-product/"+product.getImg() %>" alt="">
                </div>
            </div>
            
            <h3 class="name-product">
                <%= product.getName() %>
            </h3>
            <p class="unit-price">
                 <%= product.getPrice() %>
            </p>
            <div class="quantity">
                <div >
                   <img src="./img/minus.svg" alt="">
                   <a href="<%= "DispatchServlet?btAction=Reduce&idProduct=" +product.getId() +"&currQuantity="+ listProductsCard.get(item)  %>"   >
                       minus
                   </a>
                </div>
                <span ><%= listProductsCard.get(item)  %></span>
                <div >
                    <img src="./img/plus.svg" alt="">
                    <a href="<%= "DispatchServlet?btAction=Increase&idProduct=" +product.getId() +"&currQuantity="+ listProductsCard.get(item)  %>"  >
                       plus
                    </a>
                </div>
                   
               
            </div>
            <h3 class="amount-money">
                <%= product.getPrice()*listProductsCard.get(item) %>$
            </h3>
            
            
            <div class="delete">
                <img src="./img/delete.svg" />
                <a href="<%= "DispatchServlet?btAction=DeleteInCart&idProduct=" + product.getId() %>">
                    delete
                </a>
            </div>
        </div>
        
        <% 
                }
                }
                }
            %>
            
            
            <div class="btAction-buy">
                <div>
                     <input type="submit" name="btAction" value="Buy" />
                </div>
            </div>
         </form>
            
            
            <script>
                const btCheckAll = document.getElementById("checkAllProducts");
                const elementsChecked = document.querySelectorAll('.checkProduct');
                btCheckAll.addEventListener('click', ()=>{
                    if(btCheckAll.checked === true){
                        for(let i = 0; i < elementsChecked.length; i++){
                            elementsChecked[i].checked = true;
                        }
                    }else{
                        for(let i = 0; i < elementsChecked.length; i++){
                            elementsChecked[i].checked = false;
                        }
                    }
                })
             </script>
    </div>
    </body>
</html>
