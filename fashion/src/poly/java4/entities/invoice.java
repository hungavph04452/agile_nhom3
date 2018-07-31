package poly.java4.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class invoice {
	@Id
	@GeneratedValue
	private int idInvoice;
	private String name;
	private String phoneNumber;
	private String addressNumber;
	private Date date;
	private int status;
	private int total;
	private int idAccount;

	public invoice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public invoice(int idInvoice, String phoneNumber, String addressNumber, Date date, String name) {
		super();
		this.idInvoice = idInvoice;
		this.phoneNumber = phoneNumber;
		this.addressNumber = addressNumber;
		this.date = date;
		this.name = name;
	}

	public invoice(int idInvoice, String name, String phoneNumber, String addressNumber, Date date, int status,
			int total, int idAccount) {
		super();
		this.idInvoice = idInvoice;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.addressNumber = addressNumber;
		this.date = date;
		this.status = status;
		this.total = total;
		this.idAccount = idAccount;
	}

	public int getIdInvoice() {
		return idInvoice;
	}

	public void setIdInvoice(int idInvoice) {
		this.idInvoice = idInvoice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddressNumber() {
		return addressNumber;
	}

	public void setAddressNumber(String addressNumber) {
		this.addressNumber = addressNumber;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getIdAccount() {
		return idAccount;
	}

	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}

}
