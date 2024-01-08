package com.dao;

import com.bean.custBean;
import com.connect.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class custDao {   
    private Connection conn;
    
    public custDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean addCustomer(custBean CB) // Creating method addCustomer, which will be used to add a customer into registration database table. Will be used in registerServlet
    {
        boolean f = false;
        
        try {
            String query = "insert into registration(name, surname, middleName, birthDate, tel, address, email, password) values(?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, CB.getName());
            ps.setString(2, CB.getSurname());
            ps.setString(3, CB.getMiddleName());
            ps.setString(4, CB.getBirthDate());
            ps.setString(5, CB.getTel());
            ps.setString(6, CB.getAddress());
            ps.setString(7, CB.getEmail());
            ps.setString(8, CB.getPassword());
            
            int i = ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }    
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    } 
    
    public custBean loginCustomer(custBean CB) // Creating method loginUser which will be used in loginServlet
    {
        custBean cust = null; // Declaring the custBean
        try {
            String query = "select * from registration where email=? and password=?";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, CB.getEmail());
            ps.setString(2, CB.getPassword());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                cust = new custBean();
                cust.setId(rs.getInt("id"));
                cust.setName(rs.getString("name"));
                cust.setSurname(rs.getString("surname"));
                cust.setMiddleName(rs.getString("middleName"));
                cust.setBirthDate(rs.getString("birthDate"));
                cust.setTel(rs.getString("tel"));
                cust.setAddress(rs.getString("address"));
                cust.setEmail(rs.getString("email"));
                cust.setPassword("password");
            }    
        }catch(Exception e) {
            e.printStackTrace();       
        }
        return cust;
    }
    
}