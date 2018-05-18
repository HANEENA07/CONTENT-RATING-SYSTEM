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
            String select="select * from tbl_content where video='"+id+"' ";
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
    </video><figcaption style="color: #ffffff"><%=rs.getString("video")%></figcaption><figcaption style="color: #ffffff">posted by     <%=rs5.getString("username")%>      user id is    <%=rs5.getString("id")%></figcaption><table border="1"></a>
               
            <form action="action/comment_action.jsp"  >      
    <input type="hidden" value="<%=rs.getString("video")%>" name="vid"/>
    <input type="hidden" value="video" name="type"/>
    
     <input type="hidden" value="<%=rs.getString("cnt_id")%>" name="cntid"/>
                <tr>
                    <td style="color: #ffffff">Comment</td>
            <td><textarea name="txtcomment" rows="4" cols="20" required="1"></textarea></td>
        </tr>
        <tr>
            <td style="color: #ffffff">Rating</td>
            <td>&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="1" checked="checked" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="2" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="3" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="4" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="5" /></td>
        </tr>
        <tr><td></td>
            <td><a href="../video/<%=rs.getString("video")%>" download="../video/<%=rs.getString("video")%>" onclick="location.href='action/download.jsp?id=<%=rs.getString("video")%>';">Download</a></td>
            
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
	<!--<div id="mainHolder" style="overflow: hidden; max-height: 400px;">-->
					
        <table border="0" >
   
    <tbody>
           <tr>
            <td> 
 <td> 
    <marquee  direction='up' >
                
               <%
  String select1="select * from tbl_content where video='"+id+"' ";
            ResultSet rs11=con.getData(select1);
     String pho="";     
            while(rs11.next())
            {
             String iddd1=rs11.getString("user_id");
       
                
  
   String sel="select * from tbl_adpost ad,tbl_booking bk where bk.id=ad.userid  and bk.status=-1";
    ResultSet rs2=con.getData(sel);
    while(rs2.next())
    {
       pho=rs2.getString("adimg");
      if(rs2.getString("content").equalsIgnoreCase(id)){
            %>
         
            <img src="../image/<%=pho%>" height="300px" width="400px" />
               <%}
            }
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