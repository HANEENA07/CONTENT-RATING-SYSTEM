<%-- 
    Document   : approvead
    Created on : 23 Apr, 2016, 11:24:03 AM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include  file="design/header.jsp" %>

<h2 align="center">A d v e r t i s e m e n t&nbsp;&nbsp; R e q u e s t s
                        </h2>





<table border="1" style="color: #ffffff">
                        <thead>
                       
                            <tr>
                                <th style="color: #ffffff">Advertisement Agency id </th>
                                <th style="color: #ffffff">Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <%
                        String id=session.getAttribute("id").toString();
                        
                                String sel="select * from tbl_booking where userid='"+id+"'";
                        ResultSet rs = con.getData(sel);
                        while (rs.next()) 
                        {int st=rs.getInt("status");
                           String im=rs.getString("adagid");
                            String q1="select * from tbl_adagency where adagid='"+im+"' ";  
                        ResultSet rsi = con.getData(q1);
                        while (rsi.next()) {
                           
                                                            %>
                                <td><%=rsi.getString("adagid")%></td>
                                <td><%=rsi.getString("name")%></td>
                                <td><%=rs.getString("content")%></td>
                                <%
                                if(st==0){
                                %>
                                <td><a href="action/adap.jsp?id=<%=rs.getString("id")%>">Approve</a></td>
                                 <%
                                }else{
                                %>
                                <td><a href="action/adap1.jsp?id=<%=rs.getString("id")%>">Reject</a></td>
                                <%}
                                    %>
                                   </tr>
                            <%
                        }
                        }  
                            %>
                         
                            
                        </tbody>
                    </table>










<%@include file="design/footer.jsp" %>