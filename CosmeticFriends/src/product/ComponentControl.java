package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComponentControl
 */
@WebServlet("/ComponentControl")
public class ComponentControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO pdao = new ProductDAO();
	private ComponentDAO cdao = new ComponentDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComponentControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String address = null;
		request.setCharacterEncoding("utf-8");
		ArrayList<ComponentBean> list = new ArrayList<ComponentBean>();
		
		String pname = request.getParameter("pname");
		ProductBean product = pdao.getProduct(pname);
		ArrayList<String> clist = product.getComponent();
		ArrayList<ComponentBean> list1 = cdao.getComponentList(); 
		for(int i=0; i<clist.size(); i++){
			for(int j=0; j<list1.size();j++){
				if(clist.get(i).equals(list1.get(j).getCname()))
					list.add(list1.get(j));
			}
		}
		
		request.setAttribute("componentlist", list);
		address = "/component.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

}
