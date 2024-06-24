package com.recs.repositories.recsbusiness;

import com.recs.models.entities.recsbusiness.AgencyRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AgencyRequestRepository extends JpaRepository<AgencyRequest, String> {
    List<AgencyRequest> getAllByRealEstateRealEstateId(String realEstateId);

    List<AgencyRequest> getAllByRealEstateRealEstateIdAndStatus(String realEstateId, String status);

    List<AgencyRequest> getAllByAgencyAgencyId(String agencyId);

    List<AgencyRequest> getAllByAgencyAgencyIdAndStatus(String agencyId, String status);

    List<AgencyRequest> getAllByAgencyAgencyIdAndStatusIn(String agencyId, List<String> statues);
}
