package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.MasterEntity;
import hnt_15hcb2.service.IMasterService;

import java.util.List;

public class MasterService implements IMasterService<MasterEntity> {
    @Override
    public void create(MasterEntity masterEntity) throws Exception {

    }

    @Override
    public boolean update(MasterEntity masterEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public MasterEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<MasterEntity> getall() throws Exception {
        return null;
    }
}
