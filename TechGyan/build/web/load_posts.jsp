
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div class="row">
    <%

        
        
        User uuu= (User) session.getAttribute("currentUser");
        
        
        
        
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        List<Post> posts = null;
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category...</h3>");
            return;
        }

        for (Post p : posts) {
//            this line show one one line of content
             String truncatedContent = p.getpContent().split("\\r?\\n")[0];
    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pic/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
              
                <b> <%= p.getpTitle()%> </b>
                <p> <%= truncatedContent %> </p>
<!--                <pre><%= p.getpCode() %></pre>-->
                 
                <!--url rewriting-->
                
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More...</a>
            </div>
            <%
               LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
            %>
            <div class="card-footer text-right primary-background">
             
                <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=uuu.getId()%>)" class=" btn-outline-primary btn-l "  style="margin-right: 10px;color: red"><i class="fa fa-heart" ></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                <a href="#!"class="btn-outline-primary btn-l "  ><i class="fa fa-commenting-o"><span>10</span></i></a>
                

            </div>
        </div>
    </div>
                
    <%
        }
        
    %>

</div>