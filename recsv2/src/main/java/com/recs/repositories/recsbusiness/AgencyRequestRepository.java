package com.recs.repositories.recsbusiness;

import com.recs.models.entities.recsbusiness.AgencyRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AgencyRequestRepository extends JpaRepository<AgencyRequest, String> {
    List<AgencyRequest> getAllByRealEstateId(String realEstateId);

    List<AgencyRequest> getAllByRealEstateIdAndStatus(String realEstateId, String status);

    List<AgencyRequest> getAllByAgencyId(String agencyId);

    List<AgencyRequest> getAllByAgencyIdAndStatus(String agencyId, String status);
}
