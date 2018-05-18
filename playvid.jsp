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
<form name="searchForm">

    <table border="1" style="color: #FFF">
      <tbody>
        <tr>
            <td>Select Category</td>
            <td><select name="catogory" onchange="doProcessing()">
                    
                    <option>ALL</option>
                    
                     <% 
                         
                         String q="select distinct(name) from tbl_cato";  
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
                    <h2 align="center" style="color:  #FFF">V I D E O S</h2>
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
            String select="select * from tbl_content where video like '%.%'  order by cnt_id desc ";
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
  
    
     
     
          <td>   <a href="pllay.jsp?id=<%=rs.getString("video")%>" >  <figure><video width="490" height="390" controls>
                <source src="../video/<%=rs.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
            </video><figcaption><%=rs.getString("video")%></figcaption><table border="1"></a>
               
            <form action="action/comment_action.jsp"  >      
                <%-- <input type="hidden" value="<%=rs.getString("video")%>" name="vid"/>
     <input type="hidden" value="<%=rs.getString("cnt_id")%>" name="cntid"/>
                <tr>
            <td>Comment</td>
            <td><textarea name="txtcomment" rows="4" cols="20"></textarea></td>
        </tr>
        <tr>
            <td>Rating</td>
            <td>&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="1" checked="checked" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="2" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="3" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="4" />&nbsp;&nbsp;&nbsp;<input type="radio" name="txtrate" value="5" /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Post" /></td>
            <td></td>
        </tr>--%>
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
      </form>



<%@include file="design/footer.jsp" %>
