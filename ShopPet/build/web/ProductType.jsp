<%-- 
    Document   : ProductType
    Created on : Mar 5, 2024, 1:01:14 AM
    Author     : nhutm
--%>

<%@page import="shoppet.product.productDTO"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="shoppet.registration.registrationDAO"%>
<%@page import="shoppet.validation.Validation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | <%= request.getParameter("GetValue") %> </title>
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
                margin: 50px auto;
            }
            .container > .banner-contain{
                width: 1180px;
                height: 400px;
                background-color:#FFFFFF;
                margin-bottom: 60px;
                border-radius: 5px;
                overflow: hidden;
            }
            .container > .banner-contain > img{
                width: 100%;
                min-height: 400px;
                object-fit: cover;
            }
            .container > .content{
                display: grid;
                grid-template-columns: 280px 880px;
                column-gap: 20px;
            }
            .container > .content > .menu > .title-menu{
                height: 50px;
                display: flex;
                align-items: center;
                column-gap: 20px;
                font-family: 'Poppins';
                font-size: 20px;
                letter-spacing: 0.75px;
                font-weight: 500;
                color:#4F4A4A;
                position: relative;
            }
            .container > .content > .menu > .title-menu > img{
                width: 16px;
                height: 12px;
            }
            .container > .content > .menu > .title-menu::after{
                content: "";
                position: absolute;
                width: 100%;
                height: 1px;
                background-color: rgb(0, 0, 0,0.5);
                bottom: -10px;
            }
            .container > .content > .menu > ul{
                padding-inline-start: 0px;
                padding-left: 36px;
                margin-top: 30px;
            }
            .container > .content > .menu > ul > li{
                list-style: none;
                height: 31px;
                font-family: 'Poppins';
                font-size: 16px;
                letter-spacing: 0.5px;
                font-weight: 400;
                color: #4F4A4A;
                cursor: pointer;
                position: relative;
                display: flex;
                align-items: center;
            }
            .container > .content > .menu > ul > li > img{
                display: none;
            }
            .container > .content > .menu > ul > li > a{
                position: absolute;
                width: 100%;
                height: 100%;
                left:0;
                top:0;
                background-color: transparent;
                color:transparent;
            }
            .container > .content > .menu > ul > li.active > img{
                position: absolute;
                left:-20px;
                top:50%;
                transform: translateY(-50%);
                width: 8px;
                height: auto;
                display: block;
                z-index: 99;
            }
            .container > .content > .menu > ul > li.active{
                color:#F20505;
            }
            .container > .content > .list-product > .services-list{
                height: 50px;
                display: flex;
                align-items: center;
                font-family: 'Poppins';
                font-size: 16px;
                letter-spacing: 0.5px;
                font-weight: 400;
                color: #4F4A4A;
                background-color: #CDCDCD;
                padding: 0 20px;
            }
            .container > .content > .list-product > .content-list-product{
                margin-top: 40px;
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
    
            }
            .container > .content > .list-product > .content-list-product > .product-card{
                width: 280px;
                background-color: #FFFFFF;
                border-radius: 5px;
                position: relative;
                
            }
            .container > .content > .list-product > .content-list-product > .product-card > a{
                position: absolute;
                width: 100%;
                height: 100%;
                background-color: transparent;
                top:0;
                left: 0;
                color: transparent;
            }
            .container > .content > .list-product > .content-list-product > .product-card > .img-product{
                height: 280px;
                overflow: hidden;
            }
            .container > .content > .list-product > .content-list-product > .product-card > .img-product > img{
                width: 280px;
                min-height: 280px;
                object-fit: cover;
            }
            .container > .content > .list-product > .content-list-product > .product-card > .detail-product{
                margin: 14px 20px 15px 20px;
                display: grid;
                grid-template-columns: 7fr 5fr;

            }
            .container > .content > .list-product > .content-list-product > .product-card > .detail-product > h3{
                font-family: 'Poppins';
                font-weight: 500;
                font-size: 18px;
                letter-spacing: 0.75px;
                margin-bottom: 18px;
                grid-column: span 2;
            }
            .container > .content > .list-product > .content-list-product > .product-card > .detail-product > span{
                font-family: 'Poppins';
                font-weight: 400;
                font-size: 16px;
                color: #F20505;
            }
            .container > .content > .list-product > .content-list-product > .product-card > .detail-product > span:nth-child(3){
                display: flex;
                justify-content: flex-end;
                color: #4F4A4A;
                font-size: 14px;
            }
            .container > .content > .list-product > .see-more{
                width: 100%;
                display: flex;
                justify-content: center;
                margin-top: 29px;
            }
            .container > .content > .list-product > .see-more > button{
                width: 280px;
                height: 40px;
                border: none;
                padding:0;
                margin: 0;
                background-color: #FFFFFF;
                border-radius: 5px;
                font-family: 'Roboto Slab';
                font-size: 16px;
                font-weight: 500;
                cursor: pointer;
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
        <div class="banner-contain">
            <% 
                 String type = request.getParameter("GetValue") != null ? request.getParameter("GetValue") : "";
                 System.out.println(type);
                 if(type.equals("CAT")){
                     %> 
                         <img src="./img/cat-shop-banner.png" alt=""  />
                    <%
                 }else if(type.equals("DOG")){
                    %> 
                         <img src="./img/dog-shop-banner.png" alt="" />
                    <%
                     
                 }else if(type.equals("SERVICE")){
                    %> 
                    <img src="./img/supplies-home.png" alt="" />
                    <%
                 }else if(type.equals("HAMSTER")){
                     %>  
                        <img src="./img/hamster-shop banner.png" alt="" />
                    <%
                 }
            %>
           
        </div>
        <div class="content">
            <div class="menu">
                <div class="title-menu">
                    <img src="./img/menu-product.svg" alt="" />
                    All of <%= type.toUpperCase().charAt(0) + type.toLowerCase().substring(1,type.length()) +"s" %>
                </div>
                <ul>
                    <% 
                        String category = request.getParameter("category")!= null ? request.getParameter("category") : "" ;
                    
                    %>
                    <li class="<%=category.equals("")?"active":"" %>" > All 
                        <img src="./img/arrow-red.png" alt="" />
                        <a href="<%= "DispatchServlet?btAction=GetType&GetValue="+type.trim().toUpperCase()+"&category=" + "" %>" >Click here </a>
                    </li>
                    <% 
                        List<String> categoryList = (List<String>)request.getAttribute("CATEGORY_LIST");
                        for(String item : categoryList){
                    %>
                    <li class="<%=category.trim().toLowerCase().equals(item.trim().toLowerCase())?"active":"" %>" > <%= item.toUpperCase().charAt(0) + item.toLowerCase().substring(1,item.length())  %> 
                         <img src="./img/arrow-red.png" alt="" />
                         <a href="<%= "DispatchServlet?btAction=GetType&GetValue="+type.trim().toUpperCase()+"&category=" + item %>" >Click here </a>
                    </li>
                    
                    <%
                        }
                    
                    %>
                </ul>
            </div>
            <div class="list-product">
                <div class="services-list">
                   
                </div>
                <div class="content-list-product">
                <% 
                     List<productDTO> pList = (List<productDTO>)request.getAttribute("PRODUCT_LIST");
                     for(productDTO listProduct : pList){
                 %> 
                        <div class="product-card hide">
                            <div class="img-product">
                                <img src="<%= "./img/img-product/" + listProduct.getImg() %>" alt="">
                            </div>
                            <div class="detail-product">
                                <h3> <%= listProduct.getName() %> </h3>
                                <span><%= listProduct.getPrice() %> $ </span>
                                <span>Available : <%= listProduct.getQuantity() %> </span>
                            </div>
                            <a href="<%= "DispatchServlet?btAction=Detail&ValueDetail="+listProduct.getId() %>">
                                Click here
                            </a>
                        </div>
                        
                 <%
                     }
                
                %>
                   

                </div>
                <div class="see-more">
                    <button id="seemoreButton" onclick="seeMore(<%= pList.size() %>)">See more</button>
                </div>
            </div>
        </div>
    </div>
                <script>
                    const listProduct = document.querySelector('.content-list-product');
                    const seeMoreButton = document.getElementById("seemoreButton");
                    const children = listProduct.children;
                    let showElement = 0;
                    for( let count = 0; count < 9; count++ ){
                           children[showElement].classList.add("show");
                           showElement++;
                           console.log(listProduct.childElementCount );
                           if(showElement >= listProduct.childElementCount ){    
                               seeMoreButton.style.display = "none";
                                break;
                           }
                    }
                    
                    
                    function seeMore(product_length) {
                      
                       for( let count = 0; count < 12; count++ ){
                           children[showElement].classList.add("show");
                           showElement++
                           if(showElement >= product_length ){
                               break;
                               seeMoreButton.style.display = "none";
                           }
                       }
                       if(showElement >= product_length){
                           seeMoreButton.style.display = "none";
                       }
                  
                      
                    }
                </script>

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
