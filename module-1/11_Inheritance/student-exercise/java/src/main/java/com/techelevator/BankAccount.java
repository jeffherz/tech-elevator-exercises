package com.techelevator;

public class BankAccount {

	private String accountHolderName;
	private String accountNumber;
	private int balance;
	
	public BankAccount(String accountHolderName, String accountNumber) {
		this.accountHolderName = accountHolderName;
		this.accountNumber = accountNumber;
	}
	
	public BankAccount(String accountHolderName, String accountNumber, int balance) {
		this.accountHolderName = accountHolderName;
		this.accountNumber = accountNumber;
		this.balance = balance;
	}
	
	// getters
	public String getAccountHolderName() {
		return accountHolderName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public int getBalance() {
		return balance;
	}
	
	// methods
	public int deposit(int amountToDeposit) {
		balance += amountToDeposit;
		return balance;
	}
	public int withdraw(int amountToWithdraw) {
		balance -= amountToWithdraw;
		return balance;
	}
}
