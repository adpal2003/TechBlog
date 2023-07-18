<%@page import="com.tech.blog.entites.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entites.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div class="row">




    <%
        
        User uuu=(User)session.getAttribute("currentuser");
        
        Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {

            posts = d.getPostByCatId(cid);

        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-1 text-center' >NO posts in this category...</h3>");
            return;

        }

        for (Post p : posts) {

    %>

    <div class="col-md-6 mt-2">
        <div class="card" >
            <img class="card-img-top" src="Post_Pics/<%=p.getpPic()%>" alt="Card image cap">

            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>




            </div>

            <div class="card-footer bg-dark text-center">
               <%
               LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
               %>
                <a href="" onclick="doLike(<%=p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read more..</a>

                <a href=!#"" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

            </div>

        </div>

    </div>


    <%

        }


    %>

</div>
