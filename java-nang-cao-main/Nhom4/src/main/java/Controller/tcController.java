package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import loai.loaibo;
import sach.sach;
import sach.sachbo;

/**
 * Servlet implementation class tcController
 */
@WebServlet("/tcController")
public class tcController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tcController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  try {
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  //lay ve danh sach loai -> chuyen ve tc.jsp
		  loaibo lbo= new loaibo();
		  request.setAttribute("dsloai", lbo.getloai());
		  //Lay ve ds sach -> chuyen ve tc.jsp
		  String ml=request.getParameter("ml");
		  String key=request.getParameter("txttk");
		  sachbo sbo= new sachbo();
		  ArrayList<sach> ds= sbo.getSach();
		  if(ml!=null) ds =sbo.TimMa(ml);
		  else
			  if(key!=null) ds=sbo.Tim(key);
		       
		  request.setAttribute("dssach",ds);
		  //Chuyen tiep ve tc.jsp
		  request.getRequestDispatcher("tc.jsp").forward(request, response);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
