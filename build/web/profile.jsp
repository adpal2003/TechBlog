<%@page import="com.tech.blog.entites.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entites.Message"%>
<%@page import="com.tech.blog.entites.User"%>
<%--<%@page import="java.lang.String"%>--%>
<%@page errorPage="error_page.jsp" %>


<%

    User user = (User) session.getAttribute("currentuser");

    if (user == null) {
        response.sendRedirect("Login_page.jsp");

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>

        <!--fontawesome css-->
        <script src="https://kit.fontawesome.com/6834450f00.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <style>
            .banner-background{
                clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 89%, 54% 100%, 25% 88%, 0 100%, 0 0);
            }
            body{
                background: url(Images/bg-gound.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            
        </style>
    </head>
    <body>
        <!--navbar start-->

        <nav class="navbar navbar-expand-lg navbar-light bg-primary text-white navBarBackground">
            <a  class="navbar-brand" href="index.jsp"><i class="fa-sharp fa-solid fa-blog"></i>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><i class="fa-brands fa-microblog"></i>Blogs <span class="sr-only">(current)</span></a>
                    </li>

                   
                    <li class="nav-item">
                        <a class="nav-link" href="contactUs.jsp"><i class="fa-sharp fa-solid fa-phone"></i>Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><i class="fa-sharp fa-solid fa-blog"></i>Do post</a>
                    </li>


                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal" > <span class=""> <img src="ProfilePics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width:30px "></span> <%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-user"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--navbar end-->
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
        <!--main page-->

        <main>

            <div class="container mt-5">

                <div class="row">
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All posts</a>
                            <!--categories-->
                            <%                               PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%=cc.getCid()%>, this)" class=" c-link  list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%
                                }
                            %>



                        </div>
                    </div>
                    <!--//second coloumn-->

                    <div class="col-md-8">
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-spin fa-3x"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>



        </main>







        <!--profile details start-->
        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header  bg-primary">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container justify-content-center text-center">
                            <img src="ProfilePics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width:130px ">
                            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
                            <!--deatails start-->
                            <div class="" id="profle-details">


                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%=user.getId()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%=user.getEmail()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td colspan="2"><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td colspan="2"><%=user.getAbout()%></td>

                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <!--//details end-->
                            <!--profile edit-->

                            <div class="" id="profile-edit" style="display: none">

                                <form class="" action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id:</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input class="form-control" type="email" name="user_email" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input class="form-control" type="text" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input class="form-control" type="password" name="user_password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender:</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About:</td>
                                            <td>
                                                <textarea rows="4" class="form-control" name="user_about"><%=user.getAbout()%>
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Edit profile:</td>
                                            <td> <input type="file" name="image" class="form-control"></td>
                                        </tr>
                                    </table>  

                                    <div class="conatiner"> 
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>          

                                </form>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="editProfileBtn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--profile details-->



        <!--add post modal-->
        <!-- Button trigger modal -->


        <!-- Modal -->



        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>


                    <!--this is form-->

                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>...select Categories...</option>


                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {


                                    %>

                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height:100px" placeholder="Enter your content" ></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height:100px" placeholder="Enter your program (if any)" ></textarea>
                            </div>
                            <div class="form-group">
                                <label>Upload your pic....</label>
                                <br>
                                <input name="pic" type="file" >
                            </div>
                            <div class="container text-center mb-2">
                                <button class="btn btn-outline-primary" type="submit">Post</button>
                            </div>

                        </form>
                    </div>

                    <!--form end-->           



                </div>
            </div>
        </div>
        <!--post modal end-->


        <!--javacript tags-->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="javaScripts/index.js" type="text/javascript"></script>
        <script>
                                $(document).ready(function () {
                                    let editProfile = false;
                                    $('#editProfileBtn').click(function () {

                                        if (editProfile == false) {
                                            $("#profle-details").hide();
                                            $("#profile-edit").show();
                                            editProfile = true;
                                            $(this).text("Back")

                                        } else {
                                            $("#profle-details").show();
                                            $("#profile-edit").hide();
                                            editProfile = false;
                                            $(this).text("Edit")
                                        }

                                    });
                                });
        </script>


        <!--now adding post js-->
        <script>
            $(document).ready(function () {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("you have clicked");
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            // success
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "saved successfully", "success");


                            } else {
                                swal("Error!", "something went wrong try again.....", "Error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            // unsuccessful
                            swal("unsuccessful!", "something went wrong try again.....", "unsuccessful");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>


        <!--loading post using ajax-->
        <script>
            function getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();
                $(".c-link").removeClass('active');


                $.ajax({
                    url: "Load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $('#post-container').show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');

                    }

                })
            }
            $(document).ready(function (e) {
                letAllPostRef = $('.c-link')[0]
                getPosts(0, letAllPostRef);


            });
        </script>




    </body>
</html>
