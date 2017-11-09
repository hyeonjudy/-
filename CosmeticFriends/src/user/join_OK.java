package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class join_OK
 */
@WebServlet("/join_OK")
public class join_OK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection dbconn;
	private Statement stmt;
	
	private String id, pw, gender, skintype, selectedfuc1, selectedfuc2;
	private int age;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join_OK() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		
		registercustomer(request, response);
	}


	private void registercustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		gender = request.getParameter("gender");
		String a = request.getParameter("age");
		a = a.substring(0, a.indexOf("대"));
		System.out.println(a);
		age = Integer.parseInt(a);
		skintype = request.getParameter("skintype");
		selectedfuc1 = request.getParameter("skinfuc1");
		selectedfuc2 = request.getParameter("skinfuc2");
		
		
		String query = "insert into CUSTOMER values('"+id+"','"+pw+"','"+gender+"','"+age+"','"+skintype+"','"+selectedfuc1+"','"+selectedfuc2+"')";
				
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webFriends", "web123");
			stmt = dbconn.createStatement();
			int n = stmt.executeUpdate(query);
			if(n>0){
				System.out.println("가입 성공!!!");
				response.sendRedirect("join_res.jsp");
			}else{
				System.out.println("가입 실패...!!!");
				response.sendRedirect("join.html");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt != null) stmt.close();
				if(dbconn != null) dbconn.close();
			}catch(Exception e){}
		}	
		
	}

}
