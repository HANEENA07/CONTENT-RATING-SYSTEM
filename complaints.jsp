<%-- 
    Document   : complaints
    Created on : 23 Jan, 2016, 8:24:31 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<%@include file="../user/design/header.jsp" %>

<form action="action/complaint_action.jsp" method="POST">

    <table border="1" style="color: #FFF">
    
    <tbody>
        <tr>
            <td>Name</td>
            <td><input type="text" name="txtname" value="" /></td>
        </tr>
        
        <tr>
            <td>Complaint</td>
            <td><textarea name="txtcomplaint" rows="4" cols="20"></textarea></td>
        </tr>
       <tr>
           <td><input type="submit" value="Submit" /></td>
           <td><input type="reset" value="Cancel" /></td>
        </tr>
    </tbody>
</table>

</form>

<%@include file="../user/design/footer.jsp" %>