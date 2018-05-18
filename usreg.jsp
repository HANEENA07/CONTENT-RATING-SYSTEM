<%-- 
    Document   : usreg
    Created on : 17 Jan, 2016, 12:37:28 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="design/header.jsp" %>

<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>

    <form action="../user/action/reg_action.jsp" method="POST">

<h1> Enter The Details                        
                            
                
    
</h1>  
    
    <h1>
    
        <input type="hidden" name="1" value="" />
      
</h1>

    
    <table border="0" style="color: #FFF">
   
    <tbody>
      
        
        
        <tr>
            <td>Name</td>
            <td><input type="text" name="txtusname" value="" pattern="[a-zA-Z .]{0,500}" required title="Enter valid name (Only characters, space, dot)" /></td>
        </tr>
        <tr>
            <td>Gender</td>
            <td><input type="radio" name="gender" value="Male" checked="checked" />Male<input type="radio" name="gender" value="Female" checked="" />Female</td>
        </tr>
        <tr>
            <td>Address</td>
            <td><textarea name="txtusaddress" rows="5" cols="22">
                </textarea></td>
        </tr>
        <tr>
            <td>Account NO</td>
            <td><input type="text" name="txtusaccno" value="" pattern="[0-9]{11}" required title="Enter valid account number(11 digit)" /></td>
        </tr>
        <tr>
            <td>Bank Name</td>
            <td><input type="text" name="txtusbnkname" value="" /></td>
        </tr>
      
            
        <tr>
            <td>Email ID</td>
            <td><input type="text" name="txtusmail" value="" /></td>
        </tr>
        <tr>
            <td>Phone NO</td>
            <td><input type="text" name="txtusphno" value="" pattern="[0-9]{10,12}" required title="Enter valid Phone (eg: 8974586321, 7896485361, 912486321475)"/></td>
        </tr>
        
        <tr>
            <td><input type="submit" value="REGISTER" /></td>
            <td><input type="reset" value="CANCEL" /></td>
        </tr>
    </tbody>
</table>
</form>




<%@include file="design/footer.jsp" %>

