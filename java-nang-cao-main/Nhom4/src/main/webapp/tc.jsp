<%@page import="sach.sach"%>
<%@page import="loai.loai"%>
<%@page import="giohang.giohang"%>
<%@page import="giohang.giohangbo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cửa hàng sách - Nhóm 4</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background:#f7f8fa; color:#252a31; }
    .navbar { box-shadow:0 2px 12px rgba(0,0,0,.06); }
    .page-wrap { max-width:1200px; margin:28px auto; }
    .panel { background:#fff; border:1px solid #e8ebef; border-radius:12px; padding:22px; box-shadow:0 4px 18px rgba(25,35,45,.04); }
    .category a { border:0; border-bottom:1px solid #edf0f3; }
    .category a:last-child { border-bottom:0; }
    .book-card { border:1px solid #e9ecef; border-radius:12px; transition:.15s; }
    .book-card:hover { box-shadow:0 8px 22px rgba(0,0,0,.08); transform:translateY(-2px); }
    .book-card img { height:190px; object-fit:contain; padding:12px; }
    .table thead th { white-space:nowrap; background:#f4f6f8; }
    .table td { vertical-align:middle; }
    .quantity { max-width:90px; margin:auto; }
    .total { color:#dc3545; font-size:1.15rem; font-weight:700; }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white">
 <div class="container">
  <a class="navbar-brand fw-bold text-primary" href="tcController">NHÓM 4 BOOKSTORE</a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu"><span class="navbar-toggler-icon"></span></button>
  <div class="collapse navbar-collapse" id="menu">
   <ul class="navbar-nav me-auto">
    <li class="nav-item"><a class="nav-link" href="tcController">Trang chủ</a></li>
    <li class="nav-item"><a class="nav-link" href="hienthiController">Giỏ hàng</a></li>
    <li class="nav-item"><a class="nav-link" href="hienthiController">Thanh toán</a></li>
    <li class="nav-item"><a class="nav-link" href="hienthiController">Lịch sử mua hàng</a></li>
    <% String un = (String)session.getAttribute("un");
       if (un != null) { %>
      <li class="nav-item"><span class="nav-link text-success">Xin chào, <%=un%></span></li>
      <li class="nav-item"><a class="nav-link" href="dangxuat.jsp">Đăng xuất</a></li>
    <% } else { %>
      <li class="nav-item"><a class="nav-link" href="dangnhap.jsp">Đăng nhập</a></li>
    <% } %>
   </ul>
   <form class="d-flex" action="tcController" method="get">
    <input class="form-control me-2" type="search" name="txttk" placeholder="Tìm tên sách hoặc tác giả">
    <button class="btn btn-outline-primary" type="submit">Tìm kiếm</button>
   </form>
  </div>
 </div>
</nav>

<div class="container page-wrap">
 <div class="row g-4">
  <aside class="col-lg-3">
   <div class="panel category">
    <h5 class="mb-3">Danh mục sách</h5>
    <a class="list-group-item list-group-item-action" href="tcController">Tất cả sách</a>
    <%
      ArrayList<loai> dsloai=(ArrayList<loai>)request.getAttribute("dsloai");
      if(dsloai!=null) for(loai l:dsloai) {
    %>
      <a class="list-group-item list-group-item-action" href="tcController?ml=<%=l.getMaloai()%>"><%=l.getTenloai()%></a>
    <% } %>
   </div>
  </aside>

  <main class="col-lg-9">
   <div class="panel">
   <%
     String ht=(String)request.getAttribute("ht");
     if ("giohang".equals(ht)) {
       giohangbo gh=(giohangbo)session.getAttribute("gh");
   %>
    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
     <div><h4 class="fw-bold mb-1">Giỏ hàng của bạn</h4><div class="text-muted small">Kiểm tra số lượng và cập nhật sản phẩm trước khi thanh toán.</div></div>
     <a href="tcController" class="btn btn-outline-primary btn-sm">← Tiếp tục mua hàng</a>
    </div>
    <% if(gh!=null && gh.getDs()!=null && !gh.getDs().isEmpty()) { %>
    <form action="hienthiController" method="post">
     <div class="table-responsive">
      <table class="table table-bordered table-hover text-center align-middle">
       <thead><tr>
        <th style="width:48px"><input type="checkbox" id="chonTatCa" title="Chọn tất cả"></th>
        <th class="text-start">Tên hàng</th><th>Đơn giá</th><th style="width:125px">Số lượng</th>
        <th>Thành tiền</th><th>Thao tác</th>
       </tr></thead>
       <tbody>
       <% for(giohang h:gh.getDs()) { %>
        <tr>
         <td><input class="chon-hang" type="checkbox" name="chon" value="<%=h.getMahang()%>"></td>
         <td class="text-start fw-semibold"><%=h.getTenhang()%></td>
         <td><%=String.format("%,d",h.getGia())%> đ</td>
         <td><input class="form-control form-control-sm quantity text-center" type="number" min="1" max="999" name="sl_<%=h.getMahang()%>" value="<%=h.getSoluong()%>"></td>
         <td class="fw-semibold"><%=String.format("%,d",h.getThanhtien())%> đ</td>
         <td class="text-nowrap">
          <button class="btn btn-sm btn-outline-primary" type="submit" name="action" value="capNhatMot" formaction="hienthiController"
            onclick="document.getElementById('mahangSua').value='<%=h.getMahang()%>'">Sửa</button>
          <button class="btn btn-sm btn-outline-danger" type="submit" name="action" value="xoa"
            onclick="document.getElementById('mahangXoa').value='<%=h.getMahang()%>'">Xóa</button>
         </td>
        </tr>
       <% } %>
       </tbody>
      </table>
     </div>
     <input type="hidden" id="mahangSua" name="mahangSua" value="">
     <input type="hidden" id="mahangXoa" name="mahang" value="">
     <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mt-3">
      <div class="d-flex flex-wrap gap-2">
       <button class="btn btn-danger" type="submit" name="action" value="xoaChon" onclick="return confirm('Bạn có chắc muốn xóa các sản phẩm đã chọn?')">Xóa đã chọn</button>
       <button class="btn btn-outline-danger" type="submit" name="action" value="xoaTatCa" onclick="return confirm('Bạn có chắc muốn xóa toàn bộ giỏ hàng?')">Xóa tất cả</button>
       <button class="btn btn-primary" type="submit" name="action" value="capNhat">Cập nhật tất cả</button>
      </div>
      <div class="text-end">
       <div class="text-muted small">Tổng tiền</div>
       <div class="total"><%=String.format("%,d",gh.tong())%> VNĐ</div>
      </div>
     </div>
    </form>
    <% } else { %>
      <div class="text-center py-5">
       <div class="display-5 mb-2">🛒</div><h5>Giỏ hàng đang trống</h5>
       <p class="text-muted">Hãy chọn một vài cuốn sách bạn yêu thích nhé.</p>
       <a href="tcController" class="btn btn-primary">Khám phá sách</a>
      </div>
    <% } %>
   <% } else { %>
    <div class="mb-3"><h4 class="fw-bold">Danh sách sách</h4><p class="text-muted mb-0">Chọn sách bạn muốn mua.</p></div>
    <div class="row g-3">
    <%
      ArrayList<sach> dssach=(ArrayList<sach>)request.getAttribute("dssach");
      if(dssach!=null && !dssach.isEmpty()) for(sach s:dssach) {
    %>
     <div class="col-md-6 col-xl-4">
      <div class="card book-card h-100">
       <img src="<%=s.getAnh()%>" class="card-img-top" alt="<%=s.getTensach()%>">
       <div class="card-body d-flex flex-column">
        <h6 class="card-title"><%=s.getTensach()%></h6>
        <div class="text-muted small mb-2">Tác giả: <%=s.getTacgia()%></div>
        <div class="text-danger fw-bold mb-3"><%=String.format("%,d",s.getGia())%> VNĐ</div>
        <a class="btn btn-warning mt-auto" href="giohangController?ms=<%=s.getMasach()%>&ts=<%=java.net.URLEncoder.encode(s.getTensach(),"UTF-8")%>&gia=<%=s.getGia()%>">🛒 Đặt mua</a>
       </div>
      </div>
     </div>
    <% } else { %>
     <div class="col-12 text-center text-muted py-5">Không tìm thấy sản phẩm phù hợp.</div>
    <% } %>
    </div>
   <% } %>
   </div>
  </main>
 </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.getElementById('chonTatCa')?.addEventListener('change', function () {
 document.querySelectorAll('.chon-hang').forEach(function (cb) { cb.checked = document.getElementById('chonTatCa').checked; });
});
</script>
</body>
</html>
