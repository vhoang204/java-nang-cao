<%=session.getAttribute("ss") %>
<table class="table table-bordered table-hover">
<%for(int i=1;i<=9;i++){
    out.print("<tr>");
     for(int j=1;j<=9;j++){ 
         out.print("<td>"+ j +"x"+i +"="+ (i*j)+ "</td>");   
     }
     out.print("</tr>");
     }%>
</table>   
