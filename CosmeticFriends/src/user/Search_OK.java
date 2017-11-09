package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.*;

/**
 * Servlet implementation class Search_OK
 */
@WebServlet("/Search_OK")
public class Search_OK extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO pdao = new ProductDAO();
	private ArrayList<ProductBean> plist = pdao.getProductList();
	private String search_fuc;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_OK() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Searchdo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Searchdo(request, response);
	}

	private void Searchdo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");		
		
		search_fuc = request.getParameter("search_fuc");
		
		request.setAttribute("searchlist", getFuncProduct(search_fuc));
		
		String address = "/search_res.jsp?search_fuc="+search_fuc;
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
	
	public ArrayList<String> getFuncProduct(String fuc){
		 ArrayList<String> list = new ArrayList<>();
		 
		 for(int i=0; i<plist.size();i++){
			 if(plist.get(i).getFunc()!=null){
				String[] f = plist.get(i).getFunc().split("&");
				for(int j=0; j<f.length;j++){
					if(f[j].equals(fuc))
						list.add(plist.get(i).getPname());
				}
			}
		 }		 
		 
		 return list;
	}
}
