package com.servlet;

import com.bean.custBean;
import com.connect.DBConnect;
import com.dao.custDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String middleName = request.getParameter("middleName");
        String birthDate = request.getParameter("birthDate");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
               
        custBean CB = new custBean();
        CB.setName(name);
        CB.setSurname(surname);
        CB.setMiddleName(middleName);
        CB.setBirthDate(birthDate);
        CB.setTel(tel);
        CB.setAddress(address);
        CB.setEmail(email);
        CB.setPassword(password);
        
        custDao dao = new custDao(DBConnect.getConn());
        boolean f=dao.addCustomer(CB);  // using method addCustomer, from custDao 
        PrintWriter out = response.getWriter();
        
        HttpSession session;
        
        if(f)
        {
            session = request.getSession();
            session.setAttribute("reg-success", "Registered Successfully");
            response.sendRedirect("register.jsp"); // Will redirect to same page once successfully registered & message above will show "Registered Successfully" (with a link that you can click on to go to the Booking page).(Look at register.jsp) 
        }    
        else {
            session = request.getSession();
            session.setAttribute("failed-msg", "Registration Failed, try again...");
            response.sendRedirect("register.jsp"); // If registration has failed, will stay on registration page and message "Registration Failed, try again..." will show
        }
    }
 
}
