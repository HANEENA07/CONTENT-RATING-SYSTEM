<%-- 
    Document   : pay_ajax
    Created on : 20 Feb, 2016, 1:02:01 PM
    Author     : Bibi
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
  <%
     String id=request.getParameter("sid");
     String condition="";
     if(!id.equalsIgnoreCase("select"))
     {
         condition=" AND id='"+id+"' ";
     }
  %>  
  <form action="action/adpost_action.jsp" method="POST" enctype="multipart/form-data">

 <table border="1" style="color: #FFF">
    <thead><h1>Payment</h1></thead>

    <tbody>
       
        <tr>
            <td>User Id</td>
            <td><select name="userdrop">
                    <option>Select</option>
                   <%  String q="select distinct(id) from tbl_user ";  
   ResultSet rsitem = con.getData(q);
                        while (rsitem.next()) {
                    %>
                    <option value="<%=rsitem.getString("id")%>"><%=rsitem.getString("id")%></option>
                    <%
                        }
                    %>
                            
                </select></td>
            
        </tr>
        
        
        <tr>
            
                <% 
                        String q1="select * from tbl_user where id='"+id+"' ";  
   ResultSet rsitem1 = con.getData(q1);
                        while (rsitem1.next()) {
                          
                    %>
                    
          <td><input type="text" name="username"  value="<%=rsitem1.getString("username")%>" /> </td>
            
        </tr>
        <tr>
            <td>Amount</td>
            <td><input type="text" name="txtamt" value="" /></td>
            
        </tr>
        <tr>
            <td>From Account</td>
            <td><input type="text" name="txtfrm" value="" /></td>
            
        </tr>
        <tr>
            <td> To Account</td>
            <td><input type="text" name="txtto" value="" /></td>
            
        </tr>
        <tr>
            <td><input type="submit" value="PAY NOW" /></td>
            <td><input type="reset" value="CANCEL" /></td>
            
        </tr>
    </tbody>
</table>

