package hnt_15hcb2.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "MerchantRegion")
public class MerchantRegionEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "MerchantRegionID", nullable = false)
    private String MerchantRegionID;

    @Size(max = 255)
    @Column(name = "MerchantRegionName")
    private String MerchantRegionName;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantRegionEntity")
    private Set<MerchantEntity> merchantEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantRegionEntity")
    private Set<DailyReportEntity> dailyReportEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantRegionEntity")
    private Set<MonthlyReportEntity> monthlyReportEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "merchantRegionEntity")
    private Set<YearlyReportEntity> yearlyReportEntity;

    public String getMerchantRegionID() {
        return MerchantRegionID;
    }

    public void setMerchantRegionID(String merchantRegionID) {
        MerchantRegionID = merchantRegionID;
    }

    public String getMerchantRegionName() {
        return MerchantRegionName;
    }

    public void setMerchantRegionName(String merchantRegionName) {
        MerchantRegionName = merchantRegionName;
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
