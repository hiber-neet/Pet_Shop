<%-- 
    Document   : Register.jsp
    Created on : Mar 2, 2024, 9:39:44 PM
    Author     : nhutm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Pet | Register</title>
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
        }
        form{
            margin: 0 20px;
            width: 100%;
            display: grid;
            max-width: 440px;
        }
        form h1{
            color: #000;
            text-align: center;
            font-family: 'Roboto Slab';
            font-weight: 700;
            letter-spacing: 1.12px;
        }

        form div{
            display: grid;
            margin-bottom: 10px;
        }
        form div input{
            box-sizing: border-box;
            height: 45px;
            border-radius: 5px;
            border: 0.5px solid rgba(0, 0, 0, 0.70);
            background: #FFF;
            outline: none;
        
            color: rgba(0, 0, 0, 0.70);
            padding-left: 20px;
            font-size: 16px;
        }
        form div input.error{
             border: 0.5px solid #F20505;
        }
        form div label{
            color: rgba(0, 0, 0, 0.70);
            font-family: 'Poppins';
            font-size: 16px;
            font-style: normal;
            font-weight: 300;
            line-height: normal;
            letter-spacing: 0.64px;
        }
        form div label:nth-child(3){
            color:#F20505;
        }
        form > input{
            height: 50px;
            border-radius: 5px;
            background: #FFAA00;
            color: #FFF;
            font-family: 'Roboto Slab';
            font-size: 18px;
            font-weight: 700;
            letter-spacing: 0.72px;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }
        form p{
            color: #000;

            text-align: center;
            font-family: 'Poppins';
            font-size: 18px;
            font-style: normal;
            font-weight: 300;
            line-height: normal;
            letter-spacing: 0.72px;
            margin-top: 30px;
        }
        @media screen and (min-width: 576px){
            form{
                grid-template-columns: 6fr 6fr;
                column-gap: 30px;
            }
            form h1{
                grid-column: span 2;
            }
            form div{
                grid-column: span 2;
            }
            form > input{
                grid-column: span 2;
            }
            form p{
                grid-column: span 2;
            }
        }
       
    </style>
    </head>
    <body>
         <form action="DispatchServlet" method="post" >
            <h1>Register</h1>
            <div>
                <label>Name</label>
                <input type="text" name="txtName" 
                     id="name"  value="<%= request.getParameter("txtName") != null ?request.getParameter("txtName"):""  %>"
                >
                <label id="errorName" ></label>
             </div>
            <div>
                <% 
                    boolean errorMail = false;
                    if(request.getAttribute("errorMail") != null){
                        if(!request.getAttribute("errorMail").equals("")){
                            errorMail = true;
                        }
                    }
                   
                %>
                <label>Email</label>
                <input type="text" name="txtEmail" class="<%= errorMail ? "error": ""  %>"  id="email" value="<%=  request.getParameter("txtEmail") != null && !errorMail?request.getParameter("txtEmail"):""%>" />
                <label id="errorMail"><%= errorMail ?request.getAttribute("errorMail"):""  %></label>
            </div>
            <div>
                <label>Phone number</label>
                <input type="text" name="txtPhone" id="phone"
                   value="<%= request.getParameter("txtPhone") != null ? request.getParameter("txtPhone") : ""%>"
                >
                <label id="errorPhone" ></label>
            </div>
            <div>
                <label>Address</label>
                <input type="text" name="txtAddress"  id="address" value="<%= request.getParameter("txtAddress") != null ?  request.getParameter("txtAddress") : "" %>" >
                <label id="errorAddress"></label>
            </div>
            <div>
                <label >Password</label>
                <input type="password" id="password">
                <label id="errorPassword" ></label>
            </div>
            <div>
                <label >Re-password</label>
                <input type="password" name="txtRePassword" id="rePassword">
                <label id="errorRePassword" ></label>
            </div>
                <input id="btAction" type="submit" name="btAction" value="Register" class="submit" />
            <p>You already have account ? <a href="./Login.jsp">Login</a></p>
        </form>
        <script>
            
             const btAction = document.getElementById("btAction");
             const email = document.getElementById("email");
             const phone = document.getElementById("phone");
             const password = document.getElementById("password");
             const rePassword = document.getElementById("rePassword");
             const name = document.getElementById("name");
             const address = document.getElementById("address");
             
             
             const errorPhone = document.getElementById("errorPhone");
             const errorMail = document.getElementById("errorMail");
             const errorPassword = document.getElementById("errorPassword");
             const errorRePassword = document.getElementById("errorRePassword");
             const errorName = document.getElementById("errorName");
             const errorAddress = document.getElementById("errorAddress");
             
             
            btAction.disabled = true;
             
            
            
            
            address.addEventListener('blur', () =>{
                 let value = address.value;
                 if(value === ""){
                    address.classList.add("error");
                   errorAddress.innerText = "Must be not empty";
                      btAction.disabled = true;
                 }else{
                    address.classList.remove("error");
                   errorAddress.innerText ="";
                      btAction.disabled = false;
                 }
             })
             
             
               name.addEventListener('blur', () =>{
                 let value =name.value;
                 if(value === ""){
                    name.classList.add("error");
                     errorName.innerText = "Must be not empty";
                      btAction.disabled = true;
                 }else{
                    name.classList.remove("error");
                     errorName.innerText ="";
                      btAction.disabled = false;
                 }
             })
             
             
             
             
             email.addEventListener('blur', () =>{
                 let value = email.value;
                 const emailRegex = /^[a-zA-Z0-9]+@{a-zA-Z0-9-}+\.+[a-zA-Z0-9]/;
                 if(value === ""){
                     email.classList.add("error");
                     errorMail.innerText = "Must be not empty";
                      btAction.disabled = true;
                 }else if(value.indexOf('@') < 0  || emailRegex.test(value)){
                     email.classList.add("error");
                     errorMail.innerText = "Email is not valid";
                      btAction.disabled = true;
                 }else{
                     email.classList.remove("error");
                     errorMail.innerText ="";
                     btAction.disabled = false;
                 }
             })
             
              phone.addEventListener('blur', () =>{
                 let value = phone.value;
                 if(value === ""){
                     phone.classList.add("error");
                     errorPhone.innerText = "Must be not empty";
                      btAction.disabled = true;
                 }else{
                     phone.classList.remove("error");
                     errorPhone.innerText ="";
                      btAction.disabled = false;
                 }
             })
             password.addEventListener('blur', () =>{
                 let value = password.value;
                 if(value === ""){
                     password.classList.add("error");
                     errorPassword.innerText = "Must be not empty";
                      btAction.disabled = true;
                 }else{
                     password.classList.remove("error");
                     errorPassword.innerText ="";
                      btAction.disabled = false;
                 }
             })
             
             rePassword.addEventListener('blur',() => {
                 let value = rePassword.value;
                 let valuePassword = password.value;
                 if(value === valuePassword && value !== "" && valuePassword !== ""){
                     rePassword.classList.remove("error");
                     errorRePassword.innerText = "";
                      btAction.disabled = false;
                 }else{
                     rePassword.classList.add("error");
                     errorRePassword.innerText="Re password is not match";
                      btAction.disabled = true;
                 }
             })
             
             btAction.addEventListener('click', ()=>{
                    console.log(address.value  === "");
                  if(address.value ===  "" || email.value === "" || phone.value ==="" || password.value === "" || name.value === "" ){
                     btAction.disabled = true;
                  }
            })
             
           
             
        </script>
    </body>
</html>
