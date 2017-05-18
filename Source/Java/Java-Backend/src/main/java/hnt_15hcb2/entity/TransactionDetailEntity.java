package hnt_15hcb2.entity;

import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "TransactionDetail")
public class TransactionDetailEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int TransactionID;

    @Size(max = 255)
    @Column(name = "Customer")
    private String Customer;

    @Size(max = 255)
    @Column(name = "ProductName")
    private String ProductName;

    @Column(name = "Price")
    private double Price;

    @Column(name = "ProductNumber")
    private int ProductNumber;

    @Column(name = "Amount")
    private double Amount;

    @Size(max = 255)
    @Column(name = "TransactionType")
    private String TransactionType;

    @Size(max = 255)
    @Column(name = "CreditCardID")
    private String CreditCardID;

    @Size(max = 255)
    @Column(name = "CreditCardType")
    private String CreditCardType;

    @Size(max = 10)
    @Column(name = "MerchantID")
    private String MerchantID;

    @Size(max = 10)
    @Column(name = "MerchantRegionID")
    private String MerchantRegionID;

    @Size(max = 10)
    @Column(name = "MerchantTypeID")
    private String MerchantTypeID;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "Date")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private String Date;

    @Column(name = "Complete")
    private  boolean Complete;

    public int getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(int transactionID) {
        TransactionID = transactionID;
    }

    public String getCustomer() {
        return Customer;
    }

    public void setCustomer(String customer) {
        Customer = customer;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getProductNumber() {
        return ProductNumber;
    }

    public void setProductNumber(int productNumber) {
        ProductNumber = productNumber;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double amount) {
        Amount = amount;
    }

    public String getTransactionType() {
        return TransactionType;
    }

    public void setTransactionType(String transactionType) {
        TransactionType = transactionType;
    }

    public String getCreditCardID() {
        return CreditCardID;
    }

    public void setCreditCardID(String creditCardID) {
        CreditCardID = creditCardID;
    }

    public String getCreditCardType() {
        return CreditCardType;
    }

    public void setCreditCardType(String creditCardType) {
        CreditCardType = creditCardType;
    }

    public String getMerchantID() {
        return MerchantID;
    }

    public void setMerchantID(String merchantID) {
        MerchantID = merchantID;
    }

    public String getMerchantRegionID() {
        return MerchantRegionID;
    }

    public void setMerchantRegionID(String merchantRegionID) {
        MerchantRegionID = merchantRegionID;
    }

    public String getMerchantTypeID() {
        return MerchantTypeID;
    }

    public void setMerchantTypeID(String merchantTypeID) {
        MerchantTypeID = merchantTypeID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public boolean isComplete() {
        return Complete;
    }

    public void setComplete(boolean complete) {
        Complete = complete;
    }
}