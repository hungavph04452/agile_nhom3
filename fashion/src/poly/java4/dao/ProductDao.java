package poly.java4.dao;

import java.util.List;

import poly.java4.entities.product;

public interface ProductDao {

	public void insertProduct(product p);
	
	public List<product> getListProduct();
	
	public List<product> getListProductByProductType(int idProductType);
	
	public product getProduct(int idProduct);
	
	public List<product> getListProductByPagination(List<product> list, int start, int end);
}
