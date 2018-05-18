<%-- 
    Document   : deleteadd
    Created on : Apr 30, 2016, 7:24:46 PM
    Author     : user
--%>



<%@include file="design/header.jsp" %>

<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
 <table>

<%
   
    String sel="select * from tbl_adpost where userid='"+session.getAttribute("id").toString()+"'";
    ResultSet res=con.getData(sel);
    while(res.next())
    {String pho=res.getString("adimg");
   
%>
    
       
            %>
            <tr>    
                <td>
                  
      <img src="../adimg/<%=pho%>" height="300px" width="400px" />
                <td><a href="action/adddelete.jsp?add=<%=res.getString("adid")%>">Delete</a></td>
        </tr>
        
       
    <% 
    }%>
    
     </table>
    
    %>