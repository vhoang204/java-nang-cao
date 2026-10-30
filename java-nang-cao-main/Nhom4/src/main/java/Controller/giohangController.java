package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import giohang.giohangbo;

@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        giohangbo gh = (giohangbo) session.getAttribute("gh");
        if (gh == null) gh = new giohangbo();

        String ma = request.getParameter("ms");
        String ten = request.getParameter("ts");
        String giaRaw = request.getParameter("gia");
        if (ma != null && ten != null && giaRaw != null) {
            try {
                long gia = Long.parseLong(giaRaw);
                if (gia >= 0) gh.Them(ma, ten, gia, 1L);
            } catch (NumberFormatException e) {
                throw new ServletException("Giá sách không hợp lệ", e);
            }
        }
        session.setAttribute("gh", gh);
        response.sendRedirect("hienthiController");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { doGet(request, response); }
}
