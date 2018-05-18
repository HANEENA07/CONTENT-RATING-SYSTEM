<%-- 
    Document   : viewvideo
    Created on : 31 Jan, 2016, 12:39:25 PM
    Author     : Bibi
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@include file="design/header.jsp" %>
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
        var url="video_ajax.jsp?sid=" + document.searchForm.catogory.value;
         
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
<form name="searchForm">

    <table border="1" style="color: #FFF">
      <tbody>
        <tr>
            <td>Select Category</td>
            <td><select name="catogory" onchange="doProcessing()">
                    
                    <option>ALL</option>
                    
                     <% 
                         
                         String q="select distinct(name) from tbl_cato ";  
   ResultSet rsitem = con.getData(q);
                        while (rsitem.next()) {
                    %>
                    
                    
                    <option><%=rsitem.getString("name")%></option>
                    <%
                        }
                    %>
                    <option></option>
                </select></td>
        </tr>
    </tbody>
</table>
</form>
       <h2 align="center" style="color:  #FFF">V I D E O S</h2>              
<div id="tablediv">

<table border="0" cellspacing="2" cellpadding="1">
   
    <tbody>
        <%
            int i=0,k=0,j=0;
            String sel="select count(*) as b from tbl_content";
            ResultSet res=con.getData(sel);
            while(res.next())
            {
            k=(res.getInt("b"));
            }
           %>     

        <%
            
            
            
            
            
            
            
            String select ="select distinct(name) from tbl_comment  ";
    String usr="";
    String uname="";
    int rate=0,count=0,rate1=0;
    float rat=0;
    double rat1=0.0,y=0.05,a=5.0;
            ResultSet res1=con.getData(select);
            while(res1.next())
                    { 
                        String vid=res1.getString("name");
                        
                        String se="select * from tbl_comment where name='"+vid+"'";
                        ResultSet rs=con.getData(se);
                        count=0;
                        rat=0;
                        rate=0;
                        while(rs.next())
                                {usr=rs.getString("userid");
                                    count=count+1;
                      rate=rate+rs.getInt("rating");}
                         
                        rate1=0;
                        String se1="select dtime from tbl_download where videoname='"+vid+"'";
                        ResultSet rs1=con.getData(se1);
                        while(rs1.next())
                        {
                      rate1=rate1+rs1.getInt("dtime");
                        }
                    
                    
                    
                        
                      rat1=(float)rate/count;
                      if(rate1>10)
                      {
                          rat1=rat1+0.5;
                      }
                      DecimalFormat df=new DecimalFormat("#.#");
                      df.format(rat1);
                 //     rat1=Math.round(rat);
                      rat1=Math.round(rat1*100)/100d;
                      
                      String reg="select username from tbl_user where id='"+usr+"'";
                      ResultSet rr=con.getData(reg);
                      while(rr.next())
                      {
                          uname=rr.getString("username");
                      }
                      
                       String insert="update  tbl_content set vidrate='"+rat1+"' where video='"+vid+"'";
                     
                      con.executeCommand(insert);
                    }
            
            String select1="select * from tbl_content where video like '%.%' order by cnt_id desc    ";
            ResultSet rs11=con.getData(select1);
            while(j<k)
            {
            %>
           
            <tr>
                <%
      for(i=0;i<2;i++)
            {
              if(rs11.next())
                {   
          %>
      
    <td>   <figure><video width="490" height="390" controls>
            <source src="../video/<%=rs11.getString("video")%>" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
            </video><figcaption style=" color:  #FFF"><%=rs11.getString("video")%></figcaption><table border="1">  
   
</table>
</figure></td>
       
    
        <%
            }
            
   j=j+1;
            }
           
        %>
       
</tr><%
            }
  %>
                
             

</tbody>
    
</table>




<%@include file="design/footer.jsp" %>
