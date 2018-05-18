<%-- 
    Document   : galary_ajax
    Created on : 5 Feb, 2016, 9:44:16 PM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
  <%
     String id=request.getParameter("sid");
     String condition="";
     if(!id.equalsIgnoreCase("select")){
         condition=" AND id='"+id+"' ";
     }
  %>  
  <form action="action/addpostrequest.jsp" >
<table border="0" class="gridtable">
  <%  String q="select  username from tbl_user where id='"+id+"' ";  
   ResultSet rsitem = con.getData(q);
                        while (rsitem.next()) {
                          
                    %>
                    <input type="hidden" name="T1" value="<%=id%>"/>
                      <tr>
                    <td>Name</td>
                    <td><input type="text" name="T2"  value="<%=rsitem.getString("username")%>" /></td>
                    <td></td>
                </tr>
</table>
               <%
                        }
                        
                        String selectpost="select * from tbl_content where user_id='"+id+"'";
                        ResultSet rescon=con.getData(selectpost);
                        while(rescon.next()){
                            String video=rescon.getString("video");
                            String pic=rescon.getString("picture");
                            String pdf=rescon.getString("pdfs");
                            
               %>
                        
               <table>
                      
                   <%if(!video.equalsIgnoreCase("x")){
                                %>  <tr>
                                    <td width="10%"><label<figure><video width="490" height="390" controls>
            <source src="../video/<%=rescon.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
                                                </video><figcaption style=" color:  #FFF"><%=rescon.getString("video")%></figcaption></td><td style="vertical-align: middle;" ><input  type = "checkbox" name = "post" value = "<%=rescon.getString("video")%>"  /></td></tr>
                            <%}
                            if(!pic.equalsIgnoreCase("x")){
                            %>
                                                <tr><td><img src="../image/<%=rescon.getString("picture")%>" height="300px" width="300px"/></td><td style="vertical-align: middle;" ><input  type = "checkbox" name = "post" value = "<%=rescon.getString("picture")%>"  /></td> </tr>   
                            <%}
                            if(!pdf.equalsIgnoreCase("x")){
                            %>
                                                <tr> <td><a href="../pdf/<%=rescon.getString("pdfs")%>" target="_blank">PDF</a></td><td style="vertical-align: middle;" ><input  type = "checkbox" name = "post" value = "<%=rescon.getString("pdfs")%>"  /></td></tr>
                            
                            <%}%>
                        
                        <%
                        }
                        %>
                    <td> <input type="submit" value="Post" /> </td>
                    <td><input type="reset" value="Cancel" /> </td>
                   </table> 
                </tr>
            
            </tbody>   
        </table>
    </form>      
                 
               
            </tbody>        
        </table>
