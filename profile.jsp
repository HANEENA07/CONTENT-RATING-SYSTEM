<%-- 
    Document   : adreg
    Created on : 17 Jan, 2016, 1:08:57 PM
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
String s="select * from tbl_adagency where adagid='"+id+"'";
ResultSet rs = con.getData(s);
rs.next();  

%>
<h2  style=" color:  #FFF"> E n t e r &nbsp;&nbsp;t h e&nbsp;&nbsp; D e t a i l s
</h2>


<form action="action/prupdate.jsp" onsubmit="fns();" method="POST">

    <table border="0" style="color: #FFF">
   
    <tbody>
        <tr>
            <td>Agency Registered ID</td>
            <td><input type="text" name="txtadreid" value="<%=rs.getString("regid")%>" required="1" /></td>
        </tr>
        <tr>
            <td>Company Name</td>
            <td><input type="text" name="txtadname" value="<%=rs.getString("name")%>" required="1" /></td>
        </tr>
        <tr>
            <td>Agency Head</td>
            <td><input type="text" name="txtadhead" value="<%=rs.getString("ownername")%>" pattern="[a-zA-Z .]{0,500}" required title="Enter valid name (Only characters, space,)" /></td>
        </tr>
        <tr>
            <td>Account NO</td>
            <td><input type="text" name="txtadaccno" value="<%=rs.getString("accno")%>" pattern="[0-9]{11}" required title="Enter valid account number(11 digit)" /></td>
        </tr>
        <tr>
            <td>Bank Name</td>
            <td><input type="text" name="txtadbnkname" value="<%=rs.getString("bankname")%>" required="" /></td>
        </tr>
        <tr>
            <td>Email ID</td>
            <td><input type="text" name="txtadmail" value="<%=rs.getString("email")%>" required title="Enter valid Mail id (eg: x@gmail.com, y@yahoo.com)" pattern="[a-zA-Z0-9., ]{1,200}[@]{1}[gmailhotulkyredf]{5,7}[.]{1}[cominrg]{2,3}" /></td>
        </tr>
        <tr>
            <td>Phone NO</td>
            <td><input type="text" name="txtadphno" value="<%=rs.getString("phno")%>" pattern="[0-9]{10,12}" required title="Enter valid Phone (eg: 8974586321, 7896485361, 912486321475)" /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="txtpass" value="<%=rs.getString("password")%>" pattern="[a-zA-Z.,/@!#$%^&*()_+=:;0-9]{4,100}" required title="Atleast 4 characters" /></td>
        </tr>
        
        <tr>
            <td>Address</td>
            <td><textarea name="txtaddress" rows="4" cols="20" required=""><%=rs.getString("address")%></textarea> </td>
        </tr>
        <tr>
            <td><input type="submit" value="Update" /></td>
             
        </tr>
    </tbody>
</table>

</form>

<%@include file="design/footer.jsp" %>
