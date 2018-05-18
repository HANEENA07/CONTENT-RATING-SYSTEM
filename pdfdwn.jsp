<%-- 
    Document   : pdfdwn
    Created on : 6 Apr, 2016, 9:31:11 AM
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
        var url="pdf_ajax.jsp?sid=" + document.searchForm.catogory.value;
         
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

    <table border="1" style="color: #fff">
      <tbody>
        <tr>
            <td>Select Catogory</td>
            <td><select name="catogory" onchange="doProcessing()">
                    
                    <option>ALL</option>
                    
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
    </tbody>
</table>
</form>
<div id="tablediv">

    <h2 align="center" style=" color:  #FFF">A R T I C L E S </h2>
<table  style="color: #FFF">
   
    <tbody>
        <%
            
           
            String select="select pdfs from tbl_content where pdfs like '%.%' order by cnt_id desc ";
            ResultSet rs=con.getData(select);
            while(rs.next())
            {
            %>
           
            <tr>
            
                <td><%=rs.getString("pdfs")%>
                    
                </td>
    
    <td>  <a href="../pdf//<%=rs.getString("pdfs")%>" download="../pdf/<%=rs.getString("pdfs")%>"><figure><img src="../Download1.ico" height="20" width="20"/></figure></a>
     
                </td>
                
       
    
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>
     
<%@include file="design/footer.jsp" %>