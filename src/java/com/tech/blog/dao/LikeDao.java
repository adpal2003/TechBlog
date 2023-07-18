
package com.tech.blog.dao;

import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
    Connection con ;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    
public boolean insertLike(int pid,int uid)
{
    boolean f = false;
    try {
        String q= "insert into liked(pid,uid)values(?,?)";
        PreparedStatement ps = this.con.prepareStatement(q);
//        values set     
        ps.setInt(1, pid);
        ps.setInt(2, uid);
        ps.executeUpdate();
        f=true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
  }

public int countLikeOnPost(int pid) {
    int count = 0;
    
    String query = "SELECT COUNT(*) FROM liked WHERE pid=?";
    try {
        PreparedStatement ps = this.con.prepareStatement(query);
        ps.setInt(1, pid);
       
        ResultSet resultSet = ps.executeQuery();
        
        if (resultSet.next()) {
            count = resultSet.getInt("count(*)");
        }
               
    } catch (Exception e) {
        System.out.println(e);
    }
    
    return count;
}


public boolean isLikedByUser(int pid,int uid){
    boolean f = false;
    try {
        
            String sql="select *from liked where pid=? and uid=?";
            PreparedStatement ps = this.con.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
          ResultSet set = ps.executeQuery();
          if(set.next()){
            
              f =true;
          }
    } catch (Exception e) {
    }
    
    return f;
}


public boolean deleteLike(int pid, int uid){
    boolean f = false;
    try {
        String sql = "delete from liked where pid=? and uid=? ";
        PreparedStatement ps =this.con.prepareStatement(sql);
        ps.setInt(1, pid);
        ps.setInt(2, uid);
       ps.executeUpdate();
       f= true;
    } catch (Exception e) {
        System.out.println("e");
    }
    return f;
}
}
