package com.techelevator;

import java.util.ArrayList;
import java.util.List;

public class BankCustomer {

	private String name;
	private String address;
	private String phoneNumber;
	private List<Accountable> accounts = new ArrayList<>();
	
	
	// getter
	public String getName() {
		return name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	
	public Accountable[] getAccounts() {
		return accounts.toArray(new Accountable[accounts.size()]);
	}

	// setters
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	// methods
	public void addAccount(Accountable newAccount) {
		accounts.add(newAccount);
	}
	
	public boolean isVip() {
		int combinedBalance = 0;
		for (Accountable account : accounts) {
			combinedBalance += account.getBalance();
		}
		if(combinedBalance >= 25000) {
			return true;
		} else {
			return false;
		}
	}

}
