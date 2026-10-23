package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class testController
 */
@WebServlet("/testController")
public class testController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //tao ra doi tuong out
//		PrintWriter out = response.getWriter();
//		out.print("<html><body>Alo </body></html>");
		
		//Dieu huong ve trang jsp
	//	response.sendRedirect("vd1.jsp");
		//Tao ra 2 bien request
		String[] ds= {"Ha","nam","Thanh"};
		request.setAttribute("dsten", ds);
		request.setAttribute("s", (int)10);
		
		//Tao ra 1 bien session
		HttpSession session= request.getSession();
		session.setAttribute("un","Alo");
		//Chuyen tiep ve trang vd5.jsp
		RequestDispatcher rd= request.getRequestDispatcher("vd5.jsp");
		rd.forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
