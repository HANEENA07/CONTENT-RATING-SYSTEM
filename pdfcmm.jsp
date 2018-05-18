<%-- 
    Document   : pdfcmm
    Created on : 10 Apr, 2016, 9:53:07 PM
    Author     : Bibi
--%>
<%-- 
    Document   : pllay
    Created on : 14 Feb, 2016, 5:58:42 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<table style="color: #ffffff">
    <tbody>
    <tr>
        <% String id=request.getParameter("id");
            String select="select * from tbl_content where pdfs='"+id+"' ";
            ResultSet rs=con.getData(select);
            while(rs.next())
            {
             String idd1=rs.getString("user_id");
      String sel1="select * from tbl_user where id='"+idd1+"';";
      ResultSet rs5 = con.getData(sel1);
     rs5.next();   
            %>

   <td>   <%=rs.getString("pdfs")%>posted by     <%=rs5.getString("username")%></td></tr>
               
            
        <%
                
            }
            %>
    </tbody>
</table>
      
            <table border="1" style="color: #ffffff">
                <thead>
                    <tr>
                        <th>comments</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
String SELECT1 = "SELECT * from tbl_comment where name='"+id+"';";
                 
            ResultSet rs1 = con.getData(SELECT1);
  while(rs1.next())
 {
     String idd=rs1.getString("userid");
      String sel="select * from tbl_user where id='"+idd+"';";
      ResultSet rs3 = con.getData(sel);
     rs3.next();
     
 %>
 <tr>
     <td><%=rs3.getString("username")%></td>
     <td><%=rs1.getString("comment")%></td>
     
     
     
 </tr>
 <%
 
 }
 %>
                   
                </tbody>
            </table>



    	<div class="clear"></div>


<%@include file="design/footer.jsp" %>