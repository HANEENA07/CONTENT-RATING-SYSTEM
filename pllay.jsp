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
    <tr>
        <% String id=request.getParameter("id");
            String select="select * from tbl_content where video='"+id+"'; ";
            ResultSet rs=con.getData(select);
          
            while(rs.next())
            {
             String idd1=rs.getString("user_id");
      String sel1="select * from tbl_user where id='"+idd1+"';";
      ResultSet rs5 = con.getData(sel1);
     rs5.next();   
            %>
<figure><video width="500" height="390" controls>
                <source src="../video/<%=rs.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
    </video><figcaption style="color: #ffffff"><%=rs.getString("video")%></figcaption><figcaption style="color: #ffffff">posted by     <%=rs5.getString("username")%></figcaption><table border="1"></a>
               
           
            <td><a href="../video/<%=rs.getString("video")%>" download="../video/<%=rs.getString("video")%>" onclick="location.href='action/download.jsp?id=<%=rs.getString("video")%>';">Download</a></td>
            
      
        
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