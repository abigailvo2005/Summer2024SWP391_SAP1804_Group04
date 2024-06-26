package com.recs.models.dto.recsbusiness;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyerRequestCreateDTO {
    private String fullName;
    private String phoneNumber;
    private String message;
    private String memberId;
    private String realEstateId;
    private String dealId;
}
