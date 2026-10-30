package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import giohang.giohangbo;
import loai.loaibo;

@WebServlet("/hienthiController")
public class hienthiController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            request.setAttribute("dsloai", new loaibo().getloai());
            request.setAttribute("ht", "giohang");
            request.getRequestDispatcher("tc.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Không thể tải giỏ hàng", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        giohangbo gh = (giohangbo) session.getAttribute("gh");
        if (gh == null) gh = new giohangbo();

        String action = request.getParameter("action");
        try {
            if ("xoa".equals(action)) {
                gh.xoa(request.getParameter("mahang"));
            } else if ("xoaChon".equals(action)) {
                gh.xoaNhieu(request.getParameterValues("chon"));
            } else if ("xoaTatCa".equals(action)) {
                gh.xoaTatCa();
            } else if ("capNhatMot".equals(action)) {
                String ma = request.getParameter("mahangSua");
                String raw = ma == null ? null : request.getParameter("sl_" + ma);
                if (raw != null && raw.matches("\\d+")) {
                    long sl = Long.parseLong(raw);
                    if (sl >= 1 && sl <= 999) gh.capNhatSoLuong(ma, sl);
                }
            } else if ("capNhat".equals(action)) {
                for (giohang h : gh.getDs()) {
                    String raw = request.getParameter("sl_" + h.getMahang());
                    if (raw != null && raw.matches("\\d+")) {
                        long sl = Long.parseLong(raw);
                        if (sl >= 1 && sl <= 999) gh.capNhatSoLuong(h.getMahang(), sl);
                    }
                }
            }
            session.setAttribute("gh", gh);
            response.sendRedirect("hienthiController");
        } catch (Exception e) {
            throw new ServletException("Không thể cập nhật giỏ hàng", e);
        }
    }
}
