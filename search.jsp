<%-- 
    Document   : search
    Created on : 21 Apr, 2016, 10:37:44 PM
    Author     : Bibi
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
           
             <td> <input type="text" name="name" value="" onkeyup="doProcessing()"/> </td>
        </tr>
    </tbody>
</table>



<div id="tablediv">
    <%
String SELECT = "SELECT * from tbl_user";
                        
            ResultSet rs = con.getData(SELECT);
  
  
%>

<table border="2" style="color: #ffffff">
   
    <tr><td><font size="4"><font color="black">Name</td><td><font size="4"><font color="black">Gender</td><td><font size="4"><font color="black">Account</td><td><font size="4"><font color="black">Email</td><td><font size="4"><font color="black">Phone</td><td><font size="4"><font color="black">Address</td></tr>
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
     
    
     
 </tr>
 <%
 }
 %>
 </table>

 <%@include file="design/footer.jsp" %>