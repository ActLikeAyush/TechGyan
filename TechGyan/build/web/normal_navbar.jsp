<%-- 
    Document   : normal_navbar
    Created on : 10-Jan-2024, 9:32:03 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
        </li
        
        <li class="nav-item">
            <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span>Login</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span>Sign-up</a>
        </li>
           
        
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

    </body>
</html>
