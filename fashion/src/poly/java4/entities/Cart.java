package poly.java4.entities;

import java.util.Map;
import java.util.TreeMap;

public class Cart {

	private TreeMap<product, Integer> listProduct;
	private long cartId;

	public Cart() {
		listProduct = new TreeMap<product, Integer>();
		cartId = System.currentTimeMillis();
	}

	public Cart(TreeMap<product, Integer> listProduct, long cartId) {
		super();
		this.listProduct = listProduct;
		this.cartId = cartId;
	}

	public TreeMap<product, Integer> getListProduct() {
		return listProduct;
	}

	public void setListProduct(TreeMap<product, Integer> listProduct) {
		this.listProduct = listProduct;
	}

	public long getCartId() {
		return cartId;
	}

	public void setCartId(long cartId) {
		this.cartId = cartId;
	}

	// them vao gio hang
	public void insertToCart(product p, int quantity) {
		boolean check = listProduct.containsKey(p);
		if (check) {
			int old_quantity = listProduct.get(p);
			quantity += old_quantity;
			listProduct.put(p, quantity);
		} else {
			listProduct.put(p, quantity);
		}
	}

	// cap nhat gio hang
	public void updateToCart(product p, int quantity) {
		boolean check = listProduct.containsKey(p);
		if (check == true) {
			if (quantity <= 0) {
				listProduct.remove(p);
			} else {
				listProduct.remove(p);
				listProduct.put(p, quantity);
			}
		}
	}

	// xoa khoi gio hang
	public void removeToCart(product p, int quantity) {
		boolean check = listProduct.containsKey(p);
		if (check == true) {
			int old_quantity = listProduct.get(p);
			quantity = old_quantity - quantity;
			if (quantity <= 0) {
				listProduct.remove(p);
			} else {
				listProduct.remove(p);
				listProduct.put(p, quantity);
			}
		}
	}
	
	public void removeCart(product p) {
		boolean check = listProduct.containsKey(p);
		if(check==true) {
			listProduct.remove(p);
		}
	}
	
	// dem
	public int countItem() {
		int count = 0;
		for(Map.Entry<product, Integer> list : listProduct.entrySet()) {
			count +=list.getValue();
		}
		return count;
	}
	
	// tong
	public double total() {
		int count = 0;
		for(Map.Entry<product, Integer> list : listProduct.entrySet()) {
			count +=list.getValue() * list.getKey().getPrice();
		}
		return count;
		
	}
}
