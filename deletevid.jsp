<%-- 
    Document   : deletevid
    Created on : 28 Mar, 2016, 7:29:50 AM
    Author     : Bibi
--%>

<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
<h2 align="center">R E M O V E &nbsp;&nbsp;V I D E O S</h2>
  <table border="1"style="color: #FFF">
                            <thead>
                                <tr>
                                    <th style=" color:  #FFF">Name</th>
                                    <th style=" color:  #FFF">User Id</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
            String select1="select * from tbl_content where video!='null' ";
            ResultSet rs=con.getData(select1);
            while(rs.next())
            {
            %>
                                   <tr>
                                    <td><%=rs.getString("video")%></td>
                                   <td><%=rs.getString("user_id")%></td>
                                    <td><a href="viddel.jsp?phoneno=<%=rs.getString("cnt_id")%>" style="color: blue">Delete</a></td>
                                </tr>
                             <%
            }
                             %>   
                        
                          </tbody>
                        </table>
                             <%@include file="design/footer.jsp" %>