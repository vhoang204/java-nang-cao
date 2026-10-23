<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 ha ha
 Lay ra tri cua 2 bien request duoc gui tu Controller
<% String[] ds= (String[])request.getAttribute("dsten");
   for(String ht: ds)
	   out.print(ht+"<br>");
   //Lay gia tri cua bien request
   out.print(request.getAttribute("s")+"<hr>");
   //Lay gia tri bien session un
   out.print(session.getAttribute("un")+"<hr>");
%>
<a href="vd6.jsp">
   test pham vi hoat dong cua request va session
</a>
</body>
</html>