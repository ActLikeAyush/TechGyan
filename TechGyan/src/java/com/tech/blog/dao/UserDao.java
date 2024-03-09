
package com.tech.blog.dao;
import com.mysql.cj.jdbc.PreparedStatementWrapper;
import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {
    private Connection con;

    //Whenever you want to use this class you have to create an object using this constructor 
    //And whenever you create an object so you have to give the connection otherwise your object would not create 
    public UserDao(Connection con) {
        this.con = con;
    }
    //methord to insert user data 
    public boolean saveUser(User user)
    {
        boolean f=false;
        try{
                
                String query="insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
                PreparedStatement ptmt=this.con.prepareStatement(query);
                ptmt.setString(1,user.getName());
                ptmt.setString(2,user.getEmail());
                ptmt.setString(3,user.getPassword());
                ptmt.setString(4,user.getGender());
                ptmt.setString(5,user.getAbout());
                ptmt.executeUpdate();
                f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get user by useremail and UserPasword:
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try{
            String query="select * from user where email=? and password=?;";
            PreparedStatement ptmt=con.prepareStatement(query);
            ptmt.setString(1, email);
            ptmt.setString(2, password);
            
            ResultSet rs=ptmt.executeQuery();
            if(rs.next()){
                user=new User();
                //data from DB
                String name=rs.getString("name");
                //set to user object
                user.setName(rs.getString("name"));
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    //for updating user
    public boolean updateUser(User user){
        boolean f=false;
        try{
            String query="update user set name=? , email=? , password=? , gender=? , about=? , profile=?  where id=? ";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6,user.getProfile());
            p.setInt(7, user.getId());
            
            p.executeUpdate();
            f=true;
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        return f;
    }
    public User getUserByUserId(int userId){
        User user=null;
        
        try{
            String q="select * from user  where id=?";
            PreparedStatement pstm=this.con.prepareStatement(q);
            pstm.setInt(1, userId);
            ResultSet rs=pstm.executeQuery();
             if(rs.next()){
                user=new User();
                //data from DB
                String name=rs.getString("name");
                //set to user object
                user.setName(rs.getString("name"));
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
}
