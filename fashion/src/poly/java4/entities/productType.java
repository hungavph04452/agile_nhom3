package poly.java4.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class productType {
	@Id
	@GeneratedValue
	private int idProductType;
	private String nameProductType;

	public productType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public productType(int idProductType, String nameProductType) {
		super();
		this.idProductType = idProductType;
		this.nameProductType = nameProductType;
	}

	public int getIdProductType() {
		return idProductType;
	}

	public void setIdProductType(int idProductType) {
		this.idProductType = idProductType;
	}

	public String getNameProductType() {
		return nameProductType;
	}

	public void setNameProductType(String nameProductType) {
		this.nameProductType = nameProductType;
	}

}
