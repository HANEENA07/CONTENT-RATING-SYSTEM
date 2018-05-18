<%-- 
    Document   : UserDetails
    Created on : Apr 11, 2015, 9:20:49 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<!DOCTYPE html>
<%@include file="design/header.jsp" %>

<script type="text/javascript">
    var request;
    function getRequest()
    {
        if (window.XMLHttpRequest)
            return new XMLHttpRequest();
        else if (winodw.ActiveXObject)
            return new ActiveXObject("Microsoft.XMLHTTP");
        else
            return null;
    }
    function doProcessing()
    {
        request = getRequest();
        var url="search_ajax.jsp?sid=" + document.searchForm.name.value;
         
            request.open("GET", url, true);
           
            request.onreadystatechange = function()
            {
                if (request.readyState == 4 || request.status == 200)
                {
                    document.getElementById("tablediv").innerHTML = request.responseText;
                }
            }
            request.send(null);
    }
</script>
<form name="searchForm">
    
<table border="0">
      <tbody>
        <tr>
            <td style="color: #ffffff">Search by Name</td>
             <td> <input type="text" name="name" value="" onkeyup="doProcessing()"/> </td>
        </tr>
    </tbody>
</table>

<form action="UserDetails_action.jsp">
<div id="tablediv">
    <%
String SELECT = "SELECT * from tbl_user ";
                        
            ResultSet rs = con.getData(SELECT);
  
  
%>
<h2 align="center">U S E R &nbsp;&nbsp; D E T A I L S</h2>
<table border="2" style="color: #ffffff">
   
    <tr><td><font size="5"><font color="white">Name</td><td><font size="5"><font color="white">Gender</td><td><font size="5"><font color="white">Account</td><td><font size="5"><font color="white">Email</td><td><font size="5"><font color="white">Phone</td><td><font size="5"><font color="white">Address</td></tr>
 <%
 while(rs.next())
 {
 %>
 <tr>
     <td><%=rs.getString("username")%></td>
     <td><%=rs.getString("gender")%></td>
     <td><%=rs.getString("accno")%></td>
     <td ><%=rs.getString("emailid")%></td>
     <td ><%=rs.getString("phnno")%></td>
     <td ><%=rs.getString("address")%></td>
     
     <td ><a href="UserDetails_action.jsp?phoneno=<%=rs.getString("id")%>" style="color: blue">Delete</a></td>
     
 </tr>
 <%
 }
 %>
 </table>
 </form>
 <%@include file="design/footer.jsp" %>