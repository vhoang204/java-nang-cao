<%@page import="giohang.giohang"%>
<%@page import="giohang.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<style>
    /* Tạo khung viền rõ ràng cho bảng, hàng, cột và các ô */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    table, th, td {
        border: 1px solid #000; /* Khung viền màu đen */
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2; /* Màu nền cho tiêu đề cột */
        text-align: center;
    }
    .text-center {
        text-align: center;
    }
    .text-right {
        text-align: right;
    }
</style>
</head>
<body>
    <h2>GIỎ HÀNG CỦA BẠN</h2>

<%
    giohangbo gh = (giohangbo) session.getAttribute("gh");
    
    // Kiểm tra nếu giỏ hàng tồn tại và có sản phẩm
    if (gh != null && gh.getDs() != null && !gh.getDs().isEmpty()) {
%>
    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên hàng</th>
                <th>Số lượng</th>
                <th>Giá (VNĐ)</th>
                <th>Thành tiền (VNĐ)</th>
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
                <td class="text-right"><%=h.getGia()%></td>
                <td class="text-right"><%=h.getThanhtien()%></td>
            </tr>
<%
        }
%>
            <!-- Hàng hiển thị tổng tiền -->
            <tr>
                <td colspan="4" class="text-right"><strong>Tổng cộng:</strong></td>
                <td class="text-right" style="color: red; font-weight: bold;"><%=tongTien%> VNĐ</td>
            </tr>
        </tbody>
    </table>
<%
    } else {
        out.print("<p style='color: red;'>Giỏ hàng của bạn đang trống!</p>");
    }
%>

    <br>
    <a href="tcController">Tiếp tục mua hàng</a>
</body>
</html>