package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.DailyReportEntity;
import hnt_15hcb2.service.IDailyReportService;

import java.util.List;

public class DailyReportService implements IDailyReportService<DailyReportEntity> {
    @Override
    public void create(DailyReportEntity dailyReportEntity) throws Exception {

    }

    @Override
    public boolean update(DailyReportEntity dailyReportEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public DailyReportEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<DailyReportEntity> getall() throws Exception {
        return null;
    }
}
