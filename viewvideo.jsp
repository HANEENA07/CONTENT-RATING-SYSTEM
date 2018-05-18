<%-- 
    Document   : viewvideo
    Created on : 31 Jan, 2016, 12:39:25 PM
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
<div id="tablediv">
<form name="searchForm">

    <table border="1" style="color: #fff">
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

<table border="0" cellspacing="2" cellpadding="1">
   
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
            String select="select * from tbl_content where video!='null' ";
            ResultSet rs=con.getData(select);
            while(j<k)
            {
            %>
           
            <tr>
                <%
      for(i=0;i<2;i++)
            {
              if(rs.next())
                {   
          %>
      
    <td>   <figure><video width="490" height="390" controls>
            <source src="../video/<%=rs.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
            </video><figcaption><%=rs.getString("video")%></figcaption><table border="1" style="color: #fff">
   
    <tbody>
        <tr>
            <td>Comment</td>
            <td><textarea name="txtcomment" rows="4" cols="20"></textarea></td>
        </tr>
        <tr>
            <td>Rating</td>
            <td><input type="text" name="txtrate" value="" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Post" /></td>
            <td></td>
        </tr>
    </tbody>
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


</div>

<%@include file="design/footer.jsp" %>
