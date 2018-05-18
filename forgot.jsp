<%-- 
    Document   : forgot
    Created on : 6 May, 2016, 1:12:29 AM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="design/header.jsp" %>
<form action="viewpass.jsp">

<table border="1">
    
    <tbody>
        <tr>
            <td>USER NAME</td>
            <td><input type="text" name="user" value="" /></td>
        </tr>
        <tr>
            <td>ACCOUNT NUMBER</td>
            <td><input type="text" name="acc" value="" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="submit" />
                
            </td>
            
        </tr>
    </tbody>
</table></form>
    
<%@include file="design/footer.jsp" %>