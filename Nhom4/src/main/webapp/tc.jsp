<%@page import="sach.sach"%>
<%@page import="loai.loai"%>
<%@page import="giohang.giohang"%>
<%@page import="giohang.giohangbo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* Định dạng khung ô bảng giỏ hàng */
    .table-cart {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    .table-cart, .table-cart th, .table-cart td {
        border: 1px solid #000;
    }
    .table-cart th, .table-cart td {
        padding: 8px;
    }
    .table-cart th {
        background-color: #f8f9fa;
        text-align: center;
    }
</style>
</head>
<body>

    <!-- Menu Navbar Top -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link active" href="tcController">Trang chủ</a></li>
            <!-- Menu Giỏ hàng kết nối hienthiController -->
            <li class="nav-item"><a class="nav-link" href="hienthiController">Giỏ hàng</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Thanh toán</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Lịch sử mua hàng</a></li>
            <%
                String un = (String) session.getAttribute("un");
                if (un != null) {
            %>
                <li class="nav-item"><span class="nav-link">Xin chao: <%=un%></span></li>
                <li class="nav-item"><a class="nav-link" href="dangxuatController">Đăng xuất</a></li>
            <%
                }
            %>
          </ul>
          
          <!-- Ô Tìm kiếm -->
          <form class="d-flex" action="tcController" method="get">
            <input class="form-control me-2" type="search" name="txttk" placeholder="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid px-3">
        <div class="row">
            <!-- Cột bên trái: Danh mục loại sách (Giữ nguyên) -->
            <div class="col-md-3">
                <div class="list-group mb-3">
                    <a href="tcController" class="list-group-item list-group-item-action active">
                        Tất cả loại sách
                    </a>
                    <%
                        ArrayList<loai> dsloai = (ArrayList<loai>) request.getAttribute("dsloai");
                        if (dsloai != null) {
                            for (loai l : dsloai) {
                    %>
                        <a href="tcController?ml=<%=l.getMaloai()%>" class="list-group-item list-group-item-action">
                            <%=l.getTenloai()%>
                        </a>
                    <%
                            }
                        }
                    %>
                </div>
            </div>

            <!-- Cột bên phải: Hiển thị linh hoạt (Hiển thị Giỏ hàng HOẶC Danh sách sách) -->
            <div class="col-md-9">
            <%
                String ht = (String) request.getAttribute("ht");
                if (ht != null && ht.equals("giohang")) {
            %>
                <!-- ================= BẢNG GIỎ HÀNG ================= -->
                <h4 class="fw-bold text-uppercase">GIỎ HÀNG CỦA BẠN</h4>
                <%
                    giohangbo gh = (giohangbo) session.getAttribute("gh");
                    if (gh != null && gh.getDs() != null && !gh.getDs().isEmpty()) {
                %>
                    <table class="table-cart">
                        <thead>
                            <tr>
                                <th style="width: 80px;">STT</th>
                                <th>Tên hàng</th>
                                <th style="width: 120px;">Số lượng</th>
                                <th style="width: 150px;">Giá (VNĐ)</th>
                                <th style="width: 180px;">Thành tiền (VNĐ)</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            int stt = 1;
                            long tongTien = 0;
                            for (giohang h : gh.getDs()) {
                                tongTien += h.getThanhtien();
                        %>
                            <tr>
                                <td class="text-center"><%=stt++%></td>
                                <td><%=h.getTenhang()%></td>
                                <td class="text-center"><%=h.getSoluong()%></td>
                                <td style="text-align: right;"><%=h.getGia()%></td>
                                <td style="text-align: right;"><%=h.getThanhtien()%></td>
                            </tr>
                        <%
                            }
                        %>
                            <tr>
                                <td colspan="4" style="text-align: right; font-weight: bold;">Tổng cộng:</td>
                                <td style="text-align: right; color: red; font-weight: bold;"><%=tongTien%> VNĐ</td>
                            </tr>
                        </tbody>
                    </table>
                <%
                    } else {
                        out.print("<p class='text-danger mt-3'>Giỏ hàng của bạn đang trống!</p>");
                    }
                %>
                <br>
                <a href="tcController" class="text-primary text-decoration-underline">Tiếp tục mua hàng</a>

            <%
                } else {
            %>
                <!-- ================= DANH SÁCH SÁCH ================= -->
                <div class="row">
                    <%
                        ArrayList<sach> dssach = (ArrayList<sach>) request.getAttribute("dssach");
                        if (dssach != null && !dssach.isEmpty()) {
                            for (sach s : dssach) {
                    %>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100 text-center p-2">
                                <img src="<%=s.getAnh()%>" class="card-img-top mx-auto" 
                                     style="height: 200px; object-fit: contain;" alt="<%=s.getTensach()%>">
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <h6 class="card-title"><%=s.getTensach()%></h6>
                                    <p class="card-text text-danger fw-bold"><%=s.getGia()%> VNĐ</p>
                                    
                                    <!-- Nút Đặt mua -->
                                    <a href="giohangController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>" 
                                       class="btn btn-warning w-100 fw-semibold">
                                        🛒 Đặt mua
                                    </a>
                                </div>
                            </div>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <div class="col-12 text-center py-4">
                            <p class="text-muted">Không tìm thấy sản phẩm nào phù hợp!</p>
                        </div>
                    <%
                        }
                    %>
                </div>
            <%
                }
            %>
            </div>
        </div>
    </div>

</body>
</html>