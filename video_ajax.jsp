<%-- 
    Document   : galary_ajax
    Created on : 5 Feb, 2016, 9:44:16 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>


<%
     String auth=request.getParameter("sid");
     String condition="";
        if(!auth.equalsIgnoreCase("select")){
         condition=" AND date='"+auth+"' ";
     }
      
    %>
<table border="0" cellspacing="20" cellpadding="10">

 
  
    <tbody>
        
        
        <%
        
        if(auth.equalsIgnoreCase("ALL"))
        {
             int i=0,k=0,j=0;
            String sel="select count(*) as b from tbl_content ";
            ResultSet res=con.getData(sel);
            while(res.next())
            {
            k=(res.getInt("b"));
            }
           %>     

        <%
            String select="select * from tbl_content where video like '%.%' ";
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
            </video><figcaption><%=rs.getString("video")%></figcaption><table border="1">
   
    <tbody>
        <tr>
            <td>Comment</td>
            <td><textarea name="txtcomment" rows="4" cols="20">
                </textarea></td>
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
            
        
       
        }
        }
        
        else{
        
            int i=0,k=0,j=0;
            String sel="select count(*) as b from tbl_content where cato='"+auth+"'and video!='null' ";
            ResultSet res=con.getData(sel);
            while(res.next())
            {
            k=(res.getInt("b"));
            }
           %>     

        <%
            String select="select * from tbl_content where cato='"+auth+"'and video!='null'";
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
            </video><figcaption><%=rs.getString("video")%></figcaption><table border="1">
   
    <tbody>
        <tr>
            <td>Comment</td>
            <td><textarea name="txtcomment" rows="4" cols="20">
                </textarea></td>
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
            }
        %>
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>