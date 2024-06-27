package com.recs.models.dto.recsbusiness;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AssignDealRequest {
    private String memberId;
    private String realEstateId;
}
