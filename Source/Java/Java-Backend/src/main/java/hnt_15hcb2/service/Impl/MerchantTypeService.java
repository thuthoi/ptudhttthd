package hnt_15hcb2.service.Impl;

import hnt_15hcb2.dao.Impl.MerchantTypeDAOImpl;
import hnt_15hcb2.entity.MerchantTypeEntity;
import hnt_15hcb2.service.IMerchantTypeService;

import java.util.List;

public class MerchantTypeService implements IMerchantTypeService<MerchantTypeEntity> {

    private MerchantTypeDAOImpl merchantTypeDAO;

    public void setMerchantTypeDAO(MerchantTypeDAOImpl merchantTypeDAO) {
        this.merchantTypeDAO = merchantTypeDAO;
    }

    @Override
    public void create(MerchantTypeEntity merchantTypeEntity) throws Exception {

    }

    @Override
    public boolean update(MerchantTypeEntity merchantTypeEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public MerchantTypeEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<MerchantTypeEntity> getall() throws Exception {
        return merchantTypeDAO.getall(MerchantTypeEntity.class);
    }
}
