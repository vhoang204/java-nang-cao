package Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher; // Thêm import này
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohang.giohangbo;

@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public giohangController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Thiết lập mã hóa tiếng Việt UTF-8
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");

            // 2. Lấy tham số gửi từ tc.jsp
            String masach = request.getParameter("ms");
            String tensach = request.getParameter("ts");
            String giaStr = request.getParameter("gia");

            // 3. Lấy session
            HttpSession session = request.getSession();

            // 4. Lấy giohangbo ra khỏi session
            giohangbo gh = (giohangbo) session.getAttribute("gh");

            // Nếu chưa có giỏ hàng thì tạo mới
            if (gh == null) {
                gh = new giohangbo();
            }

            // 5. Thêm sách vào giỏ nếu bấm từ nút Đặt mua
            if (masach != null && tensach != null && giaStr != null) {
                long gia = Long.parseLong(giaStr);
                long soluong = 1L;
                gh.Them(masach, tensach, gia, soluong);
            }

            // 6. Lưu giỏ hàng vào session
            session.setAttribute("gh", gh);

            // 7. Dùng Forward thay vì sendRedirect để GIỮ NGUYÊN URL giohangController
            RequestDispatcher rd = request.getRequestDispatcher("giohang.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}