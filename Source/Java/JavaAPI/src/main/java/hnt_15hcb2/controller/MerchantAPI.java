package hnt_15hcb2.controller;

import hnt_15hcb2.beanUtils.MerchantUtils;
import hnt_15hcb2.model.MerchantDTO;
import hnt_15hcb2.service.Impl.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/api/merchant/")
public class MerchantAPI {

    @Autowired
    private MerchantService merchantService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public @ResponseBody List<MerchantDTO> list() {
        try {
            List<MerchantDTO> merchantDTOList = new MerchantUtils().getAll(merchantService.getall());
            return merchantDTOList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<MerchantDTO>();
    }
}
