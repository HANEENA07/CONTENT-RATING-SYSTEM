<%-- 
    Document   : delarticle_action
    Created on : Apr 30, 2016, 4:48:54 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%
    String ph=request.getParameter("phoneno");
    String Delete="delete from tbl_content where cnt_id='"+ph+"'";
    
if(con.executeCommand(Delete))
    {
        response.sendRedirect("delarticle.jsp");
    }
else
    {
        
    }
 %>