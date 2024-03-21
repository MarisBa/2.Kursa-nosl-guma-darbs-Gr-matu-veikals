<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration or Sign Up form</title> 
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }
      .wrapper {
        max-width: 350px;
        width: 100%;
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      }
      .wrapper h2 {
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 20px;
        color: #343a40;
        text-align: center;
      }
      .input-box {
        margin-bottom: 20px;
      }
      .input-box input {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: 1px solid #ced4da;
        border-radius: 6px;
        outline: none;
      }
      .input-box.button {
        text-align: center;
      }
      .input-box.button input {
        width: auto;
        padding: 12px 24px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      .input-box.button input:hover {
        background-color: #0056b3;
      }
      .text {
        text-align: center;
      }
      .text h3 {
        font-size: 14px;
        color: #6c757d;
      }
      .text h3 a {
        color: #007bff;
        text-decoration: none;
      }
      .text h3 a:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    <div class="wrapper">
      <h2>Registration</h2>
      <form id="form1" action="Registration" method="post">
        <div class="input-box">
          <input type="text" id="uname" name="uname" placeholder="Enter your name" required>
        </div>
        <div class="input-box">
          <input type="text" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
          <input type="password" id="crpassword" name="crpassword" placeholder="Create password" required>
        </div>
        <div class="input-box">
          <input type="password" id="copassword" name="copassword" placeholder="Confirm password" required>
        </div>
        <div class="input-box button">
          <input type="button" value="Register Now" onclick="verify()">
        </div>
        <div class="text">
          <h3>Already have an account? <a href="/AlreadyLogin">Login now</a></h3>
        </div>
      </form>
    </div>
    <script>
      function verify() {
        var uname = document.getElementById("uname").value;  
        var email = document.getElementById("email").value;
        var pw1 = document.getElementById("crpassword").value;  
        var pw2 = document.getElementById("copassword").value;  
        
        if(uname == "" || email == "" || pw1 == "" || pw2 == "") {
          alert("Please fill out all fields.");
          return false;
        }
        else if(pw1 != pw2) {  
          alert("Passwords do not match.");  
        }
        else {  
          alert("Registration Successful.");
          setTimeout(formSubmit, 1000);
        }  
      }
      
      function formSubmit() {
        var form = document.getElementById("form1");
        form.submit();
        form.reset();
      }
    </script>
  </body>
</html>
