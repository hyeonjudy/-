package user;
import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;


public class CustomerDAO {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "webfriends";
	private String upw = "web123";
	private Connection conn;
	private Statement stmt;
	
	private void connect(){
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			stmt = conn.createStatement();
		}catch(Exception e){
		}
	}
	private void disconnect(){
		try{
			stmt.close();
			conn.close();
		}catch(Exception e){
		}
	}
	
	public CustomerBean getCustomer(String id) {
		CustomerBean customer = new CustomerBean();
		
		String query = "select * from customer where id='"+id+"'";
		try{
			connect();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				
				customer.setId(rs.getString("id"));
				customer.setPw(rs.getString("pw"));
				customer.setGender(rs.getString("gender"));
				customer.setAge(rs.getInt("age"));
				customer.setSkintype(rs.getString("skintype"));
				customer.setSelectedfuc1(rs.getString("selectedfuc1"));
				customer.setSelectedfuc2(rs.getString("selectedfuc2"));
			}
			rs.close();
			disconnect();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return customer;
	}
	
	public ArrayList<CustomerBean> getCustomerList() {
		ArrayList<CustomerBean> list = new ArrayList<CustomerBean>();
		
		String query = "select * from customer";
		try{
			connect();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				CustomerBean customer = new CustomerBean();
				customer.setId(rs.getString("id"));
				customer.setPw(rs.getString("pw"));
				customer.setGender(rs.getString("gender"));
				customer.setAge(rs.getInt("age"));
				customer.setSkintype(rs.getString("skintype"));
				customer.setSelectedfuc1(rs.getString("selectedfuc1"));
				customer.setSelectedfuc2(rs.getString("selectedfuc2"));
				
				list.add(customer);
			}
			rs.close();
			disconnect();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
}
