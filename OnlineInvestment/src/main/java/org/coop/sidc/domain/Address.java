package org.coop.sidc.domain;


import javax.persistence.Embeddable;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Embeddable
public class Address {
	@NotEmpty(message="no empty field accepted")
	private String street;
	@NotEmpty(message="no empty field accepted")
	private String city;
	@NotEmpty(message="no empty field accepted")
	private String state;
	@Pattern(regexp="(^$|[0-9]{5})",message="zip must be at 5 digit")
	private String zip;
	@NotEmpty(message="no empty field accepted")
	private String country;
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
}
