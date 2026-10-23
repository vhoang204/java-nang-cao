package Controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import loai.loai;
import loai.loaibo;

@WebServlet("/hienthiController")
public class hienthiController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public hienthiController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");

            // 1. Lấy danh sách loại để giữ nguyên menu bên trái
            loaibo lbo = new loaibo();
            ArrayList<loai> dsloai = lbo.getloai();
            request.setAttribute("dsloai", dsloai);

            // 2. Đặt thuộc tính đánh dấu hiển thị giỏ hàng
            request.setAttribute("ht", "giohang");

            // 3. Forward dữ liệu sang tc.jsp
            RequestDispatcher rd = request.getRequestDispatcher("tc.jsp");
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