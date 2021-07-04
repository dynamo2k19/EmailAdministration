<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Register Form</title>
    <style>
    /*** Reset styles ***/
html,body, body * { 
    box-sizing: border-box; 
    font-family: 'Open Sans', sans-serif; 
    margin:0;
    padding:0;
    color:inherit;
    background-color:inherit;
 }
 body {
    background-image: url(pic1.jpg);
    background-size:  cover;
    background-position:center center;
    
  }
  .container {
      width: 100%;
      padding-top: 60px;
      padding-bottom: 100px;
  }

  .login-register {
      height: 560px;
      width: 500px;
      margin-left: auto;
      margin-right: auto;
      padding:0 2em;
      border-radius: 5px;
      box-shadow: 0px 2px 7px rgba(0,0,0,0.2);
      overflow: hidden; 
      background: linear-gradient(180deg, rgba(65,4,119,1) 0%, rgba(22,147,198,1) 58%, rgba(255,255,255,0.1407913507199755) 82%);
      color:#ffffff;
  }

  /* Nav Buttons  */
  .nav-buttons {
    width: 100%;
    height: 100px;
    padding-top: 40px;
    opacity: 1;
    margin-bottom: 3em;
  }
  button {
      font-size: 1.5em;
      margin-right:1em;
      border:0px;
      cursor: pointer;
   
  }
  button:focus {
      outline: 0px;
  }
  button.active {
      padding-bottom: 10px;
      border-bottom: solid 2px #1059FF;
  } 
  /* footer: forgot section */
   #forgot {
        position: relative;
        height: 100px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
        padding-top: 24px;
        margin-top: -300px; 
        border-top: solid 1px rgba(255,255,255,.3);    
    }

    /* form styling */
    .form-group input {
        width: 100%;
        height: 35px;
        padding-left: 15px;
        border: none;
        border-radius: 5px;
        margin-bottom: 20px;
        background: rgba(255,255,255,.2);
    }
    .form-group label {
      text-transform: uppercase;
    }
    input.submit {
        font-weight: 700;
        text-transform: uppercase;
        font-size: 1em;
        text-align: center;
        color: rgba(255,255,255, 1);
        padding: 8px 0px;
        width: 100%;
        height: 35px;
        border: none;
        border-radius: 20px;
        margin-top: 23px;
        background-color: rgba(16,89,255, 1);
    
    }

    /* form positioning and animation */
    form, #forgot { 
        position: relative;
        transition: all .5s ease;
    }
    #loginBtn, #registerBtn {
        transition: all .5s ease;

    }
    form#loginform {
    left:0px;
    }
 
    form#registerform {
    left:500px;
    top:-230px;
    opacity: 0;;
   } 
    </style>
</head>
<body>
    <div class="container">
        <div class="login-register">
            <div class="nav-buttons">
                <button id="loginBtn" class='active' >Login </button>
                <button id="registerBtn">Register</button>
            </div>
            <div class="form-group">
                <form action="" id="loginform">
                    <label for="username">username</label>
                    <input type="text" id="username">
                    <label for="password">password</label>
                    <input type="text" id="password">
                    <input type="submit" value="Submit" class="submit">
                </form>
                <form action="" id="registerform">
                    <label for="fullname">fullname</label>
                    <input type="text" id="fullname">
                    <label for="email">email</label>
                    <input type="text" id="email">
                    <label for="passwword">password</label>
                    <input type="text" id="password">
                    <label for="confirmpassword">confirm password</label>
                    <input type="text" id="confirmpassword">
                    <input type="submit" value="Submit" class="submit">
                </form>
            </div>
            <div id="forgot">
                <a href="">forgot password?</a>
            </div>
        </div>

    </div>
    <script>
        var loginBtn = document.getElementById("loginBtn");
        var registerBtn = document.getElementById("registerBtn");
        var loginform = document.getElementById("loginform");
        var registerform = document.getElementById("registerform");
        var forgot = document.getElementById("forgot");

        registerBtn.onclick= function() {
            registerform.style.left='0px';
            registerform.style.opacity='1';
            loginform.style.left='-500px';
            loginform.style.opacity='0';
            forgot.style.left='-500px';
            forgot.style.opacity='0';
            registerBtn.classList.add('active');
            loginBtn.classList.remove('active');

        }

        loginBtn.onclick= function() {
            loginform.style.left='0px';
            loginform.style.opacity='1';
            forgot.style.left='0px';
            forgot.style.opacity='1';
            registerform.style='500px';
            loginBtn.classList.add('active');
            registerBtn.classList.remove('active');
            registerform.style.opacity='0';
        }


        
    </script>
</body>
</html>