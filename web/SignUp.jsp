<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>
        <!--bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <!--fontawesome css-->
        <script src="https://kit.fontawesome.com/6834450f00.js" crossorigin="anonymous"></script>
        <style>
            .banner-background{
                clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 89%, 54% 100%, 25% 88%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normalNavbar.jsp" %>
        <main class=" banner-background p-5 " >
            <div class="container    ">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header  bg-primary-subtle text-center">
                                <i class="fa-solid fa-user"></i>
                                <br>
                                <p>SignUp</p>
                            </div>
                            <div class="card-body">
                                <form id="Signup_form" action="SignUpServlet" method="POST">
                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">User name</label>
                                        <input name="user_name" required type="text" class="form-control" id="user_name" placeholder="Enter name" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" required type="password" class="form-control" placeholder="Enter password" id="exampleInputPassword1">
                                    </div>
                                    <div class="mb-3 form-check">
                                        <label for="gender">Select Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="gender" value="male">Male
                                        <input type="radio" id="gender" name="gender" value="female">Female
                                    </div>
                                    <div class="form-floating">
                                        <textarea name="about" class="form-control" placeholder="Please type somthing about yourself" id="floatingTextarea2" style="height: 100px"></textarea>
                                    </div>
                                    <div class="mb-3 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">agree to terms and conditions.</label>
                                    </div>
                                    <br>
                                    <div class="conatiner text-center" id="loader" style="display:none;"> 
                                        <span><i class="fa-solid fa-2x fa-arrows-rotate fa-spin"></i></span>                  
                                        <h4>please wait</h4>
                                    </div>
                                    <div class="text-center">
                                        <button id="submit" type="submit" class="btn btn-primary">SignUp</button>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--javacript tags-->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javaScripts/index.js" type="text/javascript"></script>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
        <script>

            $(document).ready(function () {
                console.log("loaded...");

                $('#Signup_form').on('submit', function (event) {

                    event.preventDefault();

                    let form = new FormData(this);

                    $('#submit').hide();
                    $('#loader').show();

                    //        send sinup servlet
                    $.ajax({
                        url: "SignUpServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $('#submit').show();
                            $('#loader').hide();
                            
                            if (data.trim()=== 'done' ){
                                
                            

                            swal("You have signed up successfully. You will now be redirected to the login page.")
                                    .then((value) => {
                                        window.location = "Login_page.jsp"
                                    });
                                    
                                    }else{
                                        swal(data);
                                    }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#submit').show();
                            $('#loader').hide();
                            swal("something went wrong try again");

                        },
                        processData: false,
                        contentType: false

                    });

                });
            });

        </script>


    </body>
</html>