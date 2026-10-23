<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="p-3 m-0 border-0 bd-example m-0 border-0">
    <!-- Example Code Start-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="tc.jsp">Trang chủ</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Giỏ hàng</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Thanh toán</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Lịch sử mua hàng</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="dangnhap.jsp">Đăng nhập</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Đăng xuất</a>
            </li>
        
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit" fdprocessedid="78u7pw">Search</button>
          </form>
        </div>
      </div>
    </nav>
  <%
  
  %>
     <form action="dangnhapController" method="post">
         Tên đăng nhập: <br>
         <input type="text"  name="txtun"> <br>
         Mật khẩu: <br>
         <input type="password"  name="txtpass"> <br>
 		<input type="submit" name="but1" value="Đăng nhập"  >
     </form>
   <%if(request.getParameter("tb")!=null)
	   out.print("Dang nhap sai");
	   %>
  
  </body>
</html>