package com.dao;

import com.bean.bookingBean;
import com.bean.custBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class bookingDao {
    
    private Connection conn;
    
    public bookingDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
    //da = bookingDate,  ti= bookingTime, re = reason, rid = regid (Setting Parameters)
    public boolean AddBooking(String da, String ti, String re, int rid) //Method AddBooking will insert info into database booking from book.jsp using the bean class bookingBean
    {
        boolean f=false;
        try {
            String query = "insert into booking(bookingDate, bookingTime, reason, regid) values(?, ?, ?, ?)"; 
            // The booking data will be inserted into database table (booking)
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1,da);
            ps.setString(2,ti);
            ps.setString(3, re);
            ps.setInt(4,rid); 
            
            int i = ps.executeUpdate();
            if(i == 1)
            {
                f=true;
            }    
        } catch (Exception e) {
            
        }
        return f;
    }    
    
        // Creating ArrayList for bookingDetails.jsp
    public List<bookingBean> getData(int regid) // The method getData() is created to get all the info from the database table (booking)
    {
        List<bookingBean> list = new ArrayList<>(); //Initailising the ArrayList 
        bookingBean po = new bookingBean(); // Initialising the bean class
              
        try {
            
            String query = "select * from booking where regid = ?"; // selecting all data from the booking table from database, by the regid (foreign key) which was inserted when adding booking.  
                                                                    // This method getData will be used to show the data in bookingDetails.jsp
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, regid);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                po.setId(rs.getInt(1));
                po.setBookingDate(rs.getString(2));
                po.setBookingTime(rs.getString(3));
                po.setReason(rs.getString(4));              
                list.add(po);
            }    
        } catch (Exception e) {            
        }
        return list;
    }  
}