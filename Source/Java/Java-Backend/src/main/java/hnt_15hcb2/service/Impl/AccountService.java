package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.AccountEntity;
import hnt_15hcb2.service.IAccountService;

import java.util.List;

public class AccountService implements IAccountService<AccountEntity> {
    @Override
    public void create(AccountEntity accountEntity) throws Exception {

    }

    @Override
    public boolean update(AccountEntity accountEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public AccountEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<AccountEntity> getall() throws Exception {
        return null;
    }
}
