package hnt_15hcb2.service.Impl;

import hnt_15hcb2.dao.Impl.MerchantRegionDAOImpl;
import hnt_15hcb2.entity.MerchantRegionEntity;
import hnt_15hcb2.service.IMerchantRegionService;

import java.util.List;

public class MerchantRegionService implements IMerchantRegionService<MerchantRegionEntity> {

    private MerchantRegionDAOImpl merchantRegionDAO;

    public void setMerchantRegionDAO(MerchantRegionDAOImpl merchantRegionDAO) {
        this.merchantRegionDAO = merchantRegionDAO;
    }

    @Override
    public void create(MerchantRegionEntity merchantRegionEntity) throws Exception {

    }

    @Override
    public boolean update(MerchantRegionEntity merchantRegionEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public MerchantRegionEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<MerchantRegionEntity> getall() throws Exception {
        return merchantRegionDAO.getall(MerchantRegionEntity.class);
    }
}
