package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class account {

	@Id@GeneratedValue
	private int idAccount;
	private String username;
	private String password;
	private String fullname;
	private String phone;
	private String email;
	private String address;
	private  int roles;
	
	
	public account() {
		super();
	}
	public account(int idAccount, String username, String password, String fullname, String phone, String email,
			String address, int roles) {
		super();
		this.idAccount = idAccount;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.address = address;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRoles() {
		return roles;
	}
	public void setRoles(int roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "account [idAccount=" + idAccount + ", username=" + username + ", password=" + password + ", fullname="
				+ fullname + ", phone=" + phone + ", email=" + email + ", address=" + address + ", roles=" + roles
				+ "]";
	}
	
	
}
