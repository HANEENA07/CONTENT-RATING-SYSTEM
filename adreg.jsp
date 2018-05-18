<%-- 
    Document   : adreg
    Created on : 17 Jan, 2016, 1:08:57 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="design/header.jsp" %>


<h1> Enter The Details
</h1>

<form action="action/adreg_action.jsp">

    <table border="0" style="color: #FFF">
   
    <tbody>
        <tr>
            <td>Agency Registered ID</td>
            <td><input type="text" name="txtadreid" value="" /></td>
        </tr>
        <tr>
            <td>Company Name</td>
            <td><input type="text" name="txtadname" value="" /></td>
        </tr>
        <tr>
            <td>Agency Head</td>
            <td><input type="text" name="txtadhead" value="" /></td>
        </tr>
        <tr>
            <td>Account NO</td>
            <td><input type="text" name="txtadaccno" value="" /></td>
        </tr>
        <tr>
            <td>Bank Name</td>
            <td><input type="text" name="txtadbnkname" value="" /></td>
        </tr>
        <tr>
            <td>Email ID</td>
            <td><input type="text" name="txtadmail" value="" /></td>
        </tr>
        <tr>
            <td>Phone NO</td>
            <td><input type="text" name="txtadphno" value="" /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="txtpass" value="" /></td>
        </tr>
        
        <tr>
            <td>Address</td>
            <td><textarea name="txtaddress" rows="4" cols="20"> </textarea> </td>
        </tr>
        <tr>
            <td><input type="submit" value="REGISTER" /></td>
            <td><input type="reset" value="CANCEL" /></td>
        </tr>
    </tbody>
</table>

</form>

<%@include file="design/footer.jsp" %>
