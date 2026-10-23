<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    String tama= request.getParameter("txta");
    String tamb= request.getParameter("txtb");
    if(tama!=null&&tamb!=null){
         double a= Double.parseDouble(tama);
         double b= Double.parseDouble(tamb);
         double kq=0.0;
    if(request.getParameter("butcong")!=null)
       kq=a+b;
    if(request.getParameter("buttru")!=null)
        kq=a-b;
    if(request.getParameter("butnhan")!=null)
        kq=a*b;
    if(request.getParameter("butchia")!=null)
        kq=a/b;
     out.print(kq);
     response.sendRedirect("maytinh.jsp?kq="+kq+"&a=" +a +"&b="+b);
    }
 
 %>
</body>
</html>