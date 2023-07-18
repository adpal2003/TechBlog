

<%@page import="com.tech.blog.entites.Message"%>
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
        <main class="d-flex align-items-center banner-background" style="height: 80vh;">
            <div class="container ">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header bg-primary-subtle text-center">
                                <i class="fa-solid fa-user-secret w-8"></i>
                                <br>
                                <p>Login</p>
                            </div>
                            <%

                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>

                            <div class="alert <%=m.getCssClass()%>" role="alert">
                                <!--this is expression tag-->
                                <%=m.getContent()%>
                            </div>

                            <%
                                    session.removeAttribute("msg");
                                }

                            %>
                            <div class="card-body">
                                <form action="LoginServlet" method="Post">
                                    <div class="mb-3">
                                        <label  for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Login</button>
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
    </body>
</html>
