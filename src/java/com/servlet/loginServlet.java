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

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        String email = request.getParameter("email"); //email is name of email from database table. uEmail is the name of the email from login.jsp
        String password = request.getParameter("password");
        
        custBean CB = new custBean();
        CB.setEmail(email);
        CB.setPassword(password);
        
        custDao dao = new custDao(DBConnect.getConn());
        custBean cust = dao.loginCustomer(CB); //Calling method (loginUser) from userDao
        
        if(cust != null) 
        {
            HttpSession session = request.getSession();
            session.setAttribute("custB", cust);   //custB (short for custBean) Pass on to navbar and book.jsp
            response.sendRedirect("book.jsp");
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("login-failed", "Invalid Email and Password");
            response.sendRedirect("login.jsp");
        }
    }
}
