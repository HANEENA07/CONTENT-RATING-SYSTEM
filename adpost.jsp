+<%-- 
    Document   : adpost
    Created on : 6 Feb, 2016, 11:14:17 AM
    Author     : Bibi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>



<%
  String u=request.getParameter("ui");  
String dell = "update tbl_booking set status=-1 where id='"+u+"' " ;

con.executeCommand(dell);

%>
<script type="text/javascript">
    var request;
    function getRequest()
    {
        if (window.XMLHttpRequest)
            return new XMLHttpRequest();
        else if (winodw.ActiveXObject)
            return new ActiveXObject("Microsoft.XMLHTTP");
        else
            return null;
    }
    function doProcessing()
    {
        request = getRequest();
        var url="userid_ajax.jsp?sid=" + document.searchForm.T1.value;
         
            request.open("GET", url, true);
           
            request.onreadystatechange = function()
            {
                if (request.readyState == 4 || request.status == 200)
                {
                    document.getElementById("tablediv").innerHTML = request.responseText;
                }
            }
            request.send(null);
    }
</script>

    <form  name="searchForm" action="action/adpost_action.jsp" method="POST" enctype="multipart/form-data">

        <table border="0" style="color: #fff">
                
                
<tr>
    <td><b><font color="">ID</b></td>
                    <td><input type="text" name="T1" value="<%=u%>" /></td>
                    <td></td>
                </tr>
        </table>
           
                    <div id="tablediv">
                        <table style="color: #fff">
                <tr>
                    <td>NAME</td>
                    <td><input type="text" name="T2" value="<%=request.getParameter("nm")%>" /></td>
                    <td></td>
                    
                </tr>
                <tr>
                    <td>Choose File</td>
                    <td><input type="file" name="photos" value="" /></td>
                </tr>
                     
                      
                    <td> <input type="submit" value="Post" /> </td>
                    <td><input type="reset" value="Cancel" /> </td></tr>
                   </table> 
                
        
            </tbody>      
        </table> 
    </form>      
                    </form>
                                              


<%@include file="design/footer.jsp" %>