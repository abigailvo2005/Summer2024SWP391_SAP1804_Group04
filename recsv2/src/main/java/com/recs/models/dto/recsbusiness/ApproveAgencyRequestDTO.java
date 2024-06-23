package com.recs.models.dto.recsbusiness;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApproveAgencyRequestDTO {
    private String realEstateId;
    private List<String> agencyRequestIds;
}
