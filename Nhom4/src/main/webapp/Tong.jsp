<%@page import="tam.test"%>
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
if(session.getAttribute("ss")==null) //Chua tao session ss
    session.setAttribute("ss", (int)0);
  String tamn= request.getParameter("txtn");
if(tamn!=null){
    int s=(int)session.getAttribute("ss");
    s=s+ Integer.parseInt(tamn);
    session.setAttribute("ss", s);
}
  //Kiem tra truong họp chay dau tien
  //Tinh tong
%>
<form action="Tong.jsp" method="post">
  Nhập n:
 <input type="number"  name="txtn">
 <input type="submit" name="but1" value="Tong"  >
</form>
Tong: <%=session.getAttribute("ss")%>
<a href="vd1.jsp"> test</a>
</body>
</html>