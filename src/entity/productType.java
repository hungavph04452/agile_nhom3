package entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class productType {
	@Id@GeneratedValue
	private int idProductType;
	private String nameProductType;
	
	public productType() {
		super();
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
	@Override
	public String toString() {
		return "productType [idProductType=" + idProductType + ", nameProductType=" + nameProductType + "]";
	}
}
