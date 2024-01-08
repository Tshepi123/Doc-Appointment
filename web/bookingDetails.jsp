<%@page import="com.bean.custBean"%>
<%@page import="com.dao.bookingDao"%>
<%@page import="com.bean.bookingBean"%>
<%@page import="java.util.List"%>
<%@page import="com.connect.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes Page</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>       
        
        <div class="container">
            <h2 class="text-center">All Patient and Appointment Details: </h2>
            
            <br>
           
            <div class="row">
                <div class="col-md-12">
                <!-- po is the list from bookingDao (getData method) -->    
                <%
                    if(cust3 != null)
                    {
                        bookingDao AD = new bookingDao(DBConnect.getConn());
                        List<bookingBean> po = AD.getData(cust3.getId());

                        for(bookingBean BB : po)
                        {%>
                            <div class="container">
                                <table class="table table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Surname</th>
                                            <th scope="col">Birth Date</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Appointment Date</th>
                                            <th scope="col">Appointment Time</th>
                                            <th scope="col">Appointment Reason</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            <tr>
                                                <td> <%=cust3.getName() %> </td> 
                                                <td> <%=cust3.getSurname() %> </td>    
                                                <td> <%=cust3.getBirthDate() %> </td>
                                                <td> <%=cust3.getEmail() %> </td>
                                                <td> <%=BB.getBookingDate()%> </td>
                                                <td> <%=BB.getBookingTime() %> </td>
                                                <td> <%=BB.getReason() %> </td>
                                            </tr>                                
                                    </tbody>
                                </table>
                            </div>            
                        <%}    
                    }
                %>       
                
                </div>
            </div>
        </div>

    </body>
</html>
