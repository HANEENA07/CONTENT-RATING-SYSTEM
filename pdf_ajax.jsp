<%-- 
    Document   : pdf_ajax
    Created on : 21 Apr, 2016, 11:35:26 PM
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
    
    
    
    
    
     <%
        
        if(auth.equalsIgnoreCase("ALL"))
        {
            
            %>
<table  style="color: #FFF">
   
    <tbody>
        <%
            
           
            String select="select pdfs from tbl_content where pdfs like '%.%' ";
            ResultSet rs=con.getData(select);
            while(rs.next())
            {
            %>
           
            <tr>
            
                <td><%=rs.getString("pdfs")%>
                    
                </td>
    
    <td>  <a href="../pdf//<%=rs.getString("pdfs")%>" download="../pdf/<%=rs.getString("pdfs")%>"><figure><img src="../Download1.ico" height="20" width="20"/></figure></a>
     
                </td>
                <td><a href="pdfcmm.jsp?id=<%=rs.getString("pdfs")%>">comment</a></td>
       
    
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>
  <% }
        
        else
      {
  %>
    <table  style="color: #FFF">
   
    <tbody>
        <%
            
           
            String select="select pdfs from tbl_content where pdfs like '%.%' and  cato='"+auth+"'";
            ResultSet rs=con.getData(select);
            while(rs.next())
            {
            %>
           
            <tr>
            
                <td><%=rs.getString("pdfs")%>
                    
                </td>
    
    <td>  <a href="../pdf//<%=rs.getString("pdfs")%>" download="../pdf/<%=rs.getString("pdfs")%>"><figure><img src="../Download1.ico" height="20" width="20"/></figure></a>
     
                </td>
                <td><a href="pdfcmm.jsp?id=<%=rs.getString("pdfs")%>">comment</a></td>
       
    
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>   
  <%
  
      }
  %>