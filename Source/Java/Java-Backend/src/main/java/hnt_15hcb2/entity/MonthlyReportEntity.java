package hnt_15hcb2.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

@Entity
@Table(name = "MonthlyReport")
public class MonthlyReportEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ReportID;

    @Column(name = "SaleAmount")
    private double SaleAmount;

    @Column(name = "ReturnAmount")
    private double ReturnAmount;

    @Column(name = "SaleCount")
    private int SaleCount;

    @Column(name = "ReturnCount")
    private int ReturnCount;

    @Column(name = "DebitCardSaleAmount")
    private double DebitCardSaleAmount;

    @Column(name = "MasterCardSaleAmount")
    private double MasterCardSaleAmount;

    @Column(name = "VisaCardSaleAmount")
    private double VisaCardSaleAmount;

    @Column(name = "DebitCardReturnAmount")
    private double DebitCardReturnAmount;

    @Column(name = "MasterCardReturnAmount")
    private double MasterCardReturnAmount;

    @Column(name = "VisaCardReturnAmount")
    private double VisaCardReturnAmount;

    @Column(name = "DebitCardSaleCount")
    private double DebitCardSaleCount;

    @Column(name = "MasterCardSaleCount")
    private double MasterCardSaleCount;

    @Column(name = "VisaCardSaleCount")
    private double VisaCardSaleCount;

    @Column(name = "DebitCardReturnCount")
    private double DebitCardReturnCount;

    @Column(name = "MasterCardReturnCount")
    private double MasterCardReturnCount;

    @Column(name = "VisaCardReturnCount")
    private double VisaCardReturnCount;

    @Column(name = "NetAmount")
    private double NetAmount;

    @Column(name = "NetCount")
    private int NetCount;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "Date")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private String Date;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "MerchantTypeID")
    private MerchantTypeEntity merchantTypeEntity;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "MerchantRegionID")
    private MerchantRegionEntity merchantRegionEntity;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "MerchantID")
    private AgentEntity MerchantID;

    public int getReportID() {
        return ReportID;
    }

    public void setReportID(int reportID) {
        ReportID = reportID;
    }

    public double getSaleAmount() {
        return SaleAmount;
    }

    public void setSaleAmount(double saleAmount) {
        SaleAmount = saleAmount;
    }

    public double getReturnAmount() {
        return ReturnAmount;
    }

    public void setReturnAmount(double returnAmount) {
        ReturnAmount = returnAmount;
    }

    public int getSaleCount() {
        return SaleCount;
    }

    public void setSaleCount(int saleCount) {
        SaleCount = saleCount;
    }

    public int getReturnCount() {
        return ReturnCount;
    }

    public void setReturnCount(int returnCount) {
        ReturnCount = returnCount;
    }

    public double getDebitCardSaleAmount() {
        return DebitCardSaleAmount;
    }

    public void setDebitCardSaleAmount(double debitCardSaleAmount) {
        DebitCardSaleAmount = debitCardSaleAmount;
    }

    public double getMasterCardSaleAmount() {
        return MasterCardSaleAmount;
    }

    public void setMasterCardSaleAmount(double masterCardSaleAmount) {
        MasterCardSaleAmount = masterCardSaleAmount;
    }

    public double getVisaCardSaleAmount() {
        return VisaCardSaleAmount;
    }

    public void setVisaCardSaleAmount(double visaCardSaleAmount) {
        VisaCardSaleAmount = visaCardSaleAmount;
    }

    public double getDebitCardReturnAmount() {
        return DebitCardReturnAmount;
    }

    public void setDebitCardReturnAmount(double debitCardReturnAmount) {
        DebitCardReturnAmount = debitCardReturnAmount;
    }

    public double getMasterCardReturnAmount() {
        return MasterCardReturnAmount;
    }

    public void setMasterCardReturnAmount(double masterCardReturnAmount) {
        MasterCardReturnAmount = masterCardReturnAmount;
    }

    public double getVisaCardReturnAmount() {
        return VisaCardReturnAmount;
    }

    public void setVisaCardReturnAmount(double visaCardReturnAmount) {
        VisaCardReturnAmount = visaCardReturnAmount;
    }

    public double getDebitCardSaleCount() {
        return DebitCardSaleCount;
    }

    public void setDebitCardSaleCount(double debitCardSaleCount) {
        DebitCardSaleCount = debitCardSaleCount;
    }

    public double getMasterCardSaleCount() {
        return MasterCardSaleCount;
    }

    public void setMasterCardSaleCount(double masterCardSaleCount) {
        MasterCardSaleCount = masterCardSaleCount;
    }

    public double getVisaCardSaleCount() {
        return VisaCardSaleCount;
    }

    public void setVisaCardSaleCount(double visaCardSaleCount) {
        VisaCardSaleCount = visaCardSaleCount;
    }

    public double getDebitCardReturnCount() {
        return DebitCardReturnCount;
    }

    public void setDebitCardReturnCount(double debitCardReturnCount) {
        DebitCardReturnCount = debitCardReturnCount;
    }

    public double getMasterCardReturnCount() {
        return MasterCardReturnCount;
    }

    public void setMasterCardReturnCount(double masterCardReturnCount) {
        MasterCardReturnCount = masterCardReturnCount;
    }

    public double getVisaCardReturnCount() {
        return VisaCardReturnCount;
    }

    public void setVisaCardReturnCount(double visaCardReturnCount) {
        VisaCardReturnCount = visaCardReturnCount;
    }

    public double getNetAmount() {
        return NetAmount;
    }

    public void setNetAmount(double netAmount) {
        NetAmount = netAmount;
    }

    public int getNetCount() {
        return NetCount;
    }

    public void setNetCount(int netCount) {
        NetCount = netCount;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public MerchantTypeEntity getMerchantTypeEntity() {
        return merchantTypeEntity;
    }

    public void setMerchantTypeEntity(MerchantTypeEntity merchantTypeEntity) {
        this.merchantTypeEntity = merchantTypeEntity;
    }

    public MerchantRegionEntity getMerchantRegionEntity() {
        return merchantRegionEntity;
    }

    public void setMerchantRegionEntity(MerchantRegionEntity merchantRegionEntity) {
        this.merchantRegionEntity = merchantRegionEntity;
    }

    public AgentEntity getMerchantID() {
        return MerchantID;
    }

    public void setMerchantID(AgentEntity merchantID) {
        MerchantID = merchantID;
    }
}
