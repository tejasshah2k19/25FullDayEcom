package com.bean;

public class AccountBean {

	private Integer accountId;
	private String accountName;
	private Float amount;
	private Integer thresholdLimit;

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}


	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public Integer getThresholdLimit() {
		return thresholdLimit;
	}

	public void setThresholdLimit(Integer thresholdLimit) {
		this.thresholdLimit = thresholdLimit;
	}

}
