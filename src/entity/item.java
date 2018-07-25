package entity;

public class item {
	private product pro;
	private int quantity;
	public item(product pro, int quantity) {
		super();
		this.pro = pro;
		this.quantity = quantity;
	}
	public item() {
		super();
	}
	public product getPro() {
		return pro;
	}
	public void setPro(product pro) {
		this.pro = pro;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
