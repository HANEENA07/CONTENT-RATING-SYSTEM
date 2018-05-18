<%-- 
    Document   : payment
    Created on : 31 Jan, 2016, 11:23:48 AM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>


<%@include file="design/header.jsp" %>
<script type="text/javascript">
    var request;
    function getRequest()
    {
        if (window.XMLHttpRequest)
            return new XMLHttpRequest();
        else if (winodw.ActiveXObject)
            return new ActiveXObject("Microsoft.XMLHTTP");
        else
            return null;
    }
    function doProcessing()
    {
        request = getRequest();
        var url="pay_ajax.jsp?sid=" + document.searchForm.userdrop.value;
         
            request.open("GET", url, true);
           
            request.onreadystatechange = function()
            {
                if (request.readyState == 4 || request.status == 200)
                {
                    document.getElementById("tablediv").innerHTML = request.responseText;
                }
            }
            request.send(null);
    }
</script>
<form name="searchForm">
    
    
    
    
    
               <table border="1" style="color: #FFF">
                 <thead><h1>Payment</h1></thead>

    <tbody>
        
        <tr>
            <td>User Id</td>
            <td><select onchange="doProcessing()" name="userdrop" >
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
           <div id="tablediv">
        <tr>
            <td>Name</td>
            <td><input type="text" name="username" value="" /></td>
            
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

</form>


<%@include file="design/footer.jsp" %>