<%-- 
    Document   : compdel
    Created on : 21 Apr, 2016, 10:57:00 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%
    String ph=request.getParameter("phoneno");
    String Delete="delete from tbl_complaint where idno='"+ph+"'";
    
if(con.executeCommand(Delete))
    {
        response.sendRedirect("complaintiew.jsp");
    }
else
    {
        
    }
 %>  