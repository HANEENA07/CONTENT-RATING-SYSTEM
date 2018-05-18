<%-- 
    Document   : complaintiew
    Created on : 1 Feb, 2016, 12:46:47 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<h2 align="center">C O M P L A I N T S &nbsp;&nbsp;</h2>
  <table border="1"style="color: #FFF">
                            <thead>
                                <tr>
                                    <th style=" color:  #ffffff">Name</th>
                                    <th style=" color:   #FFF">complaint</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
            String select1="select * from tbl_complaint order by idno desc";
            ResultSet rs=con.getData(select1);
            while(rs.next())
            {
            %>
                                   <tr>
                                    <td><%=rs.getString("name")%></td>
                                   <td><%=rs.getString("complaint")%></td>
                                   <td ><a href="compdel.jsp?phoneno=<%=rs.getString("idno")%>" style="color: blue">Delete</a></td>
                                </tr>
                             <%
            }
                             %>   
                        
                          </tbody>
                        </table>
                             <%@include file="design/footer.jsp" %>