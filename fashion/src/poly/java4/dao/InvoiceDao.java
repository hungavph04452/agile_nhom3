package poly.java4.dao;

import java.util.List;

import poly.java4.entities.invoice;

public interface InvoiceDao {

	public void addInvoice(invoice inv);
	
	public List<invoice> getListInvoice();
	
	public void updateInvoice(invoice inv);

	public invoice getInvoice(int idInvoice);
	
}
