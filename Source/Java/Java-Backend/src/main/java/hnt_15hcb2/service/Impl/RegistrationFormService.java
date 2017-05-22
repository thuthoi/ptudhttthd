package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.RegistrationFormEntity;
import hnt_15hcb2.service.IRegistrationFormService;

import java.util.List;

public class RegistrationFormService implements IRegistrationFormService<RegistrationFormEntity> {
    @Override
    public void create(RegistrationFormEntity registrationFormEntity) throws Exception {

    }

    @Override
    public boolean update(RegistrationFormEntity registrationFormEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public RegistrationFormEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<RegistrationFormEntity> getall() throws Exception {
        return null;
    }
}
