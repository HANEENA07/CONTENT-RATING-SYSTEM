<%-- 
    Document   : login
    Created on : 16 Jan, 2016, 2:58:07 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="design/header.jsp" %>

<form action="action/adminlogin_action.jsp">

    <table border="0" style="color: #FFF">
  
    <tbody>
        <tr>
            <td>USER NAME</td>
            <td><input type="text" name="txtname" value="" /></td>
        </tr>
        <tr>
            <td>PASSWORD</td>
            <td><input type="password" name="txtpswd" value="" /></td>
        </tr>
       
            <td><input type="submit" value="Login" /></td>
            <td><input type="reset" value="Cancel" /></td>
        </tr>
        <tr>
            <td><a href="forgot.jsp">Forgot Password</a></td>
        </tr>
    </tbody>
</table>
</form>

<%@include file="design/footer.jsp" %>