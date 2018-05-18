<%-- 
    Document   : rating_ajax
    Created on : Apr 30, 2016, 5:03:05 PM
    Author     : user
--%>
<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>
<%@page import="java.text.DecimalFormat"%>

<%
     String auth=request.getParameter("sid");
     String condition="";
        if(!auth.equalsIgnoreCase("select")){
         condition=" AND date='"+auth+"' ";
     }
      
    %>

  <table border="1"style="color: #FFFFFF">
                            <thead>
                                <tr>
                                    <th style=" color:  #FFFFFF">Name</th>
                                    <th style="color:  #FFFFFF">User</th>
                                    <th style="color:  #FFFFFF">Rating</th>
                                </tr>
                            </thead>
                            <tbody>
        
        
        <%
        
        if(auth.equalsIgnoreCase("ALL"))
        {
           
    String select ="select distinct(name) from tbl_comment ";
    String usr="";
    String uname="";
    int rate=0,count=0,rate1=0;
    float rat=0;
    double rat1=0.0,y=0.05;
            ResultSet res=con.getData(select);
            while(res.next())
                    { 
                        String vid=res.getString("name");
                        
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
                        %>
                      
                                <tr>
                                    <td><%=res.getString("name")%></td>
                                   <td><%=uname%></td>
                                    <td><%=rat1%></td>
                                    <td><a href="pllay.jsp?id=<%=res.getString("name")%>">view</a></td>
                                </tr>
                                    <%
                    }
           
        }
        
        else {
        
            String select ="select distinct(name) from tbl_comment where type='"+auth+"' ";
    String usr="";
    String uname="";
    int rate=0,count=0,rate1=0;
    float rat=0;
    double rat1=0.0,y=0.05;
            ResultSet res=con.getData(select);
            while(res.next())
                    { 
                        String vid=res.getString("name");
                        
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
                        %>
                      
                                <tr>
                                    <td><%=res.getString("name")%></td>
                                   <td><%=uname%></td>
                                    <td><%=rat1%></td>
                                    <%
                                   if(auth.equalsIgnoreCase("Video"))
        {
                                    %>
                                    <td><a href="pllay.jsp?id=<%=res.getString("name")%>">view</a></td>
                                         <%    
        }
                                   if(auth.equalsIgnoreCase("Image")){                           %>

                                   <td><a href="galaryview.jsp?id=<%=res.getString("name")%>">view</a></td>
                                     <%    }                           %>
<%    
       
                                   if(auth.equalsIgnoreCase("Article")){                           %>

                                   <td><a href="pdfcmm.jsp?id=<%=res.getString("name")%>">view</a></td>
                                     <%    }else{                           %>

                                   
                                   
                                   <%}%>
                                </tr>
                                    <%
                    }
            }
  %>
                
             

</tbody>
    
</table>