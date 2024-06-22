package com.recs.models.dto.recsbusiness;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgencyRequestCreateDTO {
    private String realEstateId;
    private String agencyMessage;
}
