package com.online.shop.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_account")
public class UserAccount implements Serializable {
	private static final long serialVersionUID = -4915323961941547563L;

	private Long id;
	private String username;
	private String password;
	private Boolean active;
	private String resetToken;
	private LocalDateTime resetTokenExpireDate;
	private String recoverToken;
	private LocalDateTime recoverTokenExpireDate;

	private UserDetails userDetails;
	private Set<Role> roles = new HashSet<>();
	private Set<Order> orders = new HashSet<>();

	public UserAccount() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(unique = true, nullable = false)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column
	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@Column
	public String getResetToken() {
		return resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}

	@Column
	public LocalDateTime getResetTokenExpireDate() {
		return resetTokenExpireDate;
	}

	public void setResetTokenExpireDate(LocalDateTime resetTokenExpireDate) {
		this.resetTokenExpireDate = resetTokenExpireDate;
	}

	@Column
	public String getRecoverToken() {
		return recoverToken;
	}

	public void setRecoverToken(String recoverToken) {
		this.recoverToken = recoverToken;
	}

	@Column
	public LocalDateTime getRecoverTokenExpireDate() {
		return recoverTokenExpireDate;
	}

	public void setRecoverTokenExpireDate(LocalDateTime recoverTokenExpireDate) {
		this.recoverTokenExpireDate = recoverTokenExpireDate;
	}

	@OneToOne(fetch = FetchType.EAGER, optional = true, mappedBy = "userAccount", cascade = CascadeType.ALL)
	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails user) {
		this.userDetails = user;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "account_roles", joinColumns = @JoinColumn(name = "account_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "account")
	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}
