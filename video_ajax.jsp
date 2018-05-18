<%-- 
    Document   : galary_ajax
    Created on : 5 Feb, 2016, 9:44:16 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>


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
            ResultSet res1=con.getData(sel);
            while(res1.next())
            {
            k=(res1.getInt("b"));
            }
           %>     

        <%
            String select1="select * from tbl_content where video like '%.%' ";
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
            
        
       
        }
        }
        
        else{
        
            int i=0,k=0,j=0;
            String sel="select count(*) as b from tbl_content where cato='"+auth+"'and video!='null' ";
            ResultSet res1=con.getData(sel);
            while(res1.next())
            {
            k=(res1.getInt("b"));
            }
           %>     

        <%
            String select1="select * from tbl_content where cato='"+auth+"'and video!='null'";
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
            }
        %>
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>