package hnt_15hcb2.beanUtils;

import hnt_15hcb2.entity.MerchantEntity;
import hnt_15hcb2.model.MerchantDTO;

import java.util.ArrayList;
import java.util.List;

public class MerchantUtils {
    public List<MerchantDTO> getAll(List<MerchantEntity> merchantEntityList) {
        List<MerchantDTO> merchantDTOList = new ArrayList<MerchantDTO>();
        if (merchantEntityList != null && !merchantEntityList.isEmpty()) {
            for (MerchantEntity entity : merchantEntityList) {
                MerchantDTO dto = new MerchantDTO();
                dto.setAddress(entity.getAddress());
                dto.setAgentID(entity.getAgentEntity() != null ? entity.getAgentEntity().getAgentID() : null);
                dto.setAgentName(entity.getAgentEntity() != null ? entity.getAgentEntity().getAgentName() : null);
                dto.setEmail(entity.getEmail());
                dto.setMerchantRegionID(entity.getMerchantRegionEntity() != null ? entity.getMerchantRegionEntity().getMerchantRegionID() : null);
                dto.setMerchantRegionName(entity.getMerchantRegionEntity() != null ? entity.getMerchantRegionEntity().getMerchantRegionName() : null);
                dto.setMerchantTypeID(entity.getMerchantTypeEntity() != null ? entity.getMerchantTypeEntity().getMerchantTypeID() : null);
                dto.setMerchantTypeName(entity.getMerchantTypeEntity() != null ? entity.getMerchantTypeEntity().getMerchantTypeName() : null);
                dto.setMerchantID(entity.getMerchantID());
                dto.setMerchantName(entity.getMerchantName());
                dto.setPhone(entity.getPhone());
                dto.setStatus(entity.isStatus());

                merchantDTOList.add(dto);
            }
        }
        return merchantDTOList;
    }
}
