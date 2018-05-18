<%-- 
    Document   : viewphotos
    Created on : 31 Jan, 2016, 11:51:37 AM
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

    <table border="1" style="color: #FFF">
      <tbody>
        <tr>
            <td>Select Catogory</td>
            <td><select  onchange="doProcessing()" name="catogory">
                    <option>ALL</option>
                    <option>Sports</option>
                    <option>Arts</option>
                    <option>Films</option>
                    <option>Educational</option>
                    <option>TV Shows</option>
                    <option>Nature</option>
                    <option></option>
                    <option></option>
                    <option></option>
                    <option></option>
                </select></td>
        </tr>
    </tbody>
</table>
</form>
<div id="tablediv">

<table border="0" cellspacing="20" cellpadding="10">

 
  
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
            String select="select * from tbl_content";
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
      
          <td><figure><a href="../image/<%=rs.getString("picture")%>"/><img src="../image/<%=rs.getString("picture")%>" height="200" width="200" alt="loding....."/></a><figcaption><%=rs.getString("picture")%></figcaption></figcaption></figure></td>
       
    
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
