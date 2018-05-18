<%-- 
    Document   : viewvideo
    Created on : 31 Jan, 2016, 12:39:25 PM
    Author     : Bibi
--%>
<%@page import="java.text.DecimalFormat"%>
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
        var url="video_ajax.jsp?sid=" + document.searchForm.catogory.value;
         
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
            <%
                String sel="select * from tbl_cato"; 
                ResultSet rs=con.getData(sel);
                while(rs.next())
                {
                %>
            
                <option><%=rs.getString("name")%></option>
                    <%
                    
                }
                %>
                </select></td>
        </tr>
    </tbody>
</table>
</form>
                 <h2 align="center" style="color:  #FFF">V I D E O S</h2>
<div id="tablediv">

<table border="0" cellspacing="2" cellpadding="1">
   
    <tbody>
        <%
            int i=0,k=0,j=0;
            String sel1="select count(*) as b from tbl_content";
            ResultSet res1=con.getData(sel1);
            while(res1.next())
            {
            k=(res1.getInt("b"));
            }
           %>     

        <%
            String select1="select * from tbl_content where video like '%.%'  order by cnt_id desc ";
            ResultSet rs2=con.getData(select1);
            while(j<k)
            {
            %>
           
            <tr>
                <%
      for(i=0;i<2;i++)
            {
              if(rs2.next())
                {   
          %>
      
    <td>   <figure><video width="490" height="390" controls>
            <source src="../video/<%=rs2.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
            </video><figcaption><%=rs2.getString("video")%></figcaption><table border="1">
   
    
</table>
</figure></td>
       
    
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
