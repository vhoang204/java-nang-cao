package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class maytinhController
 */
@WebServlet("/maytinhController")
public class maytinhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public maytinhController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tama= request.getParameter("txta");
		String tamb= request.getParameter("txtb");
		 double a=0,b=0,kq=0;
		if(tama!=null&&tamb!=null){
		      a= Double.parseDouble(tama);
		      b= Double.parseDouble(tamb);
		if(request.getParameter("butcong")!=null)
		   kq=a+b;
		if(request.getParameter("buttru")!=null)
		    kq=a-b;
		if(request.getParameter("butnhan")!=null)
		    kq=a*b;
		if(request.getParameter("butchia")!=null)
		    kq=a/b;
		}//Chuyen a,b,kq ve trang maytinh.jsp
		request.setAttribute("a",a);request.setAttribute("b",b);
		request.setAttribute("kq",kq);
request.getRequestDispatcher("maytinh.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
