package com.servlet;

import com.connect.DBConnect;
import com.dao.bookingDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "bookServlet", urlPatterns = {"/bookServlet"})
public class bookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        int regid = Integer.parseInt(request.getParameter("regid"));
        String bookingDate = request.getParameter("bookingDate");
        String bookingTime = request.getParameter("bookingTime");        
        String reason = request.getParameter("reason");
        
        bookingDao dao = new bookingDao(DBConnect.getConn());
        boolean f = dao.AddBooking(bookingDate, bookingTime, reason, regid);  // The method AddBooking is from bookingDao        
        HttpSession session;
        
          if(f)
        {
            session = request.getSession();
            System.out.println("Data Inserted Successfully"); //This message will show in console(view server output) below if data from book.jsp has been inserted into the database table (booking) Go to databse and enter {select * from appointmentDB.dbo.booking) To see new inserted data
            session.setAttribute("addBooking-successMsg", "Booking Added Successfully"); // Setting this error message to be shown on web app once added booking successfully. This attribute will be used in book.jsp page 
            response.sendRedirect("book.jsp"); 
        } 
        else
        {
            session = request.getSession();
            System.out.println("Data NOT Inserted Successfully"); //This message will show in console(view server output) below if data from book.jsp has NOT been inserted into the database table (booking)
            session.setAttribute("addBooking-errorMsg", "Booking NOT Added, Please try again"); // Setting this error message to be shown on web app if booking has not been added. This attribute will be used in book.jsp page 
            response.sendRedirect("book.jsp"); // Will redirect to the same page to re-enter values in the form.
        }  
    }   
    // *NB To access console, go to services(in between Projects and Files), toggle down to Servers, then right click on Apache Tomcat        
}

