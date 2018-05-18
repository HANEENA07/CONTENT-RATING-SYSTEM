<%-- 
    Document   : usreg
    Created on : 17 Jan, 2016, 12:37:28 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<script type="text/javascript">
    function fns()
    {
        alert("Succesfully updated");
    }
</script>
<%
String id=session.getAttribute("id").toString();
String s=" select * from tbl_user where id='"+id+"' ";
 ResultSet rs = con.getData(s);
     rs.next();  
  
%>



<h2 align="center"> E N T E R&nbsp;&nbsp; T H E&nbsp;&nbsp; D E A I L S                        
                            
                
    
</h2>  
    
    <h1>
    
        <input type="hidden" name="1" value="" />
      
</h1>

<form action="action/prupdate.jsp"  onsubmit="fns();" method="POST">
    <table border="0" style="color: #FFF">
   
    <tbody>
      
        
        
        <tr>
            <td>Name</td>
            <td><input type="text" name="txtusname" value="<%=rs.getString("username")%>" pattern="[a-zA-Z .]{0,500}" required title="Enter valid name (Only characters, space, dot)" /></td>
        </tr>
        
        <tr>
            <td>Address</td>
            <td><textarea name="txtusaddress" rows="5" cols="22" required=""><%=rs.getString("address")%></textarea></td>
        </tr>
        <tr>
            <td>Account NO</td>
            <td><input type="text" name="txtusaccno" value="<%=rs.getString("accno")%>" pattern="[0-9]{11}" required title="Enter valid account number(11 digit)" /></td>
        </tr>
        <tr>
            <td>Bank Name</td>
            <td><input type="text" name="txtusbnkname" required="" value="<%=rs.getString("bankname")%>" /></td>
        </tr>
      
            
        <tr>
            <td>Email ID</td>
            <td><input type="text" name="txtusmail" value="<%=rs.getString("emailid")%>" pattern="[a-zA-Z0-9., ]{1,200}[@]{1}[gmailhotulkyredf]{5,7}[.]{1}[cominrg]{2,3}" required title="Enter valid email(eg: exmple@gmail.com, example.,@hotmail.com)"/></td>
        </tr>
        <tr>
            <td>Phone NO</td>
            <td><input type="text" name="txtusphno" value="<%=rs.getString("phnno")%>" pattern="[0-9]{10,12}" required title="Enter valid Phone (eg: 8974586321, 7896485361, 912486321475)"/></td>
        </tr>
        
        <tr>
            <td><input type="submit" value="Update" /></td>
            <td><a href="action/del.jsp">Delete</a></td>
        </tr>
    </tbody>
</table>
</form>




<%@include file="design/footer.jsp" %>

