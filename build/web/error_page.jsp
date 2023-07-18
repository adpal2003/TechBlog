<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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

        <div class="error-head container text-center">
            <img class="img-fluid" src="Images/error.jpg" alt="error-img">
            <h2 class="">Sorry ! Something Went Wrong.....</h2>
            <a href="index.jsp" class="btn btn-primary btn-lg text-white mt-3 ">Home</a>
        </div>


    </body>
</html>
