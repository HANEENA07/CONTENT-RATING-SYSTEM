<%-- 
    Document   : UserDetails_action
    Created on : Apr 18, 2015, 9:44:11 AM
    Author     : VISHNU S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%
 

   String id=request.getParameter("phoneno");
   
   
   
   String select="update tbl_user set del='10' where id='"+id+"';";
        
        if(con.executeCommand(select))
        {
          response.sendRedirect("UserDetails.jsp");
        }
        else
        {
            response.sendRedirect("UserDetails.jsp?err=error on the page"); 
        }
        %>

