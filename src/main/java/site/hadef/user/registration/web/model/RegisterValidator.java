package site.hadef.user.registration.web.model;

public class RegisterValidator {
	
	private boolean name;
	private boolean email;
	private boolean phone;
	private boolean address;
	private boolean city;
	private boolean country;
	private boolean emailValidate;
	
	public RegisterValidator(boolean name, boolean email, boolean phone, boolean address, boolean city, boolean country,
			boolean emailValidate) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.country = country;
		this.emailValidate = emailValidate;
	}
	
	public boolean isEmailValidate() {
		return emailValidate;
	}

	public void setEmailValidate(boolean emailValidate) {
		this.emailValidate = emailValidate;
	}

	public boolean isName() {
		return name;
	}
	public void setName(boolean name) {
		this.name = name;
	}
	public boolean isEmail() {
		return email;
	}
	public void setEmail(boolean email) {
		this.email = email;
	}
	public boolean isPhone() {
		return phone;
	}
	public void setPhone(boolean phone) {
		this.phone = phone;
	}
	public boolean isAddress() {
		return address;
	}
	public void setAddress(boolean address) {
		this.address = address;
	}
	public boolean isCity() {
		return city;
	}
	public void setCity(boolean city) {
		this.city = city;
	}
	public boolean isCountry() {
		return country;
	}
	public void setCountry(boolean country) {
		this.country = country;
	}
	
}
