<%-- 
    Document   : upload
    Created on : 23 Jan, 2016, 7:24:56 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="../user/design/header.jsp" %>
<script type="text/javascript">
    function fns()
    {
        alert("Succesfully uploaded");
    }
</script>
<form action="action/upload_action.jsp" method="POST"  onsubmit="fns();" enctype="multipart/form-data">

    <input type="hidden" name="date" value="1" readonly="readonly" />
    <table border="1" style="color: #FFF">
   
    <tbody>
        <tr>
            <td>Select Category</td>
            <td><select name="catogory">
                    
                    <option>Select</option>
                    
                     <% 
                         
                         String q="select distinct(name) from tbl_cato ";  
   ResultSet rsitem = con.getData(q);
                        while (rsitem.next()) {
                    %>
                    
                    
                    <option><%=rsitem.getString("name")%></option>
                    <%
                        }
                    %>
                    <option></option>
                </select></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="txtname" value="" /></td>
        </tr>
        <tr>
            <td>Choose video</td>
            <td><input type="file" name="videos" value="" /></td>
        </tr>
        <tr>
            <td>Choose Photo</td>
            <td><input type="file" name="photos" value="" /></td>
        </tr>
        <tr>
            <td>Choose Article</td>
            <td><input type="file" name="pdf" value="" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Upload" /></td>
            <td><input type="reset" value="Cancel" /></td>
        </tr>
    </tbody>
</table>
</form>

<%@include file="../user/design/footer.jsp" %>