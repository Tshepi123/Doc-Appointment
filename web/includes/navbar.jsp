<%@page import="com.bean.custBean"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light" > 
    <a class="navbar-brand" href="#">Doctor's Booking Appointment</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active"><a class="nav-link" href="book.jsp">Book Appointment <span class="sr-only">(current)</span></a></li>
                <li class="nav-item active"><a class="nav-link" href="bookingDetails.jsp">View Appointment</a></li>
            </ul>
            
             <!-- 
                Explanation for code below (if cust != null): 
                #If the customer has successfully logged in, navbar will show Customer's Name from database and Logout. 
                #If customer has not logged in, navbar will show Login and Register
                #custB is from loginServlet  (Look below) [session.getAttribute("custB")]         
            -->
            <%
                custBean cust = (custBean) session.getAttribute("custB"); 

                if(cust != null)
                {%>
                    <a class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal"> Hello <%=cust.getName() %></a>                       
                    <a href="logoutServlet" class="btn btn-light my-2 my-sm-0">Logout</a> <!-- References the logout servlet -->                                     
                <%}
                else
                {%>                                    
                    <a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2">Login</a>                    
                    <a href="register.jsp" class="btn btn-light my-2 my-sm-0">Register</a>                   
                <%}
            %>    
         
        </div>                       
    
</nav>
