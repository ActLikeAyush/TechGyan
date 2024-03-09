<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.sql.Timestamp"%>
<!--if any error occur than-->
<%@page errorPage="error_page.jsp" %>
<!--now ham jis user ka session set kar rahe the ushi user ko show karenge -->
<!--ushkeliye-->
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(100% 18%, 39% 0, 100% 0, 98% 100%, 35% 99%, 100% 84%, 0 100%, 0 0);
            }
            .c-link.active{
                background-color: rgb(29 69 127 / 89%);
            }
              body{
                 
            
            background: url('images/J4o.gif');
            background-size: cover;
            background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--navbar start-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-cubes"></span>TechGyan</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-at"></span>Learn Code</a>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-check-square-o"></span>Categories
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Programming Language</a></li>
                                <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Data Structure</a></li>
                            </ul>
                        </li>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#" ><span class="fa fa-address-card-o"></span>Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#" data-toggle="modal" data-target="#add-post-modal" ><span class="fa fa-asterisk "></span>Do Post</a>
                        </li>



                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-model"><span class="fa fa-user"></span> <%= user.getName()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle"></span>Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!--navbar end-->


        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>



        <!--main body start-->

        <main>
            <div class="container" ">

                <div class="row">
                    <!--first column--> 
                    <div class="col-md-4 mt-4" ">
                        <!--categories-->

                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--all categories-->
                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                            %>

                               <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>

                            <%
                                }

                            %>

                        </div>

                    </div>
                    <!--second column-->
                    <div class="col-md-8 mt-4" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin " style="color:lightgray"></i>
                            <h3 class="mt-2">loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">
                            
                        </div>



                    </div>
                </div>

            </div>

        </main>



        <!--main body ends-->



        <!--profile modal--> 


        <!-- Modal -->
        <div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">

                        <h5 class="modal-title" id="exampleModalLabel"> TechGyan </h5>
                        <br>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;">
                            <br>
                            <h5 class="model-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--details-->
                            <div id="profile-details">    
                                <table class="table table-striped">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display:none;">
                                <h3 class="mt-2">Please Edit CareFully</h3>
                                <!--it mean's your form Contain mutipart data like pic's and all--> 
                                <form action="EditServlet" method='post' enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr> 
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>

                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender()%></td>

<!--<td><input type="text" name="user_gender" class="form-control" value="<%= user.getGender()%>"></td>-->
                                        </tr>
                                        <tr>
                                            <td>Registered on :</td>
                                            <td><%= user.getDateTime().toString()%></td>

<!--<td><input type="text" name="user_email" class="form-control" value="<%= user.getDateTime().toString()%>"></td>-->
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea class="form-control" name="user_about" rows="3" ><%= user.getAbout()%></textarea>
                                            </td>

                                            <!--<td><input type="text" class="form-control" name="user_about" value=""></td>-->
                                        </tr>
                                        <tr>
                                            <td>New Profile Pic :</td>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->


        <!--add post modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <!--<label>Select Your Categories </label>-->
                                <select name="category" class="form-control">
                                    <option selected disabled> --- Select Category --- </option>
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
                            <br>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                            </div>
                            <br>
                            <div class="form-group">
                                <textarea name="pContent" placeholder="Enter Post Content" style="height:100px" class="form-control"></textarea>
                            </div>
                            <br>
                            <div class="form-group">
                                <textarea name="pCode" placeholder="Enter Your Program (if any..)" style="height:100px" class="form-control"></textarea>
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Select Your Pic..</label>
                                <br>
                                <input type="file" name="pic">
                            </div>
                            <br>
                            <div class="container text-center" >
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                    <!--                    <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>-->
                </div>
            </div>
        </div>


        <!--end post modal-->
        <!--
                <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        
                <script src="js/myjs.js" type="text/javascript"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>-->


        <!-- Include jQuery -->


        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <!-- Include Bootstrap JS (Bundle includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!--sweet alet cdn-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!-- Your custom script -->
        <script src="js/myjs.js" type="text/javascript"></script>



        <!--        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>



        <script>
            $(document).ready(function () {
                let editstatus = false;
                $('#edit-profile-button').click(function () {
//                       alert("yeshhhh") 
//        toggle logic
                    if (editstatus == false) {
                        $('#profile-details').hide()
                        $('#profile-edit').show()
                        editstatus = true;
//                    for Changing the button text
                        $(this).text("Back")
                    } else {
                        $('#profile-details').show()
                        $('#profile-edit').hide()
                        editstatus = false;
//                    for Changing the button text
                        $(this).text("Edit")
                    }
                });
            }
            );
        </script>

        <!--now add post js-->

        <script>
            /*  $(document).ready(function (e) {
             
             $('#add-post-form').on("submit", function (event) {
             //this code get called when form is submitted..
             event.preventDefault();//this action stops forms normal behaviour it will stop form to submit as asynchronously
             //now fetch all the data of form and store it in the form variable
             console.log("form submitted..")
             let form = new FormData(this);//this key <- add all the data into form
             //now requesting to server
             $.ajax({
             url: 'AddPostServlet',
             type: 'POST',
             data: form,
             success: function (data, testStatus, jqXHR) {
             //success.. 
             console.log(data)
             },
             error: function (jqXHR, textStatus, errorThrown) {
             //error..
             console.error('Error:', textStatus, errorThrown);
             },
             //
             processData: false,
             //our form cantaine pic thats why we have to make it false
             contentType: false
             //
             })
             })
             })*/



            $(document).ready(function (e) {
                $('#add-post-form').on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({
                        url: 'AddPostServlet',
                        type: 'POST',
                        data: form,
                        success: function (data, testStatus, jqXHR) {
                            console.log("Success:", data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Saved successfully", "success");
                            } else {
                                swal("Error!!!,", "Somthing went worng try again!!!..", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!!!,", "Somthing went worng try again!!!..", "error");
                            console.error('Error:', textStatus, errorThrown);
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <!--loading post using ajax-->

        <script>
            
            function getPosts(catId, temp){
                $('#loader').show();
                $('#post-container').hide();
                $('.c-link').removeClass('active');
                
                $.ajax({
                    url:"load_posts.jsp",
                    
//                    this vale is go into the server
//                        kry  value 
                    data:{cid:catId},
                    success:function(data, textStatus, jqXHR){
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    },
            error: function (jqXHR, textStatus, errorThrown) {
            console.error('Error:', textStatus, errorThrown);
            }
            })
            }
            $(document).ready(function (e){
                
                    let allPostRef=$('.c-link')[0]
                    getPosts(0,allPostRef)
            
            })
        </script>
    </body>
</html>
