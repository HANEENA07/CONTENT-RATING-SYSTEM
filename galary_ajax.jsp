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
            String select="select * from tbl_content where picture like '%.%'";
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
            String select="select * from tbl_content where cato='"+auth+"' and  picture like '%.%'";
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
            }
        %>
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>