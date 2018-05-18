<%-- 
    Document   : pllay
    Created on : 14 Feb, 2016, 5:58:42 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<table>
    <tr>
        <% String id=request.getParameter("id");
            String select="select * from tbl_content where picture='"+id+"' ";
            ResultSet rs=con.getData(select);
            while(rs.next())
            {
             String idd1=rs.getString("user_id");
      String sel1="select * from tbl_user where id='"+idd1+"';";
      ResultSet rs5 = con.getData(sel1);
     rs5.next(); 
            %>
    <figure><img src="../image/<%=rs.getString("picture")%>" height="200" width="200" alt="loding....."/></a><figcaption style="color: #ffffff"><%=rs.getString("picture")%></figcaption><figcaption style="color: #ffffff"> Posted by  <%=rs5.getString("username")%>  User id is <%=rs.getString("user_id")%></figcaption></figure></a><table border="1"></a>
               
            <form action="action/comment_action.jsp"  >      
    <input type="hidden" value="<%=rs.getString("picture")%>" name="vid"/>
     <input type="hidden" value="<%=rs.getString("cnt_id")%>" name="cntid"/>
     <%--   <tr>
            <td>Comment</td>
            <td><textarea name="txtcomment" rows="4" cols="20"></textarea></td>
        </tr>
        <tr>
            <td>Rating</td>
            <td>&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="1" checked="checked" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="2" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="3" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="4" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="5" /></td>
        </tr>--%>
        <tr><td></td>
            <td><a href="../image//<%=rs.getString("picture")%>" download="../image/<%=rs.getString("picture")%>" onclick="location.href='action/imgdownload.jsp?id=<%=rs.getString("picture")%>';">Download</a></td>
            
        </tr>
        <%--<tr>
            <td><input type="submit" value="Post" /></td>
            <td></td>
        </tr>--%>
        <%
                
            }
            %>
    </tbody>
</table>
      
</figure></td>



<%@include file="design/footer.jsp" %>