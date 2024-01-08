<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <%@include file="includes/head.jsp" %>        
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-header text-center">
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                            <h4>Registration Form</h4>
                        </div>
                        
                        <!-- Code below will show message when customer has successfully registered-->
                        <%
                            String SuccessRegMsg = (String)session.getAttribute("reg-success");
                            
                            if(SuccessRegMsg != null) 
                            {%>    
                            <div class="alert alert-success" role="alert"><%=SuccessRegMsg%> <br> <a href="login.jsp">Click Here To Login</a></div> 
                            <%   
                                session.removeAttribute("reg-success");
                            }
                        %>    
   
                        <!-- Code below will show message when customer has not registered successfully-->
                        <%
                            String FailedRegMsg = (String)session.getAttribute("failed-msg");
                            
                            if(FailedRegMsg != null) 
                            {%>    
                                <div class="alert alert-danger" role="alert"><%= FailedRegMsg %></div>
                            <%     
                                session.removeAttribute("failed-msg");
                            }
                        %>                          
                        
                        <div class="card-body">
                            <form action="registerServlet" method="post"> <!-- The action is the url pattern of the registerServlet -->
                                
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" name="name" placeholder='Enter Your First Name' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Surname</label>
                                    <input type="text" class="form-control" name="surname" placeholder='Enter Your Surname' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Middle Name</label>
                                    <input type="text" class="form-control" name="middleName" placeholder='Enter Your Middle Name' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Birth Date (YYYY/MM/DD)</label>
                                    <input type="text" class="form-control" name="birthDate" placeholder='YYYY/MM/DD' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Telephone No</label>
                                    <input type="number" class="form-control" name="tel" placeholder='Enter Phone Number' required='required'>
                                </div>
                                
                                <div class="form-group">
                                    <label>Home Address</label>
                                    <input type="text" class="form-control" name="address" placeholder='Enter Home Address' required='required'>
                                </div> 
                                
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" placeholder='....@gmail.com' required='required'>
                                </div>                                
                                        
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" class="form-control" name="password" placeholder='********' required='required'>
                                </div>   
                                
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                                
                            </form>
                        </div>        
                    </div>
                </div>
            </div>
        </div>

    </body>    
</html>

