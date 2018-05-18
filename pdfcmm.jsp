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

   <td>   <%=rs.getString("pdfs")%>   posted by     <%=rs5.getString("username")%></td></tr>
               
            <form action="action/comment_action.jsp"  >      
    <input type="hidden" value="<%=rs.getString("pdfs")%>" name="vid"/>
     <input type="hidden" value="<%=rs.getString("cnt_id")%>" name="cntid"/>
         <input type="hidden" value="article" name="type"/>
                <tr>
            <td>Comment
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="txtcomment" rows="4" cols="20" required="1"></textarea></td>
        </tr>
        <tr>
            <td>Rating
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="1" checked="checked" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="2" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="3" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="4" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="5" /></td>
        </tr>
        
        <tr>
            <td><input type="submit" value="Post" /></td>
            <td></td>
        </tr>
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


<aside class="sidebar big-sidebar right-sidebar">
	<div id="mainHolder" style="overflow: hidden; max-height: 400px;">
					
        <table border="0" >
   
    <tbody>
           <tr>
            <td> 
 <td> 
    <marquee  direction='up' >
                
               <%
                   String pho="";
   String sel="select adimg from tbl_adpost ";
    ResultSet rs2=con.getData(sel);
    while(rs2.next())
    {
       pho=rs2.getString("adimg");
            %>
         
      <img src="../adimg/<%=pho%>" height="300px" width="400px" />
               <%
            }
                %>
    </marquee>
    
 </td>
        </tr>
    </tbody>
</table>
</aside>
                  </aside>
    	<div class="clear"></div>


<%@include file="design/footer.jsp" %>