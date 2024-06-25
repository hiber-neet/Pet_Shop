<%-- 
    Document   : Admin.jsp
    Created on : Mar 10, 2024, 12:52:41 PM
    Author     : nhutm
--%>

<%@page import="shoppet.product.productDTO"%>
<%@page import="java.util.List"%>
<%@page import="shoppet.product.productDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Admin</title>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100..900&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Slab:wght@100..900&display=swap');
            /*            ::-webkit-scrollbar{
                            display: none;
                        }*/
            body{
                margin: 0;
                /*                scroll-behavior: none;*/
                background-color: #F0F0F0;
            }


            h3,ul,li,h4,h5{
                margin: 0;
            }
            header{
                width: 100%;
                letter-spacing: 1px;
                background-color: #FFAA00;

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
                font-size: 18px;
                font-weight: 500;
                cursor: pointer;
                color: #FFFFFF;
            }


            .home-logout {

                grid-column: 11/13;

            }
            .home-logout  > form{
                justify-content: space-between;
                display: flex;
            }
            header > div > div{
                grid-column-start: 6;
                grid-column-end: 10;
                display: grid;

            }


            .text-home{
                position: relative;
                padding: 10px 15px;
                font-family: "Roboto Slab";
                /* border: 96px; */
                background-color: white;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
                color: #000000;
                text-align: center;

            }
            .text-logout{
                font-family: "Roboto Slab";
                /* margin-left: 50px; */
                width: 80px;
                height: 40px;
                border: 1px;
                font-size: 16px;
                border-radius: 5px;
                background-color: #4F4A4A;
                color: #FFFFFF;
                cursor: pointer;

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
                /*                grid-template-rows: 200px 150px;*/
                column-gap: 20px;
            }
            /*            .head-content > div > div:nth-child(1){
                            grid-column-start: 1;
                            grid-column-end: 8;
                            background-color: red;
                            grid-row: 1/3;
                        }*/
            .list-product{
                grid-column: 1/13;
                height: 35px;
                background-color: #4F4A4A;
                color: #FFFFFF;
                font-family: "Poppins";
                display: flex;
                align-items: center;
            }
            .list-product > h4{
                margin-left: 10px;
            }


            .head-content > div > div > img{
                width: 100%;
                object-fit: cover;
            }




            .textseemore{
                font-family: 'Roboto Slab';
                height: 40px;
                width: 280px;
                background-color: #FFFFFF;
                font-size: 14px;
                border-radius: 5px;
                border: none;
                color: #000000;
            }
            .seemore{
                display: flex;
                margin-top: 40px;

                justify-content: center;
            }


            .button-add{
                grid-column: 11 / 13;
                height: 35px;
                background-color: white;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                margin: 20px 0;
                display: flex;
                justify-content: center;
                align-items: center;
                text-decoration: none;
                color:#000000;
            }
            .head-table{
                grid-column: 1 / 13;
                height: 40px;
                background-color: #4F4A4A;
                color: #FFFFFF;
                /* align-items: unset; */
                font-family: 'Poppins';
                text-align: center;
                font-weight: 500;
                display: flex;
                align-items: center;
                display: grid;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;
            }
            .text-image{
                grid-column: 1/3;
            }
            .text-name{
                grid-column: 3/5;
            }
            .text-type{
                grid-column: 5;
            }
            .text-size{
                grid-column: 6;
            }
            .text-quantity{
                grid-column: 7;
            }
            .text-category{
                grid-column: 8/10;
            }
            .text-price{
                grid-column: 10;
            }
            .text-update{
                grid-column: 11;
            }
            .text-delete{
                grid-column: 12;
            }
            .body-table{
                grid-column: 1 / 13;
                display: none;
                height: 150px;
                background-color: #FFFFFF;
                color: #4F4A4A;
                /* align-items: unset; */
                font-family: 'Poppins';
                text-align: center;
                font-weight: 500;
                align-items: center;
                grid-template-columns: repeat(12,80px);
                column-gap: 20px;

                font-size: 15px;
                position: relative;
            }
            .body-table.show{
                display: grid;

            }
            .image{
                grid-column: 1/3;
                height: 150px;
                background: red;
                overflow: hidden;
            }
            .image > img{
                width: 100%;
                object-fit: cover;
                height: 100%;
            }
            .name{
                grid-column: 3/5;
            }
            .type{
                grid-column: 5;
                word-break: break-word;
            }
            .size{
                grid-column: 6;
            }
            .quantity{
                grid-column: 7;
            }
            .category{
                grid-column: 8/10;
            }
            .price{
                grid-column: 10;
            }
            .update{
                grid-column: 11;
            }
            .delete{
                grid-column: 12;
            }
            .line-down{
                display: none;
                height: 20px;
                grid-column: 1/13;
                border-bottom: 1px dashed;
                border-top: 1px dashed;
            }
            .line-down.show{
                display: block;
            }
            .button-seemore{
                font-family: 'Roboto Slab';
                grid-column: 6/8;
                height: 40px;
                width: 180px;
                background-color: #FFFFFF;
                font-size: 14px;
                border-radius: 5px;
                border: none;
                color: #000000;
                cursor: pointer;
            }
            .button-seemore > input{
                cursor: pointer;
            }
            .body-table > a{
                text-decoration: none;
                color: blue;
            }
            .line-down-end{
                height: 20px;
                grid-column: 1/13;
                border-top: 1px dashed;
            }
            .head-search{
                grid-column: 5 / 9;
                width: 373px;
                height: 30px;
                z-index: 99;
                border-radius: 5px;
                display: flex;
                z-index: 99;
            }
            .search-input{
                width: 335px;
                height: 30px;
                /* z-index: 99; */
                /* border-radius: 5px; */
                border: 1px solid;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                border-right: none;
            }
            .button-search{
                width: 80px;
                height: 33.8px;
                background-color: #4F4A4A;
                color: white;
                border: none;
                cursor: pointer;
                margin-left: 0%;
                /* z-index: 99; */
                /* border-radius: 5px; */
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
                /* margin: 5px 0; */
                /* margin-top: 3%; */
                border: 1px solid #000000;
            }
        </style>


        <script>
            let cookie = document.cookie;
            let cookies = cookie.split(";");
            let _e = false;
            let _p = false;
            let _r = false;
            let isAdmin = "";
            for (let i = 0; i < cookies.length; i++) {
                if (cookies[i].substring(1, 3) === "_e")
                    _e = !_e;
                if (cookies[i].substring(1, 3) === "_p")
                    _p = !_p;
                if (cookies[i].substring(1, 3) === "_r") {
                    _r = !_r;
                    isAdmin = atob(cookies[i].substring(5, cookies[i].length - 1));
                }
            }
            if (isAdmin === "false") {
                location.href = "./LoginAdmin.jsp";
            }
            if (!_e && !_p && !_r) {
                location.href = "./LoginAdmin.jsp";
            }
        </script>

    </head>
    <body>
        <header>
            <div>

                <h3>Welcome Admin</h3>
                <form class="head-search" action="DispatchServlet">
                    <input class="search-input" type="text" placeholder="Search..." name="SearchValue">
                    <input type="hidden" name="btAction" value="Search"/>
                    <input type="hidden" name="searchAdmin" value="searchAdmin"/>
                    <button class="button-search" type="submit"> <img src="img/search_icon white.svg"></button>
                </form>

                <div class="home-logout">
                    <form action="DispatchServlet">
                        <a href="Admin.jsp" class="text-home" >Home </a>
                        <input  class="text-logout" type="submit" name="btAction" value="Logout"/> 
                    </form>

                </div>

            </div>
        </header>

        <div class="container">

            <div class="head-content">
                <div>
                    <div class="list-product">
                        <h4>List of product</h4>
                    </div>

                    <a class="button-add" href="AddProduct.jsp">Add Product</a>
                    <div class="head-table ">
                        <span class="text-image">Image</span>
                        <span class="text-name">Name</span>
                        <span class="text-type">Type</span>
                        <span class="text-size">Size</span>
                        <span class="text-quantity">Quantity</span>
                        <span class="text-category">Category</span>
                        <span class="text-price">Price</span>
                        <span class="text-update">Update</span>
                        <span class="text-delete">Delete</span>    
                    </div>



                    <%
                        HttpSession sessionProduct = request.getSession();
                        List<productDTO> list = null;
                        String idProduct = "";
                        if (sessionProduct != null) {
                            idProduct = sessionProduct.getAttribute("ID_PRODUCT_NEW") != null ? (String) sessionProduct.getAttribute("ID_PRODUCT_NEW") : "";
                            sessionProduct.removeAttribute("ID_PRODUCT_NEW");
                        }
                        productDAO dao = new productDAO();
                        String valueSearch = (String) request.getAttribute("SearchValue");
                        if (valueSearch != null) {
                            list = dao.getProductOnSearchValue(valueSearch.trim());
                        } else {
                            list = dao.getAllProductOrderByName(idProduct);
                        }
                        if (list != null && list.size() > 0) {
                            for (int i = 0; i < list.size(); i++) {
                    %> 
                    <div class="body-table">
                        <div class="image">
                            <img src="<%= "./img/img-product/" + list.get(i).getImg()%>" alt=""/>
                        </div>
                        <span class="name"><%= list.get(i).getName()%></span>
                        <span class="type"><%= list.get(i).getType()%></span>
                        <span class="size"><%= list.get(i).getSize()%></span>
                        <span class="quantity"><%= list.get(i).getQuantity()%></span>
                        <span class="category"><%= list.get(i).getCategory()%></span>
                        <span class="price"><%= list.get(i).getPrice()%></span>
                        <a class="update" href="<%= "DispatchServlet?btAction=Update&idProduct=" + list.get(i).getId()%>"">Update</a>
                        <a class ="delete" href="<%= "DispatchServlet?btAction=Delete&idProduct=" + list.get(i).getId()%>">Delete</a>
                    </div>
                    <%
                        if (!(list.size() - 1 == i)) {
                    %> 
                    <div class="line-down"></div>

                    <%
                        }

                    %>



                    <%                           }
                        }
                    %>

                    <div class="line-down-end"></div>
                    <div class="button-seemore" id="seeMoreButton" >
                        <input class="textseemore" type="submit" value="See More"  onclick="SeeMore()"/>
                    </div>



                </div>

            </div>
            <script>
                const seeMoreButton = document.getElementById("seeMoreButton");
                const products = document.querySelectorAll('.body-table');
                console.log(products);
                const line_down = document.querySelectorAll('.line-down');
                let showElement = 0;
                for (let count = 0; count < 12; count++) {
                    products[showElement].classList.add("show");
                    line_down[showElement].classList.add("show");
                    showElement++;
                    if (showElement >= products.length) {
                        seeMoreButton.style.display = "none";
                        break;
                    }
                }

                function SeeMore() {
                    for (let count = 0; count < 12; count++) {
                        products[showElement].classList.add("show");
                        if (showElement < products.length - 1) {
                            line_down[showElement].classList.add("show");
                        }
                        showElement++;
                        if (showElement >= products.length) {
                            seeMoreButton.style.display = "none";
                            break;
                        }
                    }

                }


            </script>


    </body>
</html>
