package product;

import java.util.ArrayList;

public class ProductBean {
	private String pname;
	private String func;
	private String category;
	private String brand;
	private int price;
	private int capacity;
	private String details;
	private ArrayList<String> component = new ArrayList<String>();
	
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getFunc() {
		return func;
	}
	public void setFunc(String func) {
		this.func = func;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public ArrayList<String> getComponent() {
		return component;
	}
	public void addComponentItem(String item) {
		component.add(item);
	}
}
