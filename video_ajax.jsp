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
    
    <form action="action/comment_action.jsp" >
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
            String select="select * from tbl_content where  video like '%.%'";
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
   
    <input type="hidden" value="<%=rs.getString("video")%>" name="vid"/>
     <input type="hidden" value="<%=rs.getString("cnt_id")%>" name="cntid"/>
    
     
     
    <td>   <figure><video width="490" height="390" controls>
            <source src="../video/<%=rs.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
            </video><figcaption><%=rs.getString("video")%></figcaption><table border="1">
               
                
    
</table>
            
</figure></td>
       
    
        <%
            }
            }
   j=j+1;
        %>
       
</tr><%
            }

       
        }
        
        else{
        
            int i=0,k=0,j=0;
            String sel="select count(*) as b from tbl_content where cato='"+auth+"'";
            ResultSet res=con.getData(sel);
            while(res.next())
            {
            k=(res.getInt("b"));
            }
           %>     

        <%
            String select="select * from tbl_content where cato='"+auth+"'  and video like '%.%';";
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
   
    <input type="hidden" value="<%=rs.getString("video")%>" name="vid"/>
     <input type="hidden" value="<%=rs.getString("cnt_id")%>" name="cntid"/>
    
     
     
     <td> <a href="pllay.jsp?id=<%=rs.getString("video")%>">  <figure><video width="490" height="390" controls>
            <source src="../video/<%=rs.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
            </video><figcaption><%=rs.getString("video")%></figcaption><table border="1"></a>
               
                
   
</table>
            </form>
</figure></td>
       
    
        <%
            }
            }
   j=j+1;
        %>
       
</tr><%
            }
        }
  %>
       
                
             

</tbody>
    
</table>
  </form>