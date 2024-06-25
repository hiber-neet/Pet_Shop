<%-- 
    Document   : UpdatepProductPage.jsp
    Created on : Mar 10, 2024, 6:59:09 PM
    Author     : nhutm
--%>

<%@page import="shoppet.product.productDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Update Product</title>
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


            .home-logout{

                grid-column: 11/13;

            }
            .home-logout > form{
                display: flex;
                justify-content: space-between;
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
                column-gap: 20px;
            }

            .add-product{
                grid-column: 1/13;
                height: 35px;
                background-color: #4F4A4A;
                color: #FFFFFF;
                font-family: "Poppins";
                display: flex;
                align-items: center;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
            }
            .add-product > h4{
                margin-left: 10px;
                margin-right: 400px;
            }






            .body-table{
                grid-column: 1 / 13;
                height: auto;
                background-color: #FFFFFF;
                color: #4F4A4A;
                /* align-items: unset; */
                font-family: 'Poppins';
                text-align: center;
                font-weight: 500;
                display: flex;
                align-items: center;
                display: grid;
                grid-template-columns: repeat(12, 80px);
                column-gap: 20px;
                font-size: 15px;
                border: 1px solid;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
                grid-template-rows: repeat(10, 40px);
                gap: 20px;
                padding: 15px 0;
            }

            .image{
                grid-column: 1;
                grid-row: 1;
                display: flex;
                align-items: center;
            }
            .body-table > div > span{
                margin: 0 20px;

            }
            .body-table > div > input{
                height: 20px;
                grid-column: 2 / 4;
            }
            #name-text{
                grid-column: 1 / 12;
                grid-row: 4;
                display: flex;
                align-items: center;
                display: grid;
                grid-template-columns: repeat(3, 80px);
                column-gap: 20px;
            }
            .type{
                grid-column: 1 / 12;
                grid-row: 5;
                display: flex;
                align-items: center;
                display: grid;
                /* margin: 0 20px; */
                /* display: flex; */
                grid-template-columns: repeat(3, 80px);
                column-gap: 20px;
            }
            .size{
                grid-column: 1 / 12;
                grid-row: 6;
                display: flex;
                align-items: center;
                display: grid;
                /* margin: 0 20px; */
                /* display: flex; */
                grid-template-columns: repeat(3, 80px);
                column-gap: 20px;
            }
            .quantity{
                grid-column: 1 / 12;
                grid-row: 7;
                display: flex;
                align-items: center;
                display: grid;
                /* margin: 0 20px; */
                /* display: flex; */
                grid-template-columns: repeat(3, 80px);
                column-gap: 20px;
            }
            .nutdieuchinh{
                display: flex;
                width: 120px;
                height: 30px;
                align-items: center;
                justify-content: space-between;
                margin-top: -20px;
                grid-column: 2 / 4;
                transform: translate3d(10px, 10px, 10px);
                transform: translateY(10px);
                margin-left: 30px;
            }
            .dauTru{
                display: flex;
                width: 30px;
                height: 30px;
                font-size: 24px;
                width: 30px;
                height: 30px;
                font-size: 35px;
                color: #4F4A4A;
                background-color: #E0E0E0;
                border: none;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }
            .daucong{
                width: 30px;
                height: 30px;
                font-size: 24px;
                color: #4F4A4A;
                background-color: #E0E0E0;
                border: none;
                cursor: pointer;
            }
            .nutdieuchinh > p {
                color: #4F4A4A;
                font-size: 16px;
            }
            .category{
                grid-column: 1 / 12;
                grid-row: 8;
                display: flex;
                align-items: center;
                display: grid;
                /* margin: 0 20px; */
                /* display: flex; */
                grid-template-columns: repeat(3, 80px);
                column-gap: 20px;
            }
            .price{
                grid-column: 1 / 12;
                grid-row: 9;
                display: flex;
                align-items: center;
                display: grid;
                /* margin: 0 20px; */
                /* display: flex; */
                grid-template-columns: repeat(3, 80px);
                column-gap: 20px;
            }

            .button-add{
                grid-column: 11 / 13;
                height: 40px;
                grid-row: 10;
                display: flex;
                justify-content: center;
            }
            .button-add > button{
                width: 160px;
                cursor: pointer;
                background-color: #FFAA00;
                color: #FFFFFF;
                font-size: 18px;
                font-weight: 500;
                font-family: "Poppins";
                border: none;
                border-radius: 5px;
            }
            .old-image{
                background-color: red;
                height: 100px;
                /* margin-left: 40px; */
                grid-row: 1 / 3;
                grid-column: 2 / 4;
                overflow: hidden;

            }
            .old-image > img{
                width: 100%;
                object-fit: cover;
                height: 100%;
            }
            #btUpdate{
                height: 40px;
            }
            .file-img{
                grid-column: 2 / 5;
                grid-row: 3;
            }

            .button-update{
                background-color: #FFAA00;
                color: #FFFFFF;
                font-weight: 500;
                border: none;
                font-family: 'Poppins';
                boder: none;
                font-size: 18px;
                border-radius: 5px;
                height: 40px;
                width: 160px;
                cursor: pointer;
            }
            #select-type{
                width: 180px;
                text-align: center;
                height: 25px;
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
                    <div class="add-product">
                        <h4>Update Product</h4>
                        <%= request.getAttribute("MESSAGE") != null ? request.getAttribute("MESSAGE") : ""%>
                    </div>


                    <%

                        productDTO product = (productDTO) request.getAttribute("PRODUCT");

                    %>

                    <form action="UpdateProductServlet" class="body-table" method="post"   enctype="multipart/form-data" >
                        <input type="hidden" name="idProduct" value="<%= product.getId()%>" />
                        <div class="image">
                            <span>Image</span> 


                        </div>
                        <div class="old-image">
                            <img src="<%= "./img/img-product/" + product.getImg()%>" alt=""/>


                        </div>
                        <input class="file-img" name="txtImg" type="file"  enctype="multipart/form-data" />   

                        <div id="name-text">
                            <span>Name</span>
                            <input type="text" name="txtName" value="<%= product.getName()%>"   class="input"  />
                        </div>
                        <div class="type">
                            <span>Type</span>
                            <select id="select-type" disabled name="txtType" class="input">
                                <% if(product.getType().equals("CAT")){%>
                                <option value="DOG">Dog</option>
                                <option selected="" value="CAT">Cat</option>
                                <option value="HAMSTER">Hamster</option>
                                <option value="DOG_SERVICE">Dog service</option>
                                <option value="CAT_SERVICE">Cat service</option>
                                <option value="HAMSTER_SERVICE">Hamster service</option>
                                <%}else%>
                                <% if(product.getType().equals("DOG")){%>
                                <option selected="" value="DOG">Dog</option>
                                <option value="CAT">Cat</option>
                                <option value="HAMSTER">Hamster</option>
                                <option value="DOG_SERVICE">Dog service</option>
                                <option value="CAT_SERVICE">Cat service</option>
                                <option value="HAMSTER_SERVICE">Hamster service</option>
                                <%}else%>
                                <% if(product.getType().equals("HAMSTER")){%>
                                <option value="DOG">Dog</option>
                                <option value="CAT">Cat</option>
                                <option selected="" value="HAMSTER">Hamster</option>
                                <option value="DOG_SERVICE">Dog service</option>
                                <option value="CAT_SERVICE">Cat service</option>
                                <option value="HAMSTER_SERVICE">Hamster service</option>
                                <%}else%>
                                <% if(product.getType().equals("CAT_SERVICE")){%>
                                <option value="DOG">Dog</option>
                                <option value="CAT">Cat</option>
                                <option value="HAMSTER">Hamster</option>
                                <option value="DOG_SERVICE">Dog service</option>
                                <option selected="" value="CAT_SERVICE">Cat service</option>
                                <option value="HAMSTER_SERVICE">Hamster service</option>
                                <%}else%>
                                <% if(product.getType().equals("DOG_SERVICE")){%>
                                <option value="DOG">Dog</option>
                                <option value="CAT">Cat</option>
                                <option value="HAMSTER">Hamster</option>
                                <option selected="" value="DOG_SERVICE">Dog service</option>
                                <option value="CAT_SERVICE">Cat service</option>
                                <option value="HAMSTER_SERVICE">Hamster service</option>
                                <%}else%>
                                <% if(product.getType().equals("HAMSTER_SERVICE")){%>
                                <option value="DOG">Dog</option>
                                <option value="CAT">Cat</option>
                                <option value="HAMSTER">Hamster</option>
                                <option value="DOG_SERVICE">Dog service</option>
                                <option value="CAT_SERVICE">Cat service</option>
                                <option selected="" value="HAMSTER_SERVICE">Hamster service</option>
                                <%}%>
                                
                            </select>
                        </div>
                        <div class="size">
                            <span>Size</span>
                            <input type="text" name="txtSize" id="size"  value="<%= product.getSize()%>" class="input number" />
                        </div>
                        <div class="quantity">
                            <span>Quantity</span>
                            <input type="number" name="txtQuantity" min="1" value="<%= product.getQuantity()%>" class="input number" />
                        </div>
                        <div class="category">
                            <span>Category</span>
                            <input type="text" disabled name="txtCategory" value="<%= product.getCategory()%>" class="input" />
                        </div>
                        <div class="price">
                            <span>Price</span>
                            <input type="number"  name="txtPrice" min="1" value="<%= product.getPrice()%>" class="input number" />
                        </div>
                        <div class="button-add">
                            <input type="submit" name="btAction" class="button-update" id="btUpdate" value="Update" />
                        </div>

                        <script>
                            const size = document.getElementById("size");
                            const btAdd = document.getElementById("btUpdate");
                            const input = document.querySelectorAll('.input');
                            const inputNumber = document.querySelectorAll('.input.number');
                            btAdd.addEventListener('click', () => {
                                for (let i = 0; i < input.length; i++) {

                                    if (input[i].value === null || input[i].value === "") {
                                        input[i].placeholder = "Must be not null";
                                        btAdd.disabled = true;
                                    }



                                }
                                const sizeRegex = /^[0-9.]+$/;
                            let value = size.value;
                     
                            if( value.startsWith('-') || parseFloat(value) === 0 ){
                                 size.value = "Must be larger than 0";
                                 btAdd.disabled = true;
                            }else if(sizeRegex.test(value)){
                               
                            }else if(value === "" || value === null){
                                size.value = "Must be not null";
                                 btAdd.disabled = true;
                            }
                            else{
                                size.value = "Must be number";
                                 btAdd.disabled = true;
                            }

                                for (let j = 0; j < inputNumber.length; j++) {
                                    inputNumber[j].addEventListener('blur', () => {
                                        if (Number.parseFloat(inputNumber[j].value.toString()) < 0) {
                                            inputNumber[j].placeholder = "Must be  > 0";
                                            btAdd.disabled = true;
                                        }
                                    })
                                }
                            })

                            for (let j = 0; j < inputNumber.length; j++) {
                                inputNumber[j].addEventListener('blur', () => {
                                    if (Number.parseFloat(inputNumber[j].value.toString()) >= 0) {
                                        btAdd.disabled = false;
                                    }
                                })
                            }

                            for (let i = 0; i < input.length; i++) {
                                console.log(input[i].value);
                                input[i].addEventListener('blur', () => {
                                    if (input[i].value !== null && input[i].value !== "") {
                                        btAdd.disabled = false;
                                    }
                                })


                            }
                        </script>



                    </form>


                </div>


            </div>

        </div>

    </body>
</html>
