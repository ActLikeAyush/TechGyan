/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

/**
 *
 * @author HP
 */
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
//        here we create a object of ArrayList
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from categories";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(q);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String description = rs.getString("description");
                String name = rs.getString("name");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "INSERT INTO posts (pTitle, pContent, pCode, pPic, pDate, catId, userId) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?)";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, p.getpTitle());
            pstm.setString(2, p.getpContent());
            pstm.setString(3, p.getpCode());
            pstm.setString(4, p.getpPic());
            pstm.setInt(5, p.getCatId());
            pstm.setInt(6, p.getUserId());
            pstm.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
//    get all the posts
    public List<Post>getAllPosts(){
        
        List<Post> list=new ArrayList<>();
        
//        fatch all the posts
        try{


              PreparedStatement p=con.prepareStatement("select * from posts order by pid asc");
              ResultSet set=p.executeQuery();
              while(set.next()){
                   int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
              }


        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getPostByCatId(int catId){
        
        List<Post> list1=new ArrayList<>();
//        get all posts by catId

         try{
            
            PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
            p.setInt(1,catId);
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                
                Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list1.add(post);
            }
         }
         catch(Exception e){
             e.printStackTrace();
         }
        return list1;
    }
    public Post getPostByPostId(int postId){
        Post post=null;
        
        try{
            String q="select * from posts where pid=?";
           PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set=p.executeQuery();
            if(set.next()){
                
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int userId=set.getInt("userId");
                int cid=set.getInt("CatId");
                post=new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
               
                
            }
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
}
