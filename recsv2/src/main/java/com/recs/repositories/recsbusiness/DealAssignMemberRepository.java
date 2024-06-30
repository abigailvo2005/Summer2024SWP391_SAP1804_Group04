package com.recs.repositories.recsbusiness;


import com.recs.models.entities.recsbusiness.DealAssignMember;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DealAssignMemberRepository extends JpaRepository<DealAssignMember, String> {

    List<DealAssignMember> getByMemberMemberIdAndStatus(String memberId, String status);

    List<DealAssignMember> getByAgencyAgencyIdAndStatus(String agencyId, String status);

    List<DealAssignMember> getByMemberMemberId(String memberId);

    List<DealAssignMember> getByAgencyAgencyId(String agencyId);

    List<DealAssignMember> getByRealEstateRealEstateId(String id);

}
