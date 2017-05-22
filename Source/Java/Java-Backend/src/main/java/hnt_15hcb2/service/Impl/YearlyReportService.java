package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.YearlyReportEntity;
import hnt_15hcb2.service.IYearlyReportService;

import java.util.List;

public class YearlyReportService implements IYearlyReportService<YearlyReportEntity> {
    @Override
    public void create(YearlyReportEntity yearlyReportEntity) throws Exception {

    }

    @Override
    public boolean update(YearlyReportEntity yearlyReportEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public YearlyReportEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<YearlyReportEntity> getall() throws Exception {
        return null;
    }
}
