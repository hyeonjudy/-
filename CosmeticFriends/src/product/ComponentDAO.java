package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ComponentDAO {
	
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
	
	public ComponentBean getComponent(String cname){
		String sql = "select * from component where cname='"+cname+"'";
		ComponentBean component = new ComponentBean();
		
		try{
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				component.setCname(rs.getString("cname"));
				component.setDetails(rs.getString("details"));
				component.setDangerNum(rs.getInt("dangerNum"));
				component.setDanger(rs.getString("dangerNum"));
				component.setIsdry(rs.getString("isdry"));
				component.setIsoily(rs.getString("isoily"));
				component.setIssensitive(rs.getString("issensitive"));
				component.setTypedetails(rs.getString("typedetails"));
				component.setAllergy(rs.getString("allergy"));
				component.setDanger20(rs.getString("danger20"));
				component.setFunctional(rs.getString("functional"));
			}
			rs.close();
			disconnect();
		}catch(Exception e){
		}
		return component;
	}
	
	public ArrayList<ComponentBean> getComponentList(){
		String sql = "select * from component";
		ArrayList<ComponentBean> list = new ArrayList<ComponentBean>();
		try{
			connect();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				ComponentBean component = new ComponentBean();
				
				component.setCname(rs.getString("cname"));
				component.setDetails(rs.getString("details"));
				component.setDangerNum(rs.getInt("dangerNum"));
				component.setDanger(rs.getString("dangerNum"));
				component.setIsdry(rs.getString("isdry"));
				component.setIsoily(rs.getString("isoily"));
				component.setIssensitive(rs.getString("issensitive"));
				component.setTypedetails(rs.getString("typedetails"));
				component.setAllergy(rs.getString("allergy"));
				component.setDanger20(rs.getString("danger20"));
				component.setFunctional(rs.getString("functional"));
				
				list.add(component);
			}
			rs.close();
			disconnect();
		}catch(Exception e){
		}
		return list;
	}
}
