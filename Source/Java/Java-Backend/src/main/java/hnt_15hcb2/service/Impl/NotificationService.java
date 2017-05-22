package hnt_15hcb2.service.Impl;

import hnt_15hcb2.entity.NotificationEntity;
import hnt_15hcb2.service.INotificationService;

import java.util.List;

public class NotificationService implements INotificationService<NotificationEntity> {
    @Override
    public void create(NotificationEntity notificationEntity) throws Exception {

    }

    @Override
    public boolean update(NotificationEntity notificationEntity) throws Exception {
        return false;
    }

    @Override
    public boolean delete(String id) throws Exception {
        return false;
    }

    @Override
    public NotificationEntity get(String id) throws Exception {
        return null;
    }

    @Override
    public List<NotificationEntity> getall() throws Exception {
        return null;
    }
}
