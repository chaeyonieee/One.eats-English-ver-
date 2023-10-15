package com.example.demo.common.api.toss.dto;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
public class TossDTO {
	
	private String version;
	private String paymentKey;
	private String type;
	private String orderId;
	private String orderName;
	private String mId;
	private String currency;
	private String method;
	private long totalAmount;
	private long balanceAmount;
	private String status;
	private String requestedAt;
	private String approvedAt;
	private boolean useEscrow;
	private String suppliedAmount;
	private long vat;
	private boolean cultureExpense;
	private String taxFreeAmount;
	private int taxExemptionAmount;
	private boolean isPartialCancelable;
	private String country;
	
	
	private String lastTransactionKey;
	private List<TossCancelDTO> cancels;
	private TossCardDTO card;
	private TossVirtualAccountDTO virtualAccount;
	private String secret;
	private String mobilePhone;
	private TossGiftCertificateDTO giftCertificate;
	private TossTransferDTO transfer;
	private TossReceiptDTO receipt;
	private TossCheckoutDTO checkout;
	private TossEasyPayDTO easyPay;
	private TossFailureDTO failure;
	private TossCashReceiptDTO cashReceipt;
	private List<TossCashReceiptDTO> cashReceipts;
	private int discount;
	
	private String paymentType;
	private String json_data;
	
	

	public String getJson_data() {
		return json_data;
	}

	public void setJson_data(String json_data) {
		this.json_data = json_data;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getPaymentKey() {
		return paymentKey;
	}

	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public long getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(long totalAmount) {
		this.totalAmount = totalAmount;
	}

	public long getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(long balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRequestedAt() {
		return requestedAt;
	}

	public void setRequestedAt(String requestedAt) {
		this.requestedAt = requestedAt;
	}

	public String getApprovedAt() {
		return approvedAt;
	}

	public void setApprovedAt(String approvedAt) {
		this.approvedAt = approvedAt;
	}

	public boolean isUseEscrow() {
		return useEscrow;
	}

	public void setUseEscrow(boolean useEscrow) {
		this.useEscrow = useEscrow;
	}

	public String getSuppliedAmount() {
		return suppliedAmount;
	}

	public void setSuppliedAmount(String suppliedAmount) {
		this.suppliedAmount = suppliedAmount;
	}

	public long getVat() {
		return vat;
	}

	public void setVat(long vat) {
		this.vat = vat;
	}

	public boolean isCultureExpense() {
		return cultureExpense;
	}

	public void setCultureExpense(boolean cultureExpense) {
		this.cultureExpense = cultureExpense;
	}

	public String getTaxFreeAmount() {
		return taxFreeAmount;
	}

	public void setTaxFreeAmount(String taxFreeAmount) {
		this.taxFreeAmount = taxFreeAmount;
	}

	public int getTaxExemptionAmount() {
		return taxExemptionAmount;
	}

	public void setTaxExemptionAmount(int taxExemptionAmount) {
		this.taxExemptionAmount = taxExemptionAmount;
	}

	public boolean isPartialCancelable() {
		return isPartialCancelable;
	}

	public void setPartialCancelable(boolean isPartialCancelable) {
		this.isPartialCancelable = isPartialCancelable;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getLastTransactionKey() {
		return lastTransactionKey;
	}

	public void setLastTransactionKey(String lastTransactionKey) {
		this.lastTransactionKey = lastTransactionKey;
	}

	public List<TossCancelDTO> getCancels() {
		return cancels;
	}

	public void setCancels(List<TossCancelDTO> cancels) {
		this.cancels = cancels;
	}

	public TossCardDTO getCard() {
		return card;
	}

	public void setCard(TossCardDTO card) {
		this.card = card;
	}

	public TossVirtualAccountDTO getVirtualAccount() {
		return virtualAccount;
	}

	public void setVirtualAccount(TossVirtualAccountDTO virtualAccount) {
		this.virtualAccount = virtualAccount;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public TossGiftCertificateDTO getGiftCertificate() {
		return giftCertificate;
	}

	public void setGiftCertificate(TossGiftCertificateDTO giftCertificate) {
		this.giftCertificate = giftCertificate;
	}

	public TossTransferDTO getTransfer() {
		return transfer;
	}

	public void setTransfer(TossTransferDTO transfer) {
		this.transfer = transfer;
	}

	public TossReceiptDTO getReceipt() {
		return receipt;
	}

	public void setReceipt(TossReceiptDTO receipt) {
		this.receipt = receipt;
	}

	public TossCheckoutDTO getCheckout() {
		return checkout;
	}

	public void setCheckout(TossCheckoutDTO checkout) {
		this.checkout = checkout;
	}

	public TossEasyPayDTO getEasyPay() {
		return easyPay;
	}

	public void setEasyPay(TossEasyPayDTO easyPay) {
		this.easyPay = easyPay;
	}

	public TossFailureDTO getFailure() {
		return failure;
	}

	public void setFailure(TossFailureDTO failure) {
		this.failure = failure;
	}

	public TossCashReceiptDTO getCashReceipt() {
		return cashReceipt;
	}

	public void setCashReceipt(TossCashReceiptDTO cashReceipt) {
		this.cashReceipt = cashReceipt;
	}

	public List<TossCashReceiptDTO> getCashReceipts() {
		return cashReceipts;
	}

	public void setCashReceipts(List<TossCashReceiptDTO> cashReceipts) {
		this.cashReceipts = cashReceipts;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	
	@Override
	public String toString() {
		return "TossDTO [version=" + version + ", paymentKey=" + paymentKey + ", type=" + type + ", orderId=" + orderId
				+ ", orderName=" + orderName + ", mId=" + mId + ", currency=" + currency + ", method=" + method
				+ ", totalAmount=" + totalAmount + ", balanceAmount=" + balanceAmount + ", status=" + status
				+ ", requestedAt=" + requestedAt + ", approvedAt=" + approvedAt + ", useEscrow=" + useEscrow
				+ ", suppliedAmount=" + suppliedAmount + ", vat=" + vat + ", cultureExpense=" + cultureExpense
				+ ", taxFreeAmount=" + taxFreeAmount + ", taxExemptionAmount=" + taxExemptionAmount
				+ ", isPartialCancelable=" + isPartialCancelable + ", country=" + country + ", lastTransactionKey="
				+ lastTransactionKey + ", cancels=" + cancels + ", card=" + card + ", virtualAccount=" + virtualAccount
				+ ", secret=" + secret + ", mobilePhone=" + mobilePhone + ", giftCertificate=" + giftCertificate
				+ ", transfer=" + transfer + ", receipt=" + receipt + ", checkout=" + checkout + ", easyPay=" + easyPay
				+ ", failure=" + failure + ", cashReceipt=" + cashReceipt + ", cashReceipts=" + cashReceipts
				+ ", discount=" + discount + "]";
	}

	public TossDTO(Map map) {
		super();
		this.paymentKey = (String) map.get("paymentKey");
		this.orderId = (String) map.get("orderId");
		this.orderName = (String) map.get("orderName");
		this.method = (String) map.get("method");
		this.totalAmount = (long) map.get("totalAmount");
		this.paymentType = (String) map.get("method");
	}
	
	public TossDTO(JSONObject jsonObject ) {
		super();
		this.paymentKey = (String) jsonObject.get("paymentKey");
		this.orderId = (String) jsonObject.get("orderId");
		this.orderName = (String) jsonObject.get("orderName");
		this.method = (String) jsonObject.get("method");
		this.totalAmount = (long) jsonObject.get("totalAmount");
		this.paymentType = (String) jsonObject.get("method");
	}
	
	public TossDTO() {
		super();
	}
	
	public String getPaymentType() {
		return paymentType;
	}
	
	
	
	
}
