<%-- 
    Document   : viewpass
    Created on : 6 May, 2016, 1:15:10 AM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>

<table>
<%
String userName=request.getParameter("user");
String password=request.getParameter("acc");

String QUERY1="SELECT * FROM tbl_user WHERE emailid='"+userName+"'AND accno='"+password+"' and del=0;";
ResultSet rslogin1=con.getData(QUERY1);
if(rslogin1.next())
{
    %>
    
    <tr>
        <td><%=rslogin1.getString("username")%></td>
         <td><%=rslogin1.getString("phnno")%></td>  
    </tr>
    
    
    
    
<%}
String QUERY2="SELECT * FROM tbl_channelreg WHERE email='"+userName+"'AND chregno='"+password+"';";
ResultSet rslogin2=con.getData(QUERY2);

    if(rslogin2.next())
{
    response.sendRedirect("../../channel/chhmp.jsp");
}
String QUERY3="SELECT * FROM tbl_adagency WHERE email='"+userName+"'AND accno='"+password+"';";
ResultSet rslogin3=con.getData(QUERY3);
if(rslogin3.next())
{%>
    
    <tr>
        <td><%=rslogin3.getString("name")%></td>
         <td><%=rslogin3.getString("password")%></td>  
    </tr>
    
    
    
    
<%
}
else
{
 %>
    
    <tr>
        <td>wrong account number</td>
        <td><a href="forgot.jsp">back</a></td>  
    </tr>
    
    
    
    
<%
}

%>
</table>



<%@include file="design/footer.jsp" %>