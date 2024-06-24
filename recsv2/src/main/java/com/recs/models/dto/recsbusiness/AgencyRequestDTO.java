package com.recs.models.dto.recsbusiness;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.AgencyDTO;
import com.recs.models.dto.realestate.RealEstateDTO;
import com.recs.models.entities.recsbusiness.AgencyRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgencyRequestDTO {
    private String requestId;
    private long createTimestamp;
    private String status;
    private String realEstateId;
    private String message;
    private AgencyDTO agency;
    private RealEstateDTO realEstate;

    public static AgencyRequestDTO from(AgencyRequest request) {
        return new AgencyRequestDTO(
                request.getRequestId(),
                request.getCreateTimestamp(),
                request.getStatus(),
                request.getRealEstate().getRealEstateId(),
                request.getMessage(),
                AgencyDTO.from(request.getAgency()),
                RealEstateDTO.fromRealEstate(request.getRealEstate())
        );
    }
}
