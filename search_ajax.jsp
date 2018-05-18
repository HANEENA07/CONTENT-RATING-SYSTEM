<%-- 
    Document   : search_ajax
    Created on : 21 Apr, 2016, 10:42:13 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>


<%
     String auth=request.getParameter("sid");
     String condition="";
        if(!auth.equalsIgnoreCase("select")){
         condition=" AND date='"+auth+"' ";
     }
      
    %>

    
    
    
     <%
        
        if(auth.equals(""))
        {
            %>
    <h2 align="center">U S E R &nbsp;&nbsp; D E T A I L S</h2>
    <table border="2" style="color: #ffffff">
   
    <tr><td><font size="5"><font color="white">Name</td><td><font size="5"><font color="white">Gender</td><td><font size="5"><font color="white">Account</td><td><font size="5"><font color="white">Email</td><td><font size="5"><font color="white">Phone</td><td><font size="5"><font color="white">Address</td></tr>

    
    
    
    <%
String SELECT = "SELECT * from tbl_user where del=0";
                        
            ResultSet rs = con.getData(SELECT);
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
   <%
              }
        else
        {
              %>
              <h2 align="center">U S E R &nbsp;&nbsp; D E T A I L S</h2>
             <table border="2" style="color: #ffffff">
   
    <tr><td><font size="5"><font color="white">Name</td><td><font size="5"><font color="white">Gender</td><td><font size="5"><font color="white">Account</td><td><font size="5"><font color="white">Email</td><td><font size="5"><font color="white">Phone</td><td><font size="5"><font color="white">Address</td></tr>

      
              <%
String SELECT = "SELECT * from tbl_user where username like '"+auth+"' and del=0";
                        
            ResultSet rs = con.getData(SELECT);
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
 %> </table>
   <%
              }%>