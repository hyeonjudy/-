package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.CustomerBean;

/**
 * Servlet implementation class ProductControl
 */
@WebServlet("/ProductControl")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO pdao = new ProductDAO();
	private ComponentDAO cdao = new ComponentDAO();
	private ArrayList<ComponentBean> cplist = cdao.getComponentList();
	private ArrayList<ProductBean> plist = pdao.getProductList();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		String address = null;
		request.setCharacterEncoding("utf-8");
		ArrayList<ProductBean> list = null;
		
		String action = request.getParameter("action");

		if(action.equals("category_view")){
			String category = request.getParameter("category");
			switch(category){
			case "skin/lotion":
				category = "스킨/로션";
				list = pdao.getProductCategoryList("스킨/로션");
				break;
				
			case "base makeup":
				category = "베이스 메이크업";
				list = pdao.getProductCategoryList("베이스");
				list.addAll(pdao.getProductCategoryList("비비크림"));
				list.addAll(pdao.getProductCategoryList("프라이머"));
				list.addAll(pdao.getProductCategoryList("컨실러"));
				break;
				
			case "foundation":
				category = "파운데이션/쿠션";
				list = pdao.getProductCategoryList("파운데이션/쿠션");
				break;
				
			case "powder":
				category = "파우더/팩트";
				list = pdao.getProductCategoryList("파우더/팩트");
				break;
				
			case "eye":
				category = "아이 메이크업";
				list = pdao.getProductCategoryList("아이라이너");
				list.addAll(pdao.getProductCategoryList("마스카라"));
				break;
				
			case "lip":
				category = "립 메이크업";
				list = pdao.getProductCategoryList("립");
				break;
				
			case "man":
				category = "남성";
				list = pdao.getProductCategoryList("남성");
				break;
			}
			request.setAttribute("categorylist", list);
			address = "/product_list.jsp?category="+category;
		}
		else if(action.equals("product_view")){
			String pname = request.getParameter("pname");
			ProductBean product = pdao.getProduct(pname);
			CustomerBean user = (CustomerBean)request.getSession().getAttribute("userinfo");
			HttpSession session = request.getSession();
			request.setAttribute("product", product);
			session.setAttribute("userinfo", request.getSession().getAttribute("userinfo"));
			
			session.setAttribute("badcomponent", getclist(1, product, user.getSkintype()));
			session.setAttribute("goodcomponent", getclist(2, product, user.getSkintype()));
			session.setAttribute("danger20", getclist(3, product, user.getSkintype()));
			session.setAttribute("fuc", getclist(4, product, user.getSkintype()));
			session.setAttribute("recommend", getRecommendProduct(user));
			address = "/product.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
	
	public ArrayList<ComponentBean> getclist(int num, ProductBean product, String skintype){
		ArrayList<ComponentBean> list = new ArrayList<>();
		ArrayList<String> components = product.getComponent();
		
		switch(num){
		case 1: //좋지 않은 성분
			for(int i=0; i<components.size();i++){
				for(int j=0; j<cplist.size();j++){
					if(components.get(i).equals(cplist.get(j).getCname())){
						
						if(skintype.equals("건성")&&cplist.get(j).getIsdry().equals("X")){
							list.add(cplist.get(j));
						}
						else if(skintype.equals("지성")&&cplist.get(j).getIsoily().equals("X")){
							list.add(cplist.get(j));
						}
						else if(skintype.equals("민감성")&&cplist.get(j).getIssensitive().equals("X")){
							list.add(cplist.get(j));
						}
					}
				}
			}
			return list;
			
		case 2: //좋은 성분
			for(int i=0; i<components.size();i++){
				for(int j=0; j<cplist.size();j++){
					if(components.get(i).equals(cplist.get(j).getCname())){
						if(skintype.equals("건성")&&cplist.get(j).getIsdry().equals("O")){
							list.add(cplist.get(j));
						}
						else if(skintype.equals("지성")&&cplist.get(j).getIsoily().equals("O")){
							list.add(cplist.get(j));
						}
						else if(skintype.equals("민감성")&&cplist.get(j).getIssensitive().equals("O")){
							list.add(cplist.get(j));
						}
					}
				}
			}
			return list;
			
		case 3: //20가지 유해 성분
			for(int i=0; i<components.size();i++){
				for(int j=0; j<cplist.size();j++){
					if(components.get(i).equals(cplist.get(j).getCname())){
						if(cplist.get(j).getDanger20()!=null){
							list.add(cplist.get(j));
						}
					}
				}
			}
			return list;
			
		case 4: //기능성 성분
			for(int i=0; i<components.size();i++){
				for(int j=0; j<cplist.size();j++){
					if(components.get(i).equals(cplist.get(j).getCname())){
						if(cplist.get(j).getFunctional()!=null){
							list.add(cplist.get(j));
						}
					}
				}
			}
			return list;	
		}
		
		return list;
	}
	
	public ArrayList<String> getRecommendProduct(CustomerBean user){
		ArrayList<String> list = new ArrayList<>();
		
		if(user.getSelectedfuc1()!=null){
			for(int i=0; i<plist.size();i++){
				if(plist.get(i).getFunc()!=null){
					String[] f = plist.get(i).getFunc().split("&");
					for(int j=0; j<f.length;j++){
						if(f[j].equals(user.getSelectedfuc1())){
							if(list.size()<4)
								list.add(plist.get(i).getPname());
						}
					}
				}
			}
		}
		if(user.getSelectedfuc2()!=null){
			int a = list.size();
			for(int i=0; i<plist.size();i++){
				if(plist.get(i).getFunc()!=null){
					String[] f = plist.get(i).getFunc().split("&");
					for(int j=0; j<f.length;j++){
						if(f[j].equals(user.getSelectedfuc2())){
							if(list.size()<a+3)
								list.add(plist.get(i).getPname());
						}
					}
				}
			}
		}
		return list;
	}
}
