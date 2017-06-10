package hnt_15hcb2.controller;

import hnt_15hcb2.beanUtils.NotificationUtils;
import hnt_15hcb2.model.NotificationDTO;
import hnt_15hcb2.service.Impl.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/api/notification/")
public class NotificationAPI {
    @Autowired
    private NotificationService notificationService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public @ResponseBody List<NotificationDTO> list() {
        try {
            List<NotificationDTO> notificationDTOList = new NotificationUtils().getAll(notificationService.getall());
            return  notificationDTOList;
        } catch (Exception e) {
            e.printStackTrace();;
        }
        return new ArrayList<NotificationDTO>();
    }
}
