package poly.java4.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class detailInvoice {
	@Id
	private int idInvoice;
	private int idProduct;
	private int quantity;

	public detailInvoice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public detailInvoice(int idInvoice, int idProduct, int quantity) {
		super();
		this.idInvoice = idInvoice;
		this.idProduct = idProduct;
		this.quantity = quantity;
	}

	public int getIdInvoice() {
		return idInvoice;
	}

	public void setIdInvoice(int idInvoice) {
		this.idInvoice = idInvoice;
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
