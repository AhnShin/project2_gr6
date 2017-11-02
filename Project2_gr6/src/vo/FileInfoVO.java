package vo;

import javax.servlet.http.HttpServlet;

public class FileInfoVO {
	private int food_num;
	private String name;
	private int price;
	private String filename;
	
////////////////////////////////////////////////////////////////////////////
	public FileInfoVO(int food_num, String name, int price, String filename) {
		super();
		this.food_num = food_num;
		this.name = name;
		this.price = price;
		this.filename = filename;
	}
	public FileInfoVO() {
		
	}
////////////////////////////////////////////////////////////////////////////	
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
////////////////////////////////////////////////////////////////////////////
	
	@Override
	public String toString() {
		return "FileInfoVO [food_num=" + food_num + ", name=" + name + ", price=" + price + ", filename=" + filename
				+ "]";
	}
	
////////////////////////////////////////////////////////////////////////////
	
	
}