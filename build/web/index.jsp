<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
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
        <!--here i include Navbar-->       
        <%@include file="normalNavbar.jsp" %>
        <div class="container-fluid m-0 p-0 banner-background">
            <div class="jumbotron navBarBackground text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>      
                    <p>Searching for the latest tech news? Don't worry, you've come to the right place! Keep reading and you'll find out what you need to know.
                    </p>
                    <p>qui dolorem eum fugiat, quo voluptas nulla pariatur? [33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et qua
                    </p>
                    <button type="button" class="btn btn-outline-primary btn-lg"><i class="fa-solid fa-road-lock"></i>Start its free--></button>
                    <a href="Login_page.jsp" type="button" class="btn btn-outline-primary btn-lg"><i class="fa-solid fa-spin fa-user-secret"></i>Login</a>
                </div>    
            </div>
        </div>

        <!--start div-->


        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="card mb-3">
                        <img src="Images/bg-gound.jpg" class="card-img-top" alt="Article 1">
                        <div class="card-body">
                            <h5 class="card-title">Article 1</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                erat a ante.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                   
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Categories</h5>
                            <ul class="list-group">
                                <li class="list-group-item">Technology</li>
                                <li class="list-group-item">Gadgets</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Programming</li>
                                <li class="list-group-item">Artificial Intelligence</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="card mb-3">
                        <img src="Images/bg-gound.jpg" class="card-img-top" alt="Article 1">
                        <div class="card-body">
                            <h5 class="card-title">Article 1</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                erat a ante.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <img src="Images/bg-gound.jpg" class="card-img-top" alt="Article 2">
                        <div class="card-body">
                            <h5 class="card-title">Article 2</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                erat a ante.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--start div end-->

        <!--second div start div-->
        
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card bg-secondary text-white mb-3">
                        <img src="Images/bg-gound.jpg" class="card-img-top" alt="Article 4">
                        <div class="card-body">
                            <h5 class="card-title">Article 4</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                erat a ante.</p>
                            <a href="#" class="btn btn-light">Read More</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card bg-primary text-white mb-3">
                        <img src="Images/bg-gound.jpg" class="card-img-top" alt="Article 5">
                        <div class="card-body">
                            <h5 class="card-title">Article 5</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                erat a ante.</p>
                            <a href="#" class="btn btn-light">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <!--second div start div-->
       
       <hr>
       
        <footer>
            <!-- Footer Section -->
            <footer class="bg-light py-4 text-center">
                <p>&copy; 2023 TechBlog. All rights reserved.</p>
            </footer>
        </footer>







        <!--javacript tags-->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javaScripts/index.js" type="text/javascript"></script>







    </body>
</html>
