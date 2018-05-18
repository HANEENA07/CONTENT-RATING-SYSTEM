<%-- 
    Document   : userhmp
    Created on : 16 Jan, 2016, 4:26:45 PM
    Author     : Bibi
--%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 String id1= session.getAttribute("id").toString();
 
     String select1="select * from tbl_user where id='"+id1+"'";
            ResultSet rs1=con.getData(select1);

rs1.next();
%>

<%@include file="design/header.jsp" %>
<h1>Welcome  <%=rs1.getString("username")%></h1>
    	<div class="clear"></div>
          
				
<%@include file="design/footer.jsp" %>