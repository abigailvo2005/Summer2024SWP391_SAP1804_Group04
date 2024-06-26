package com.recs.models.dto.recsbusiness;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.MemberDTO;
import com.recs.models.dto.realestate.RealEstateDTO;
import com.recs.models.entities.recsbusiness.BuyerRequest;
import com.recs.models.enums.BuyerRequestStatus;
import com.recs.utils.RealEstateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BuyerRequestDTO {
    private String requestId;
    private String fullName;
    private String phone;
    private String message;
    private String createDate;
    private BuyerRequestStatus status;
    private MemberDTO member;
    private RealEstateDTO realEstateDTO;

    public static BuyerRequestDTO from(BuyerRequest buyerRequest) {
        BuyerRequestDTO dto = new BuyerRequestDTO();
        dto.setRequestId(buyerRequest.getRequestId());
        dto.setFullName(buyerRequest.getFullName());
        dto.setPhone(buyerRequest.getPhoneNumber());
        dto.setMessage(buyerRequest.getMessage());
        dto.setCreateDate(RealEstateUtils.formatDate(buyerRequest.getCreateTimestamp()));
        dto.setStatus(BuyerRequestStatus.from(buyerRequest.getStatus()));
        dto.setMember(MemberDTO.from(buyerRequest.getMember()));
        dto.setRealEstateDTO(RealEstateDTO.fromRealEstate(buyerRequest.getRealEstate()));
        return dto;
    }
}
