<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <main class=" primary-background">

            <div class="container">

                <div class="col-md-6 offset-md-3">

                    <div class="card banner-background">

                        <div class="card-header text-center primary-background text-white ">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here..

                        </div>

                        <div class="card-body">


                            <form action="RegisterServlet" method="post" id="reg-form">
                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_eamil" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>

                                <div class="mb-3">
                                    <label  >Select Gender:</label>
                                    <br>
                                    <input type="radio" id="genderMale" value="Male" name="gender">Male
                                    <input type="radio" id="genderFemale" value="Female" name="gender">Female
                                </div>

                                <div class="mb-3 form-check">

                                    <textarea class="form-control" name="about"  rows="5" placeholder="Tell me somthing about your self"></textarea>

                                </div>

                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="check">
                                    <label class="form-check-label" for="check">agree terms and coditions </label>
                                </div>
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class=" fa fa-refresh fa-spin fa-2x"></span>
                                    <h4>please wait</h4>
                                </div>
                                <br>
                                <button id="submit-button" type="submit" class="btn btn-primary">Submit</button>
                            </form>


                        </div>

                        <div class="card-footer">


                        </div>
                    </div>
                </div>
            </div>
        </main>


        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
//            $(document).ready(function () {
//                console.log("loading!!!!!!!!!!")
//                $('#reg-form').on('submit', function (event) {
//                    event.preventDefault();
//                    let form = new FormData(this);
//
//                    $("#submit-button").hide();
//                    $("#loader").show();
//                    // send register servlet:
//                    $.ajax({
//                        url: "RegisterServlet",
//                        type: 'POST',
//                        data: form, // Fix the typo here
//                        success: function (data, textStatus, jqXHR) {
//                            console.log(data)
//
//                            $("#submit-button").show();
//                            $("#loader").hide();
//
//                            swal({
//                                title: "Welcome to techGyan!",
//                                text: "You registered successfully !",
//                                icon: "success",
//                                button: "done!",
//                            });
//                        },
//                        error: function (jqXHR, textStatus, errorThrown) {
//                            console.log(jqXHR);
//                        },
//                        processData: false,
//                        contentType: false
//                    });
//                });
//            });

$(document).ready(function () {
    $('#reg-form').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);

        $("#submit-button").hide();
        $("#loader").show();

        $.ajax({
            url: "RegisterServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                $("#submit-button").show();
                $("#loader").hide();

                swal({
                    title: "Welcome to techGyan!",
                    text: "You registered successfully!",
                    icon: "success",
                    button: "done!",
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#submit-button").show();
                $("#loader").hide();

                if (jqXHR.status === 400) {
                    // Bad request (validation error)
                    swal({
                        title: "Error!",
                        text: "Please fill in all the required fields correctly.",
                        icon: "error",
                        button: "OK",
                        dangerMode: true,
                    });
                } else {
                    // Other server-side errors
                    swal({
                        title: "Error!",
                        text: "An error occurred while processing your request. Please try again later.",
                        icon: "error",
                        button: "OK",
                        dangerMode: true,
                    });
                }
            },
            processData: false,
            contentType: false
        });
    });
});
        </script>
    </body>
</html>
