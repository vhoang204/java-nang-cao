<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% //Lay gia tri cua bien request
   out.print(request.getAttribute("s")+"<hr>");
   //Lay gia tri bien session un
   out.print(session.getAttribute("un")+"<hr>");
   %>
</body>
</html>