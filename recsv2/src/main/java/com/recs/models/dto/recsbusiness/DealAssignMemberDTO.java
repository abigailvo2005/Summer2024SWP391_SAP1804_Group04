package com.recs.models.dto.recsbusiness;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.recs.models.dto.account.AgencyDTO;
import com.recs.models.dto.account.MemberDTO;
import com.recs.models.dto.realestate.RealEstateInfo;
import com.recs.models.entities.realestate.PropertyImages;
import com.recs.models.entities.recsbusiness.DealAssignMember;
import com.recs.utils.RealEstateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class DealAssignMemberDTO {
    private String dealId;
    public String createDate;
    private Integer priority;
    private String status;
    private AgencyDTO agency;
    private MemberDTO member;
    private RealEstateInfo realEstate;

    public static DealAssignMemberDTO from(DealAssignMember dealAssignMember) {
        return new DealAssignMemberDTO(
                dealAssignMember.getDealId(),
                RealEstateUtils.formatDate(dealAssignMember.getCreateTimestamp()),
                dealAssignMember.getPriority(),
                dealAssignMember.getStatus(),
                AgencyDTO.from(dealAssignMember.getAgency()),
                MemberDTO.from(dealAssignMember.getMember()),
                RealEstateInfo.fromRealEstate(dealAssignMember.getRealEstate()).toBuilder()
                        .setPropertyImagesList(
                                dealAssignMember.getRealEstate().getImages().stream()
                                        .map(PropertyImages::getUrl)
                                        .toList()
                        )
                        .build()
        );
    }
}
