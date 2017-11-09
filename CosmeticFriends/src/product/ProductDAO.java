package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductDAO {
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
			e.printStackTrace();
		}
	}
	private void disconnect(){
		try{
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductBean> getProductCategoryList(String category){
		String sql = "select pname, category, brand, price from product where category = '"+category+"'";
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		try{
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				ProductBean product = new ProductBean();
				product.setPname(rs.getString("pname"));
				product.setCategory(rs.getString("category"));
				product.setBrand(rs.getString("brand"));
				product.setPrice(rs.getInt("price"));
				
				list.add(product);
			}
			rs.close();
			disconnect();
		}catch(Exception e){
		}
		
		return list;
	}
	
	public ArrayList<ProductBean> getProductList(){
		String sql = "select * from product";
		
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		try{
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				ProductBean product = new ProductBean();
				product.setPname(rs.getString("pname"));
				product.setFunc(rs.getString("functional"));
				product.setCategory(rs.getString("category"));
				product.setBrand(rs.getString("brand"));
				product.setPrice(rs.getInt("price"));
				product.setCapacity(rs.getInt("capacity"));
				product.setDetails(rs.getString("details"));
				for(int i = 1; i < 57; i++){
					String item = rs.getString("ingredient"+i);
					if(item == null){
						break;
					}
					product.addComponentItem(item);
				}
				list.add(product);
			}
			rs.close();
			disconnect();
		}catch(Exception e){
		}
		return list;
	}
	
	public ProductBean getProduct(String pname){
		String sql = "select * from product where pname = '"+pname+"'";
		ProductBean product = new ProductBean();
		try{
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				product.setPname(rs.getString("pname"));
				product.setCategory(rs.getString("category"));
				product.setBrand(rs.getString("brand"));
				product.setPrice(rs.getInt("price"));
				product.setCapacity(rs.getInt("capacity"));
				product.setDetails(rs.getString("details"));
				for(int i = 1; i < 57; i++){
					String item = rs.getString("ingredient"+i);
					if(item == null){
						break;
					}
					product.addComponentItem(item);
				}
			}
			rs.close();
			disconnect();
		}catch(Exception e){
		}
		return product;
	}
	
}
