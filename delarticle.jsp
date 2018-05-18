<%-- 
    Document   : delarticle
    Created on : Apr 30, 2016, 4:46:34 PM
    Author     : user
--%>

<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<h2 align="center">R E M O V E &nbsp;&nbsp;A R T I C L E S</h2>
  <table border="1"style="color: #FFF">
                            <thead>
                                <tr>
                                    <th style=" color:  #FFF">Name</th>
                                    <th style=" color:  #FFF">User Id</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
            String select1="select * from tbl_content where pdfs like '%.%' ";
            ResultSet rs=con.getData(select1);
            while(rs.next())
            {
            %>
                                   <tr>
                                    <td><%=rs.getString("pdfs")%></td>
                                   <td><%=rs.getString("user_id")%></td>
                                   <td><a href="delarticle_action.jsp?phoneno=<%=rs.getString("cnt_id")%>" style="color: blue">Delete</a></td>
                                </tr>
                             <%
            }
                             %>   
                        
                          </tbody>
                        </table>
                             <%@include file="design/footer.jsp" %>