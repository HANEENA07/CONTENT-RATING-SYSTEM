<%-- 
    Document   : post
    Created on : 14 Feb, 2016, 12:04:18 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<h2 align="center">P O S T I N G S</h2>
<table border="1">
    <thead>
        <tr>
            <th style="color: #ffffff">Name</th>
            <th style="color: #ffffff">Content</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
       
        <%
            
            String sel="select * from tbl_content where user_id='"+session.getAttribute("id")+"'and video like '%.%' ;";
            ResultSet rs=con.getData(sel);
            while(rs.next())
            {
                
            
            %>
         <tr>
        
             <td style="color: #ffffff"><%=rs.getString("video")%></td>
            <td></td>
            <td><a href="action/delete.jsp?id=<%=rs.getString("cnt_id")%>">Delete</a></td>
        
        <%
            
        }
            %>
            </tr>
           <%
            
            String sel1="select * from tbl_content where user_id='"+session.getAttribute("id")+"' and picture like '%.%';";
            ResultSet rs1=con.getData(sel1);
            while(rs1.next())
            {
                
            
            %>
        
         <tr>
            <td style="color: #ffffff"><%=rs1.getString("picture")%></td>
            <td></td>
            <td><a href="action/delete.jsp?id=<%=rs1.getString("cnt_id")%>">Delete</a></td>
        
        <%
            
        }
            %></tr>
           <%
            
            String sel11="select * from tbl_content where user_id='"+session.getAttribute("id")+"' and pdfs like '%.%';";
            ResultSet rs11=con.getData(sel11);
            while(rs11.next())
            {
                
            
            %>
        
         <tr>
            <td style="color: #ffffff"><%=rs11.getString("pdfs")%></td>
            <td></td>
            <td><a href="action/delete.jsp?id=<%=rs11.getString("cnt_id")%>">Delete</a></td>
        
        <%
            
        }
            %></tr>
    </tbody>
</table>
