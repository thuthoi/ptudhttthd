package hnt_15hcb2.dao;

import java.util.List;

public interface IGenericDAO<T> {
    void create(T t) throws Exception;

    boolean update(T t) throws Exception;

    boolean delete(String id,Class<T> t) throws Exception;

    T get(String id, Class<T> t) throws Exception;

    List<T> getall(Class<T> t) throws Exception;
}
