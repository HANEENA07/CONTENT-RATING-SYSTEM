<%-- 
    Document   : catoaction
    Created on : 5 Apr, 2016, 2:30:53 PM
    Author     : Bibi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>

<%
        
        String nam=request.getParameter("cato");
        String select="insert into tbl_cato(name)values('"+nam+"');";
        if(con.executeCommand(select))
        {
          response.sendRedirect("addcatogory.jsp");
        }
        else
        {
            response.sendRedirect("addcatogory.jsp?err=error on the page"); 
        }
        
%>