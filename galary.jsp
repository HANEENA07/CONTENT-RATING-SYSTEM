    <%-- 
    Document   : galary
    Created on : 23 Jan, 2016, 7:35:28 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        var url="galary_ajax.jsp?sid=" + document.searchForm.catogory.value;
         
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
            <td>Select Category</td>
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
                    <h2 align="center" style="color:  #FFF">G A L L E R Y</h2>
<div id="tablediv">

    <table border="0" cellspacing="20" cellpadding="10" style="color: #FFF">

 
  
    <tbody>
        <%
            int i=0,k=0,j=0;
            String sel="select count(*) as b from tbl_content";
            ResultSet res=con.getData(sel);
            while(res.next())
            {
            k=(res.getInt("b"));
            }
           %>     

        <%
            String select="select * from tbl_content where picture like '%.%' order by cnt_id desc";
            ResultSet rs=con.getData(select);
            while(j<k)
            {
            %>
           
                <tr>
                <%
      for(i=0;i<4;i++)
            {
              if(rs.next())
                {   
          %>
      
          <td> <a href="galaryview.jsp?id=<%=rs.getString("picture")%>" ><figure><img src="../image/<%=rs.getString("picture")%>" height="200" width="200" alt="loding....."/></a><figcaption><%=rs.getString("picture")%></figcaption></figcaption></figure></a></td>
       
    
        <%
            }
            }
   j=j+1;
        %>
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>

<%@include file="design/footer.jsp" %>