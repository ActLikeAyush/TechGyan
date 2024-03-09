<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import ="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechGyan</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(100% 18%, 39% 0, 100% 0, 98% 100%, 35% 99%, 100% 84%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="card text-center primary-background text-white banner-background">
                <div class="card-body">  
                    <!--<h3 >स्वागत है मित्रो</h3>-->
                <h3 class="display-3">Welcome to TechGyan..</h3>
                <p>Welcome to technical Gyan, Are you ready to dive into a sea of technology </p>
                <button class="btn btn-outline-light btn-lg">Start its Free</button>
                <a href="login_page.jsp" class="btn btn-outline-light btn-lg">Login</a>
                </div>
            </div>
        </div>
        
        <!--card-->
        
        
        
        
        
        
        <!--dynamic but tempary card--> 
        
        
        
        
        
        
        
        
        <div class="container mt-3">
        <div class="row mt-3">
            <% 
                PostDao postDao = new PostDao(ConnectionProvider.getConnection());
                List<Post> posts = postDao.getAllPosts();
                for (Post post : posts) {
                    
                String truncatedContent = post.getpContent().split("\\r?\\n")[0];
            %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= post.getpTitle() %></h5>
                        <p class="card-text"><%= truncatedContent %></p>
                        <a href="show_blog_page.jsp?post_id=<%= post.getPid() %>" class="btn primary-background text-white">Read more..</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
        
        <!--temp end-->
        
        
        
        
        
        
        <!--non dynamic card-->
        
        
        
<!--        
        

 <div class="col-md-4">
                    
                    <div class="card" >
                    <div class="card-body">
                        <h5 class="card-title">Java</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more..</a>
                    </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    
                    <div class="card" >
                    <div class="card-body">
                        <h5 class="card-title">Java</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more..</a>
                    </div>
                    </div>
                    
                </div>
             </div>
            row2
            <div class="container" >
            <div class="row mt-3">
                
                <div class="col-md-4">
                    
                    <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Java</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more..</a>
                    </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    
                    <div class="card" >
                    <div class="card-body">
                        <h5 class="card-title">Java</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more..</a>
                    </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    
                    <div class="card" >
                    <div class="card-body">
                        <h5 class="card-title">Java</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn primary-background text-white">Read more..</a>
                    </div>
                    </div>
                    
                </div>
            </div>
            </div>        
        
        
        
        -->
        
        
        
        <!--non dynamic card end-->
        
        
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

     
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
   
</script>
    </body>
</html>
