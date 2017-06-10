package hnt_15hcb2.beanUtils;

import hnt_15hcb2.entity.NotificationEntity;
import hnt_15hcb2.model.NotificationDTO;

import java.util.ArrayList;
import java.util.List;

public class NotificationUtils {
    public List<NotificationDTO> getAll(List<NotificationEntity> notificationEntityList) {
        List<NotificationDTO> notificationDTOList = new ArrayList<NotificationDTO>();
        if (notificationEntityList != null || !notificationEntityList.isEmpty()) {
            for (NotificationEntity entity : notificationEntityList) {
                NotificationDTO dto = new NotificationDTO();
                dto.setDate(entity.getDate());
                dto.setDetail(entity.getDetail());
                dto.setNotiID(entity.getNotiID());
                dto.setReceiverID(entity.getReceiverID());
                dto.setStatus(entity.isStatus());
                dto.setSummary(entity.getSummary());

                notificationDTOList.add(dto);
            }
        }
        return notificationDTOList;
    }
}
