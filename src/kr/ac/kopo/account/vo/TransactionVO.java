package kr.ac.kopo.account.vo;

public class TransactionVO {

	private String transNo;
	private String transAccountNo;
	private String amount;
	private String toAccountNo;
	private String toName;
	private String transDate;
	private String bankName;
	private int balance;
	
	public String getTransNo() {
		return transNo;
	}
	public void setTransNo(String transNo) {
		this.transNo = transNo;
	}
	public String getTransAccountNo() {
		return transAccountNo;
	}
	public void setTransAccountNo(String transAccountNo) {
		this.transAccountNo = transAccountNo;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getToAccountNo() {
		return toAccountNo;
	}
	public void setToAccountNo(String toAccountNo) {
		this.toAccountNo = toAccountNo;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	@Override
	public String toString() {
		return "TransactionVO [transNo=" + transNo + ", transAccountNo=" + transAccountNo + ", amount=" + amount
				+ ", toAccountNo=" + toAccountNo + ", toName=" + toName + ", transDate=" + transDate + ", bankName="
				+ bankName + ", balance=" + balance + "]";
	}
	
}
