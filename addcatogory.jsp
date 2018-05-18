<%-- 
    Document   : addcatogory
    Created on : 24 Mar, 2016, 11:38:53 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../admin/design/header.jsp" %>


<form action="catoaction.jsp" method="POST">

<table border="1" style="color: #ffffff">
    <thead>
        <tr>
            <th style="color:  #ffffff" font size="20">ADD CATEGORY</th>
      
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Category Name</td>
            <td><input type="text" name="cato" value="" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="submit" /></td>
            <td><input type="reset" value="cancel" /></td>
        </tr>
    </tbody>
</table>

</form>

<%@include file="design/footer.jsp" %>