package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.MonthlyReportEntity;
import hnt_15hcb2.service.IMonthlyReportService;

import java.util.List;

public class MonthlyReportService implements IMonthlyReportService<MonthlyReportEntity> {
    @Override
    public void create(MonthlyReportEntity monthlyReportEntity) throws Exception {

    }

    @Override
    public boolean update(MonthlyReportEntity monthlyReportEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public MonthlyReportEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<MonthlyReportEntity> getall() throws Exception {
        return null;
    }
}
