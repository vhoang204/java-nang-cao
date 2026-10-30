<%@page import="java.util.Calendar"%>
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
   Calendar c= Calendar.getInstance();//Lay ngay gio cua he thong
   int ngay=c.get(Calendar.DAY_OF_MONTH);
   int thang=c.get(Calendar.MONTH)+1;
   int nam=c.get(Calendar.YEAR);
%>
   <div align="right">Hom nay, ngay <%=ngay %> thang <%=thang %> nam <%=nam %>  </div>
<form action="">
  Chon ngay:
  <select name="sngay"> <option value="1"> 1 </option> 
  <option value="1" selected="selected"> 2 </option> 
  </select>
  thang <select name="sngay"> <option value="1"> 1 </option> </select>
  nam <select name="sngay"> <option value="1">  1 </option> </select>
  <input type="submit" value="Xem ket qua">
  </form>
  Ket qua so xo ngay ... thang ... nam
</body>
</html>