package hnt_15hcb2.service;

import java.util.List;

public interface IGenerateService<T> {
    void create(T t) throws Exception;

    boolean update(T t) throws Exception;

    boolean delete(String id) throws Exception;

    T get(String id) throws Exception;

    List<T> getall() throws Exception;
}
