package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import product.*;
/**
 * Servlet implementation class login_OK
 */
@WebServlet("/login_OK")
public class login_OK extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CustomerDAO ctdao = new CustomerDAO();   
    ComponentDAO cdao = new ComponentDAO();
    ProductDAO pdao = new ProductDAO();
    private ArrayList<ProductBean> plist = pdao.getProductList();
    private ArrayList<ComponentBean> cplist = cdao.getComponentList();
    private ArrayList<CustomerBean> clist = ctdao.getCustomerList();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_OK() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doGet");
		logindo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost");
		logindo(request,response);
	}
	
	private void logindo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String id, pw;
		String address = null;
		clist = ctdao.getCustomerList();
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		CustomerBean customer = new CustomerBean();
		for(int i=0; i<clist.size();i++){
			if(clist.get(i).getId().equals(id)){
				if(clist.get(i).getPw().equals(pw)){
					System.out.println("로그인 성공");
					customer = clist.get(i);
					address = "/home2.jsp";
				}
			}
		}
			
		HttpSession session = request.getSession();
		session.setAttribute("userinfo", customer);
		session.setAttribute("toprecommend", getRecommend(customer.getAge()));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
	
	public ArrayList<ProductBean> getRecommend(int age){
		ArrayList<ProductBean> list = new ArrayList<>();
		int maxlike = getTopLike(age);
		String fuc = "없다";
		switch(maxlike){
		case 0: //미백
			fuc = "미백";
			break;
		case 1: //수분
			fuc = "수분";
			break;
		case 2: //탄력
			fuc = "탄력";
			break;
		case 3: //트러블
			fuc = "트러블";
			break;
		}
		
		for(int i=0;i<plist.size();i++){
			if(plist.get(i).getFunc()!=null){
				String[] f = plist.get(i).getFunc().split("&");
				for(int j=0; j<f.length; j++){
					if(f[j].equals(fuc)){
						list.add(plist.get(i));
					}
				}
			}
		}
		System.out.println("추천 제품 총 수:"+list.size());
		return list;
	}
	
	public int getTopLike(int userage){
		int[] func = {0,0,0,0}; //0:미백, 1:수분, 2:탄력, 3:트러블
		userage /=10;
		for(int i=0; i<clist.size();i++){
			int age = clist.get(i).getAge()/10;			
			if(age == userage){
				if(clist.get(i).getSelectedfuc1()!=null){
					if(clist.get(i).getSelectedfuc1().equals("미백")){
						func[0]++;
					}else if(clist.get(i).getSelectedfuc1().equals("수분")){
						func[1]++;
					}else if(clist.get(i).getSelectedfuc1().equals("탄력")){
						func[2]++;
					}else if(clist.get(i).getSelectedfuc1().equals("트러블")){
						func[3]++;
					}
				}
				if(clist.get(i).getSelectedfuc2()!=null){
					if(clist.get(i).getSelectedfuc2().equals("미백")){
						func[0]++;
					}else if(clist.get(i).getSelectedfuc2().equals("수분")){
						func[1]++;
					}else if(clist.get(i).getSelectedfuc2().equals("탄력")){
						func[2]++;
					}else if(clist.get(i).getSelectedfuc2().equals("트러블")){
						func[3]++;
					}
				}
			}
		}
		int maxfunc = getMax(func);
		
		System.out.print(userage*10+"대 : ");
		if(maxfunc == 0) System.out.println("미백");
		if(maxfunc == 1) System.out.println("수분");
		if(maxfunc == 2) System.out.println("탄력");
		if(maxfunc == 3) System.out.println("트러블");
		return maxfunc;
	}
	
	public int getMax(int[] array){
		int max = 0;
		
		for(int i=1; i<array.length;i++){
			if(array[max]<array[i])
				max = i;
		}
		
		return max;
	}

}
