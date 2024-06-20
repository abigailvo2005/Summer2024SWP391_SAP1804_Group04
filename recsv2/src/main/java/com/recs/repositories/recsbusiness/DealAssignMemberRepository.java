package com.recs.repositories.recsbusiness;

import com.recs.models.entities.recsbusiness.DealAssignMember;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DealAssignMemberRepository extends JpaRepository<DealAssignMember, String> {

    List<DealAssignMember> getByMemberIdAndStatus(String memberId, String status);

    List<DealAssignMember> getByAgencyIdAndStatus(String agencyId, String status);

    List<DealAssignMember> getByMemberId(String memberId);

    List<DealAssignMember> getByAgencyId(String agencyId);

}
