package hnt_15hcb2.service;

import hnt_15hcb2.entity.MerchantEntity;

public interface IMerchantService<T> extends IGenerateService<T> {
    String updateMerchant(MerchantEntity merchantEntity);
}
