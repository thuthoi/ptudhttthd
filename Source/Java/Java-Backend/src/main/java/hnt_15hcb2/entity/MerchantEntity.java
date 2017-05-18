package hnt_15hcb2.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "Merchant")
public class MerchantEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "MerchantID", nullable = false)
    private String MerchantID;

    @Size(max = 255)
    @Column(name = "MerchantName")
    private String MerchantName;

    @Size(max = 255)
    @Column(name = "Address")
    private String Address;

    @Size(max = 255)
    @Column(name = "Phone")
    private String Phone;

    @Size(max = 255)
    @Column(name = "Email")
    private String Email;

    @Column(name = "Status")
    private boolean Status;

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
    @JoinColumn(name = "AgentID")
    private AgentEntity agentEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantEntity")
    private Set<DailyReportEntity> dailyReportEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantEntity")
    private Set<MonthlyReportEntity> monthlyReportEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantEntity")
    private Set<YearlyReportEntity> yearlyReportEntity;

    public String getMerchantID() {
        return MerchantID;
    }

    public void setMerchantID(String merchantID) {
        MerchantID = merchantID;
    }

    public String getMerchantName() {
        return MerchantName;
    }

    public void setMerchantName(String merchantName) {
        MerchantName = merchantName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean status) {
        Status = status;
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

    public AgentEntity getAgentEntity() {
        return agentEntity;
    }

    public void setAgentEntity(AgentEntity agentEntity) {
        this.agentEntity = agentEntity;
    }

    public Set<DailyReportEntity> getDailyReportEntity() {
        return dailyReportEntity;
    }

    public void setDailyReportEntity(Set<DailyReportEntity> dailyReportEntity) {
        this.dailyReportEntity = dailyReportEntity;
    }

    public Set<MonthlyReportEntity> getMonthlyReportEntity() {
        return monthlyReportEntity;
    }

    public void setMonthlyReportEntity(Set<MonthlyReportEntity> monthlyReportEntity) {
        this.monthlyReportEntity = monthlyReportEntity;
    }

    public Set<YearlyReportEntity> getYearlyReportEntity() {
        return yearlyReportEntity;
    }

    public void setYearlyReportEntity(Set<YearlyReportEntity> yearlyReportEntity) {
        this.yearlyReportEntity = yearlyReportEntity;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        MerchantEntity merchantEntity = (MerchantEntity) obj;
        if (this.MerchantName.trim().equals(merchantEntity.getMerchantName()))
            return true;
        return false;
    }

    @Override
    public String toString() {
        return this.MerchantName;
    }
}
