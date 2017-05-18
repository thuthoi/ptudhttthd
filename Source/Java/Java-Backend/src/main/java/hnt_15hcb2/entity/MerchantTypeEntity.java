package hnt_15hcb2.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "MerchantType")
public class MerchantTypeEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "MerchantTypeID", nullable = false)
    private String MerchantTypeID;

    @Size(max = 255)
    @Column(name = "MerchantTypeName")
    private String MerchantTypeName;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantTypeEntity")
    private Set<MerchantEntity> merchantEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantTypeEntity")
    private Set<DailyReportEntity> dailyReportEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantTypeEntity")
    private Set<MonthlyReportEntity> monthlyReportEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantTypeEntity")
    private Set<YearlyReportEntity> yearlyReportEntity;

    public String getMerchantTypeID() {
        return MerchantTypeID;
    }

    public void setMerchantTypeID(String merchantTypeID) {
        MerchantTypeID = merchantTypeID;
    }

    public String getMerchantTypeName() {
        return MerchantTypeName;
    }

    public void setMerchantTypeName(String merchantTypeName) {
        MerchantTypeName = merchantTypeName;
    }

    public Set<MerchantEntity> getMerchantEntity() {
        return merchantEntity;
    }

    public void setMerchantEntity(Set<MerchantEntity> merchantEntity) {
        this.merchantEntity = merchantEntity;
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
}
