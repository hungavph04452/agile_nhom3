package poly.java4.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class account {
	@Id
	@GeneratedValue
	private int idAccount;
	private String username;
	private String password;
	private String fullname;
	private String phone;
	private  int roles;

	public account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public account(int idAccount, String username, String password, String fullname, String phone, int roles) {
		super();
		this.idAccount = idAccount;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.phone = phone;
		this.roles = roles;
	}

	public int getRoles() {
		return roles;
	}

	public void setRoles(int roles) {
		this.roles = roles;
	}

	public int getIdAccount() {
		return idAccount;
	}

	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "account [idAccount=" + idAccount + ", username=" + username + ", password=" + password + ", fullname="
				+ fullname + ", phone=" + phone + ", email=" + ", roles=" + roles
				+ "]";
	}
	
}
