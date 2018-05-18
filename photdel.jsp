<%-- 
    Document   : photdel
    Created on : 28 Mar, 2016, 7:50:13 AM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%
    String ph=request.getParameter("phoneno");
    String Delete="delete from tbl_content where cnt_id='"+ph+"'";
    
if(con.executeCommand(Delete))
    {
        response.sendRedirect("delphoto.jsp");
    }
else
    {
        
    }
 %>