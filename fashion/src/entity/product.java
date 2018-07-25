package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class product {
	@Id@GeneratedValue
	private int idProduct;
	private String nameProduct;
	private int price;
	private int quantity;
	private String describe;
	private String productInmage;
	private int idProductType;
	
	public product() {
		super();
	}
	
	public product(int idProduct, String nameProduct, int price, int quantity, String describe, String productInmage,
			int idProductType) {
		super();
		this.idProduct = idProduct;
		this.nameProduct = nameProduct;
		this.price = price;
		this.quantity = quantity;
		this.describe = describe;
		this.productInmage = productInmage;
		this.idProductType = idProductType;
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getProductInmage() {
		return productInmage;
	}

	public void setProductInmage(String productInmage) {
		this.productInmage = productInmage;
	}

	public int getIdProductType() {
		return idProductType;
	}

	public void setIdProductType(int idProductType) {
		this.idProductType = idProductType;
	}

	@Override
	public String toString() {
		return "product [idProduct=" + idProduct + ", nameProduct=" + nameProduct + ", price=" + price + ", quantity="
				+ quantity + ", describe=" + describe + ", productInmage=" + productInmage + ", idProductType="
				+ idProductType + "]";
	}

	
	
	
}
