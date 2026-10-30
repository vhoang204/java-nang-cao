<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Chon  so thich <hr>
   <form action="hienthi.jsp">
      <%for(int i=1;i<=10;i++){ %>
          <input type="checkbox" name="ck" value="<%=i%>"> So thich <%=i %> <hr>
        <%} %>  
        <input type="submit" name="but" value="Test">
   </form>
</body>
</html>