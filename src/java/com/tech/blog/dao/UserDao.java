package com.tech.blog.dao;

import com.tech.blog.entites.User;
import java.sql.*;

//this is class
public class UserDao {

    private Connection con;

//    this is consturctor
    public UserDao(Connection con) {
        this.con = con;
    }

//    methods to insert data
    public boolean saveUser(User user) {
        boolean f = false;
        try {

//            user database
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

//new method forfecthing the data from DB for login sysytem
    //User is a return type this method
//    there are two parameters in this method email and password
    public User getUserEmailAndPassword(String email, String password) {

//this is blank object
        User user = null;

//    in place of null i put my user ok 
        try {
            String query = "select *from user where email=? and password=?";
//        with the help of prepared satment we put data in ? here

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

//      restlut set ke form me data agya "set" varuble me
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {

//     inside that i create object of User method
                user = new User();

//     data from Db 
                String name = set.getString("name");
                //to set in user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=?,email=?, password=?, about=?, profile=? where id=?";
            PreparedStatement p = con.prepareStatement(query);

            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getAbout());
            p.setString(5, user.getProfile());
            p.setInt(6, user.getId());

            p.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    public User getUserByUserId(int userId) {
        User user = null;

        try {
            String q = "select *from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {

//     inside that i create object of User method
                user = new User();

//     data from Db 
                String name = set.getString("name");
                //to set in user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }
}
