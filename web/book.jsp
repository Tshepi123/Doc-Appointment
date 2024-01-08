<%@page import="com.dao.custDao"%>
<%@page import="com.dao.bookingDao"%>
<%@page import="com.connect.DBConnect"%>
<%@page import="com.bean.custBean"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
        <%@include file="includes/head.jsp" %> 
    </head>
    <body>  
        <div class="container-fluid">
            <%@include file="includes/navbar.jsp" %>
            
            <h1 class="text-center">Book Your Appointment</h1> 

            <div class="container">
                <div class="row">
                    <div class="col-md-12">                                           
                        <!-- custB (from LoginServlet) -->
                        <%
                            custBean CB = (custBean)session.getAttribute("custB");
                            if(CB != null) 
                            {%>                                                                
                                <div class="form-group text-center">
                                    <label>Your Registration ID is : <%=CB.getId()%> </label> <!-- This id is from the database table(registration), need it to insert foreign key value into booking table -->
                                </div>                             
                            <%}
                        %>    
                        <div class="card-body">
                            <form action="bookServlet" method="post"> <!-- Will make use of bookServlet-->
                                <div class="form-group">
                                    <label>Enter Your Registration ID To Make A Booking</label>
                                    <input type="text" class="form-control" name="regid" required="required"> <!-- Must enter this number displayed from above to avoid NullPointerException and is also used for foreign key in database table (booking) -->
                                </div>    
                                <div class="form-group">
                                    <label>Select Appointment Date: </label>
                                    <input type="date" class="form-control" name="bookingDate" required="required">
                                <div class="form-group">
                                    <label>Select Appointment Time: </label>
                                    <input type="time" class="form-control" name="bookingTime" required="required">                          
                                </div>  
                                <div class="form-group">
                                    <label>Reason for Appointment</label>
                                    <input type="text" class="form-control" name="reason" required="required">
                                </div>  

                                <div>   

                                <div class=" container text-center">
                                    <button type="submit" class="btn btn-primary">Book</button>
                                </div>
                            </form>
                        </div>
                        <br> <!-- <br> is used to create a new line --> 
                        
                        <!-- Just below the form, if you have successfully added a booking, then addBookingSuccess message will show -->
                        <%
                            String addBookingSuccessMsg = (String)session.getAttribute("addBooking-successMsg");
                            
                            if(addBookingSuccessMsg != null) 
                            {%>    
                                <div class="alert alert-success" role="alert"><%= addBookingSuccessMsg %></div> To View Your Appointment Details <a href="bookingDetails.jsp">Click Here</a></div>
                            <%     
                                session.removeAttribute("addBooking-successMsg");
                            }
                        %>                          
                        
                            <!-- If have NOT added a booking successfully, like maybe entered the wrong regid(registration id number), then addBookingErrorMsg will show -->
                        <%
                            String addBookingErrorMsg = (String)session.getAttribute("addBooking-errorMsg");
                            if(addBookingErrorMsg != null)
                            {%>
                                <div class="alert alert-danger" role="alert"><%= addBookingErrorMsg %></div>
                            <%
                                session.removeAttribute("addBooking-errorMsg");
                            }
                        %>                          
                        
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
