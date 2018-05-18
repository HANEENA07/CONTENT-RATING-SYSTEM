<%-- 
    Document   : pay
    Created on : 19 Mar, 2016, 12:07:35 PM
    Author     : Bibi
--%>

<%@page import="java.text.DecimalFormat"%>
<%@include file="design/header.jsp" %>


<jsp:useBean class="com.library.dataaccess.DataAccess" id="con"/> 
<%@page  import="java.sql.*" %>

<%
               
            String user=request.getParameter("usrid");
            
            String find="select userid from tbl_booking where id='"+user+"'";
            ResultSet rrr=con.getData(find);
            if(rrr.next())
            {
                user=rrr.getString("userid");
            }
             String vid="";
            String select ="select * from tbl_comment where userid='"+user+"'  ";
    String usr="";
    String uname="";
    int rate=0,count=0,rate1=0,amount=0,toadmin=0,touser=0;
    float rat=0;
    double rat1=0.0,y=0.05,a=5.0;
            ResultSet res1=con.getData(select);
            while(res1.next())
                    { 
                       
                        count=0;
                        rat=0;
                        rate=0;
                        
                                    count=count+1;
                      rate=rate+res1.getInt("rating");
                         
                       
                         vid=res1.getString("name");}
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
                      
                      String reg="select username from tbl_user where id='"+user+"'";
                      ResultSet rr=con.getData(reg);
                      while(rr.next())
                      {
                          uname=rr.getString("username");
                      }

amount=(int)rat1*300;

toadmin=(amount*10)/100;

touser=amount-toadmin;




%>
<form action="action/pay_action.jsp">
<table border="1">
   
    <tbody>
         <tr>
             <td style="color:  #FFFFFF">User</td>
            <td><input type="text" name="name" value="<%=uname%>" /></td>
        </tr>
        <tr>
            <td style="color:  #FFFFFF">Rating</td>
            <td><input type="text" name="rate" value="<%=rat1%>" /></td>
        </tr>
        <tr>
            <td style="color:  #FFFFFF">Amount</td>
            <td><input type="text" name="amnt" value="<%=touser%>" /></td>
        </tr>
    <input type="hidden" name="admin" value="<%=toadmin%>"/>
      <input type="hidden" name="total" value="<%=amount%>"/>
      <input type="hidden" name="id" value="<%=user%>"/>
      
      
      <tr>
          <td><input type="submit" value="PAY" /></td>
          <td></td>
      </tr>
    </tbody>
</table>


</form>




<%@include file="design/footer.jsp" %>