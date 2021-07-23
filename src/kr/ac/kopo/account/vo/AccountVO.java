package kr.ac.kopo.account.vo;

public class AccountVO {
	
	private String id;
	private String mainAccount;
	private String accountNo;
	private String bankCode;
	private String alias;
	private String accountPassword;
	private int balance;
	private String date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMainAccount() {
		return mainAccount;
	}
	public void setMainAccount(String mainAccount) {
		this.mainAccount = mainAccount;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getAccountPassword() {
		return accountPassword;
	}
	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "AccountVO [id=" + id + ", mainAccount=" + mainAccount + ", accountNo=" + accountNo + ", bankCode="
				+ bankCode + ", alias=" + alias + ", accountPassword=" + accountPassword + ", balance=" + balance
				+ ", date=" + date + "]";
	}
	
}
